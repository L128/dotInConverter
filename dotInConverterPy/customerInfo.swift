//
//  customerInfo.swift
//  dotInConverter
//
//  Created by Haotian Lou on 2022/11/17.
//

import Foundation

struct customer {
    //Fedex identifier:0
    let transactionType: String = "20"
    //Fedex identifier:25
    var referenceNotes: String = "INDIAFG number here"
    init (fromReferenceNotes referenceNotes: String){
        self.referenceNotes = referenceNotes
    }
    //Fedex identifier:1
    var transactionID:String = "Wristcam SN here"
    init (fromTransactionID transactionID:String){
        self.transactionID = transactionID
    }
    //Fedex identifier:38
    var departmentNotes: String = "SKU here"
    init (fromDepartmentNotes departmentNotes:String){
        self.departmentNotes = departmentNotes
    }
    //Fedex identifier:32
    let senderContactName:String = "Steve Zhi"
    //Fedex identifier:183
    let senderPhoneNumber:String = "051263408000"
    //Fedex identifier:4
    let senderCompanyName:String = "ASTEEL FLASH SUZHOU"
    //Fedex identifier:10
    let senderFedexAccount:String = "514640980"
    //Fedex identifier:5
    let senderAddress1:String = "8 Gutang Road"
    //Fedex identifier:6
    let senderAddress2:String = "Wujiang"
    //Fedex identifier:7
    let senderCity:String = "Suzhou"
    //Fedex identifier:9
    let senderPostalCode:String = "215211"
    //Fedex identifier:117
    let senderCountry:String = "CN"
    //Fedex identifier:12
    var recipientContactName:String = "Recipient Contact Name"
    init (fromRecipientContactName recipientContactName:String){
        self.recipientContactName = recipientContactName
    }
    //Fedex identifier:18
    var recipientPhoneNumber:String = "Recipient Phone Number"
    init (fromRecipientPhoneNumber recipientPhoneNumber:String){
        self.recipientPhoneNumber = recipientPhoneNumber
    }
    //Fedex identifier:13
    var recipientAddress1:String = "Recipient Address 1"
    init (fromRecipientAddress1 recipientAddress1:String){
        self.recipientAddress1 = recipientAddress1
    }
    //Fedex identifier:14
    var recipientAddress2:String = "Recipient Address 2"
    init (fromRecipientAddress2 recipientAddress2:String){
        self.recipientAddress2 = recipientAddress2
    }
    //Fedex identifier:15
    var recipientCity:String = "Recipient City"
    init (fromRecipientCity recipientCity:String){
        self.recipientCity = recipientCity
    }
    //Fedex identifier:17
    var recipientPostalCode:String = "Recipient Postal Code"
    init (fromRecipientPostalCode recipientPostalCode:String){
        self.recipientPostalCode = recipientPostalCode
    }
    //Fedex identifier:50
    var recipientCountry:String = "Recipient Country"
    init (fromRecipientCountry recipientCountry:String){
        self.recipientCountry = recipientCountry
    }
    //Fedex identifier:23
    let transportationPaymentType:String = "1"
    //Fedex identifier:70
    let dutyTaxPaymentType:String = "1"
    //Fedex identifier:1273
    let packaging:String = "1"
    //Fedex identifier:1274
    let serviceType:String = "2P"
    //Fedex identifier:116
    let numberOfPackage:String = "1"
    //Fedex identifier:68
    let currency:String = "USD"
    //Fedex identifier:112
    let totalShipmentWeight:String = "10"
    //Fedex identifier:75
    let weightType:String = "KGS"
    //Fedex identifier:79-1
    let description:String = "Wristcam/Digital still image video camera/Final-Assemble-Black-Carton-US"
    //Fedex identifier:81-1
    let harmonizedCode:String = "8525804000"
    //Fedex identifier:82-1
    let quantity:String = "1"
    //Fedex identifier:1030-1
    var commodityUnitValue1:String = "Commodity Unit Value 1"
    init (fromCommodityUnitValue1 commodityUnitValue1:String){
        self.commodityUnitValue1 = commodityUnitValue1
    }
    //Fedex identifier:80-1
    let countryOfManufacture:String = "CN"
    //Fedex identifier:1030-2
    let commodityUnitValue2:String = "0"
    //Fedex identifier:1030-3
    let commodityUnitValue3:String = "0"
    //Fedex identifier:113
    let commericalInvoicePrintFlag:String = "Y"
    //Fedex identifier:2397
    let purposeOfShipment:String = "1"
    //Fedex identifier:414
    let unitOfMeasure:String = "BOX"
    //Fedex identifier:1202
    var recipientEmailAddress:String = "Recipient's Email Address"
    init (fromRecipientEmailAddress recipientEmailAddress:String){
        self.recipientEmailAddress = recipientEmailAddress
    }
    //Fedex identifier:2806
    let ETDIndicator:String = "Y"
    //Fedex identifier:72
    let termsOfSale:String = "9"
    //Fedex identifier:4099
    let termsOfSaleDescription:String = "DDP"
    //Fedex identifier:6112
    let digitalCompanyLogoIndicator:String = "Y"
    //Fedex identifier:6114
    let digitalCompanyLogoImagePath:String = "C:\\fedex\\letterhead\\title.jpg"
    //Fedex identifier:6115
    let digitalSignatureImagePath:String = "C:\\fedex\\letterhead\\signature.bmp"
    //Fedex identifier:99
    let theEnd:String = ""
}


struct listOfCustomers{
    
}
