//
//  GlobalEnvironment.swift
//  dotInConverter
//
//  Created by Haotian Lou on 2022/11/19.
//

import SwiftUI
import Foundation
import UniformTypeIdentifiers
import Accessibility


class GlobalEnvironment: ObservableObject {
    
    @Published var displayUrl = GlobalEnvironment.defaultDisplay
    @Published var csvUrl = GlobalEnvironment.defaultUrl
    @Published var customerList = GlobalEnvironment.defaultCustomerList
    @Published var alert = false
    @Published var errorMsg = ""


    static let defaultDisplay = "Please select one CSV with logistic details."
    static let defaultUrl = URL(string: "")
    static let defaultCustomerList: [customer] = []
        
    func updateUrl(_ urlFromPanel: URL?) {
        displayUrl = urlFromPanel?.absoluteString ?? GlobalEnvironment.defaultDisplay
        csvUrl = urlFromPanel?.absoluteURL ?? GlobalEnvironment.defaultUrl
    }
    
    func updateCustomerList(){
        self.customerList = GlobalEnvironment.defaultCustomerList
        if ((self.csvUrl?.isFileURL) != nil) {
            do{
                let csvData =  try String(contentsOf: self.csvUrl!)
                var dataLines:[String] = csvData.components(separatedBy: "\r\n")
                dataLines.removeAll{$0.isEmpty}
                for dataLine in dataLines {
                    var dataList:[String] = dataLine.components(separatedBy: ",")
                    dataList = mergeBetweenQuotes(subList: dataList)
//import items per customer
                    let referenceNotes:String = try getIndex(index: 0, row: dataList)
                    let departmentNotes:String = try getIndex(index: 9, row: dataList)
                    let recipientContactName:String = try getIndex(index: 1, row: dataList)
                    let recipientPhoneNumber:String = try getIndex(index: 7, row: dataList)
                    let recipientAddress1:String = try getIndex(index: 2, row: dataList)
                    let recipientAddress2:String = try getIndex(index: 3, row: dataList)
                    let recipientCity:String = try getIndex(index: 4, row: dataList)
                    let recipientPostalCode:String = try getIndex(index: 6, row: dataList)
                    let recipientCountry:String = try getIndex(index: 5, row: dataList)
                    let commodityUnitValue1:String = try getIndex(index: 12, row: dataList)
                    let recipientEmailAddress:String = try getIndex(index: 8, row: dataList)
//validate each item
//                    for data in dataList {
//                        try checkIllegal(data: data, charSet: NSCharacterSet.illegalCharacters)
//                        try checkIllegal(data: data, charSet: NSCharacterSet.symbols)
//                    }
                    
                    let charSetEnglish = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- ")
                    for data in [recipientContactName,
                                 recipientPostalCode,
                                 recipientCountry] {
                        try checkLegal(data: data, charSet: charSetEnglish)
                        
                    }
                    
                    let charSetEnglishAddr = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ,.-/")
                    for data in [recipientCity,
                                 recipientAddress1,
                                 recipientAddress2] {
                        try checkLegal(data: data, charSet: charSetEnglishAddr)
                        
                    }
                    
                    for data in [recipientPhoneNumber,
                                 commodityUnitValue1] {
                        try checkLegal(data: data, charSet: NSCharacterSet.decimalDigits)
                    }
                    
                    try checkMaxLength(data: referenceNotes, max: 35)
                    try checkMaxLength(data: departmentNotes, max: 35)
                    try checkMaxLength(data: recipientContactName, max: 35)
                    try checkMaxLength(data: recipientPhoneNumber, max: 15)
                    try checkMaxLength(data: recipientAddress1, max: 35)
                    try checkMaxLength(data: recipientAddress2, max: 35)
                    try checkMaxLength(data: recipientCity, max: 35)
                    try checkMaxLength(data: recipientPostalCode, max: 10)
                    try checkMaxLength(data: recipientCountry, max: 2)
                    try checkMaxLength(data: commodityUnitValue1, max: 15)
                    try checkMaxLength(data: recipientEmailAddress, max: 80)
                    try checkMinLength(data: recipientPostalCode, min: 5)
//   initiate the class
                    self.customerList.append(customer.init(referenceNotes: referenceNotes,
                                                           departmentNotes: departmentNotes,
                                                           recipientContactName: recipientContactName,
                                                           recipientPhoneNumber: recipientPhoneNumber,
                                                           recipientAddress1: recipientAddress1,
                                                           recipientAddress2: recipientAddress2,
                                                           recipientCity: recipientCity,
                                                           recipientPostalCode: recipientPostalCode,
                                                           recipientCountry: recipientCountry,
                                                           commodityUnitValue1: commodityUnitValue1,
                                                           recipientEmailAddress: recipientEmailAddress))
                }
            }
            catch{
                if self.errorMsg == "" {
                    self.errorMsg = "\(error)"
                }
                self.alert = true
            }
        }
    }
    
    func getIndex(index: Int, row: [String]) throws -> String {
        if index < row.count {
            return row[index]
        }
        else {
            throw csvErrors.indexOutOfRange
        }
    }
    
    func mergeBetweenQuotes(subList: [String]) -> [String]{
        let subListVar = subList
        if let i = subListVar.firstIndex(where: {$0.contains("\"")}) {
            if subListVar[0].hasPrefix("\"") {
                if subListVar[0].hasSuffix("\"") {
                    return [subListVar[0].trimmingCharacters(in: CharacterSet(charactersIn: "\""))] + mergeBetweenQuotes(subList: Array(subList[1...]))
                }
                else {
                    return mergeBetweenQuotes(subList: [subListVar[0] + "," + subListVar[1]] + Array(subList[2...]))
                }
            }
            else {
                return Array(subListVar[...(i-1)]) + mergeBetweenQuotes(subList: Array(subList[i...]))
            }
        }
        else {
            return subList
        }
    }
                                 
    func checkIllegal(data: String, charSet: CharacterSet) throws {
        if (data.rangeOfCharacter(from: charSet) != nil){
            self.errorMsg = "\(data) contains illegal character"
            throw csvErrors.illegalCharacter
        }
    }
    
    func checkLegal(data: String, charSet: CharacterSet) throws {
        for char in data.unicodeScalars {
            if charSet.contains(char) == false {
                print(char)
                self.errorMsg = "\(data) contains illegal character"
                throw csvErrors.illegalCharacter
            }
        }
    }
    
    func checkMaxLength(data: String, max: Int) throws {
        if data.count > max {
            self.errorMsg = "\(data) exceeds maximum length"
            throw csvErrors.exceedMaxLength
        }
    }
    
    func checkMinLength(data: String, min: Int) throws {
        if data.count < min {
            self.errorMsg = "\(data) is too short"
            throw csvErrors.tooShort
        }
    }
                    
    
    enum csvErrors: Error {
        case indexOutOfRange
        case illegalCharacter
        case exceedMaxLength
        case tooShort
    }
}


