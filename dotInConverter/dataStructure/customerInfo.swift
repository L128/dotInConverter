//
//  customerInfo.swift
//  dotInConverter
//
//  Created by Haotian Lou on 2022/11/17.
//

import Foundation

struct customer: Hashable {
    //Fedex identifier:0
    let transactionType: String = "20"
    //Fedex identifier:25
    var referenceNotes: String
//    init (fromReferenceNotes referenceNotes: String){
//        self.referenceNotes = referenceNotes
//    }
    //Fedex identifier:1
    var transactionID: String
//    init (fromTransactionID transactionID: String){
//        self.transactionID = transactionID
//    }
    //Fedex identifier:38
    var departmentNotes: String
//    init (fromDepartmentNotes departmentNotes: String){
//        self.departmentNotes = departmentNotes
//    }
    //Fedex identifier:32
    let senderContactName: String = "Steve Zhi"
    //Fedex identifier:183
    let senderPhoneNumber: String = "051263408000"
    //Fedex identifier:4
    let senderCompanyName: String = "ASTEEL FLASH SUZHOU"
    //Fedex identifier:10
    let senderFedexAccount: String = "514640980"
    //Fedex identifier:5
    let senderAddress1: String = "8 Gutang Road"
    //Fedex identifier:6
    let senderAddress2: String = "Wujiang"
    //Fedex identifier:7
    let senderCity: String = "Suzhou"
    //Fedex identifier:9
    let senderPostalCode: String = "215211"
    //Fedex identifier:117
    let senderCountry: String = "CN"
    //Fedex identifier:12
    var recipientContactName: String
//    init (fromRecipientContactName recipientContactName: String){
//        self.recipientContactName = recipientContactName
//    }
    //Fedex identifier:18
    var recipientPhoneNumber: String
//    init (fromRecipientPhoneNumber recipientPhoneNumber: String){
//        self.recipientPhoneNumber = recipientPhoneNumber
//    }
    //Fedex identifier:13
    var recipientAddress1: String
//    init (fromRecipientAddress1 recipientAddress1: String){
//        self.recipientAddress1 = recipientAddress1
//    }
    //Fedex identifier:14
    var recipientAddress2: String
//    init (fromRecipientAddress2 recipientAddress2: String){
//        self.recipientAddress2 = recipientAddress2
//    }
    //Fedex identifier:15
    var recipientCity: String
//    init (fromRecipientCity recipientCity: String){
//        self.recipientCity = recipientCity
//    }
    //Fedex identifier:17
    var recipientPostalCode: String
//    init (fromRecipientPostalCode recipientPostalCode: String){
//        self.recipientPostalCode = recipientPostalCode
//    }
    //Fedex identifier:50
    var recipientCountry: String
//    init (fromRecipientCountry recipientCountry: String){
//        self.recipientCountry = recipientCountry
//    }
    //Fedex identifier:23
    let transportationPaymentType: String = "1"
    //Fedex identifier:70
    let dutyTaxPaymentType: String = "1"
    //Fedex identifier:1273
    let packaging: String = "1"
    //Fedex identifier:1274
    let serviceType: String = "2P"
    //Fedex identifier:116
    let numberOfPackage: String = "1"
    //Fedex identifier:68
    let currency: String = "USD"
    //Fedex identifier:112
    let totalShipmentWeight: String = "10"
    //Fedex identifier:75
    let weightType: String = "KGS"
    //Fedex identifier:79-1
    let description: String = "Wristcam/Digital still image video camera/Final-Assemble-Black-Carton-US"
    //Fedex identifier:81-1
    let harmonizedCode: String = "8525804000"
    //Fedex identifier:82-1
    let quantity: String = "1"
    //Fedex identifier:1030-1
    var commodityUnitValue1: String
//    init (fromCommodityUnitValue1 commodityUnitValue1: String){
//        self.commodityUnitValue1 = commodityUnitValue1
//    }
    //Fedex identifier:80-1
    let countryOfManufacture: String = "CN"
    //Fedex identifier:1030-2
    let commodityUnitValue2: String = "0"
    //Fedex identifier:1030-3
    let commodityUnitValue3: String = "0"
    //Fedex identifier:113
    let commericalInvoicePrintFlag: String = "Y"
    //Fedex identifier:2397
    let purposeOfShipment: String = "1"
    //Fedex identifier:414
    let unitOfMeasure: String = "BOX"
    //Fedex identifier:1202
    var recipientEmailAddress: String
//    init (fromRecipientEmailAddress recipientEmailAddress: String){
//        self.recipientEmailAddress = recipientEmailAddress
//    }
    //Fedex identifier:2806
    let ETDIndicator: String = "Y"
    //Fedex identifier:72
    let termsOfSale: String = "9"
    //Fedex identifier:4099
    let termsOfSaleDescription: String = "DDP"
    //Fedex identifier:6112
    let digitalCompanyLogoIndicator: String = "Y"
    //Fedex identifier:6114
    let digitalCompanyLogoImagePath: String = "C:\\fedex\\letterhead\\title.jpg"
    //Fedex identifier:6115
    let digitalSignatureImagePath: String = "C:\\fedex\\letterhead\\signature.bmp"
    //Fedex identifier:99
    let theEnd: String = ""
    
    init (referenceNotes: String  = "INDIAFG number here",
          transactionID: String  = "Wristcam SN here",
          departmentNotes: String = "SKU here",
          recipientContactName: String = "Recipient Contact Name",
          recipientPhoneNumber: String = "Recipient Phone Number",
          recipientAddress1: String = "Recipient Address 1",
          recipientAddress2: String = "Recipient Address 2",
          recipientCity: String = "Recipient City",
          recipientPostalCode: String = "Recipient Postal Code",
          recipientCountry: String = "Recipient Country",
          commodityUnitValue1: String = "Commodity Unit Value 1",
          recipientEmailAddress: String = "Recipients Email Address") {
        self.referenceNotes = referenceNotes
        self.transactionID = transactionID
        self.departmentNotes = departmentNotes
        self.recipientContactName = recipientContactName
        self.recipientPhoneNumber = recipientPhoneNumber
        self.recipientAddress1 = recipientAddress1
        self.recipientAddress2 = recipientAddress2
        self.recipientCity = recipientCity
        self.recipientPostalCode = recipientPostalCode
        self.recipientCountry = recipientCountry
        self.commodityUnitValue1 = commodityUnitValue1
        self.recipientEmailAddress = recipientEmailAddress

    }
    
    func toIn() ->[String] {
        return ["0,\"\(self.transactionType)\"",
                "25,\"\(self.referenceNotes)\"",
                "1,\"\(self.transactionID)\"",
                "38,\"\(self.departmentNotes)\"",
                "32,\"\(self.senderContactName)\"",
                "183,\"\(self.senderPhoneNumber)\"",
                "4,\"\(self.senderCompanyName)\"",
                "10,\"\(self.senderFedexAccount)\"",
                "5,\"\(self.senderAddress1)\"",
                "6,\"\(self.senderAddress2)\"",
                "7,\"\(self.senderCity)\"",
                "9,\"\(self.senderPostalCode)\"",
                "117,\"\(self.senderCountry)\"",
                "12,\"\(self.recipientContactName)\"",
                "18,\"\(self.recipientPhoneNumber)\"",
                "13,\"\(self.recipientAddress1)\"",
                "14,\"\(self.recipientAddress2)\"",
                "15,\"\(self.recipientCity)\"",
                "17,\"\(self.recipientPostalCode)\"",
                "50,\"\(self.recipientCountry)\"",
                "23,\"\(self.transportationPaymentType)\"",
                "70,\"\(self.dutyTaxPaymentType)\"",
                "1273,\"\(self.packaging)\"",
                "1274,\"\(self.serviceType)\"",
                "116,\"\(self.numberOfPackage)\"",
                "68,\"\(self.currency)\"",
                "112,\"\(self.totalShipmentWeight)\"",
                "75,\"\(self.weightType)\"",
                "79-1,\"\(self.description)\"",
                "81-1,\"\(self.harmonizedCode)\"",
                "82-1,\"\(self.quantity)\"",
                "1030-1,\"\(self.commodityUnitValue1)\"",
                "80-1,\"\(self.countryOfManufacture)\"",
                "1030-2,\"\(self.commodityUnitValue2)\"",
                "1030-3,\"\(self.commodityUnitValue3)\"",
                "113,\"\(self.commericalInvoicePrintFlag)\"",
                "2397,\"\(self.purposeOfShipment)\"",
                "414,\"\(self.unitOfMeasure)\"",
                "1202,\"\(self.recipientEmailAddress)\"",
                "2806,\"\(self.ETDIndicator)\"",
                "72,\"\(self.termsOfSale)\"",
                "4099,\"\(self.termsOfSaleDescription)\"",
                "6112,\"\(self.digitalCompanyLogoIndicator)\"",
                "6114,\"\(self.digitalCompanyLogoImagePath)\"",
                "6115,\"\(self.digitalSignatureImagePath)\"",
                "99,\"\(self.theEnd)\""]
    }
}


//struct listOfCustomers{
//    
//}
