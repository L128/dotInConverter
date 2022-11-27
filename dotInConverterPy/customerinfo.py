class FedexIdentifier:
    # def __int__(self, value: str, identifier: str):
    def __init__(self, value, identifier):
        self.value = value
        self.identifier = identifier


class CustomerInfo:
    def __init__(self):
        # Fedex identifier: 0
        self.transactionType = FedexIdentifier("20", "0")
        # Fedex identifier: 25
        self.referenceNotes = FedexIdentifier("INDIAFG number here", "25")
        # Fedex identifier: 1
        self.transactionID = FedexIdentifier("Wristcam SN here", "1")
        # Fedex identifier: 38
        self.departmentNotes = FedexIdentifier("SKU here", "38")
        # Fedex identifier: 32
        self.senderContactName = FedexIdentifier("Steve Zhi", "32")
        # Fedex identifier: 183
        self.senderPhoneNumber = FedexIdentifier("051263408000", "183")
        # Fedex identifier: 4
        self.senderCompanyName = FedexIdentifier("ASTEEL FLASH SUZHOU", "4")
        # Fedex identifier: 10
        self.senderFedexAccount = FedexIdentifier("514640980", "10")
        # Fedex identifier: 5
        self.senderAddress1 = FedexIdentifier("8 Gutang Road", "5")
        # Fedex identifier: 6
        self.senderAddress2 = FedexIdentifier("Wujiang", "6")
        # Fedex identifier: 7
        self.senderCity = FedexIdentifier("Suzhou", "7")
        # Fedex identifier: 9
        self.senderPostalCode = FedexIdentifier("215211", "9")
        # Fedex identifier: 117
        self.senderCountry = FedexIdentifier("CN", "117")
        # Fedex identifier: 12
        self.recipientContactName = FedexIdentifier("Recipient Contact Name", "12")
        # Fedex identifier: 18
        self.recipientPhoneNumber = FedexIdentifier("Recipient Phone Number", "18")
        # Fedex identifier: 13
        self.recipientAddress1 = FedexIdentifier("Recipient Address 1", "13")
        # Fedex identifier: 14
        self.recipientAddress2 = FedexIdentifier("Recipient Address 2", "14")
        # Fedex identifier: 15
        self.recipientCity = FedexIdentifier("Recipient City", "15")
        # Fedex identifier: 17
        self.recipientPostalCode = FedexIdentifier("Recipient Postal Code", "17")
        # Fedex identifier: 50
        self.recipientCountry = FedexIdentifier("Recipient Country", "50")
        # Fedex identifier: 23
        self.transportationPaymentType = FedexIdentifier("1", "23")
        # Fedex identifier: 70
        self.dutyTaxPaymentType = FedexIdentifier("1", "70")
        # Fedex identifier: 1273
        self.packaging = FedexIdentifier("1", "1273")
        # Fedex identifier: 1274
        self.serviceType = FedexIdentifier("2P", "1274")
        # Fedex identifier: 116
        self.numberOfPackage = FedexIdentifier("1", "116")
        # Fedex identifier: 68
        self.currency = FedexIdentifier("USD", "68")
        # Fedex identifier: 112
        self.totalShipmentWeight = FedexIdentifier("10", "112")
        # Fedex identifier: 75
        self.weightType = FedexIdentifier("KGS", "75")
        # Fedex identifier: 79 - 1
        self.description1 = FedexIdentifier("Wristcam/Digital still image video camera/Final-Assemble-Black-Carton-US", "79-1")
        # Fedex identifier: 81 - 1
        self.harmonizedCode = FedexIdentifier("8525804000", "81-1")
        # Fedex identifier: 82 - 1
        self.quantity = FedexIdentifier("1", "82-1")
        # Fedex identifier: 1030 - 1
        self.commodityUnitValue1 = FedexIdentifier("Commodity Unit Value 1", "1030-1")
        # Fedex identifier: 80 - 1
        self.countryOfManufacture = FedexIdentifier("CN", "80-1")
        # Fedex identifier: 1030 - 2
        self.commodityUnitValue2 = FedexIdentifier("0", "1030-2")
        # Fedex identifier: 1030 - 3
        self.commodityUnitValue3 = FedexIdentifier("0", "1030-3")
        # Fedex identifier: 113
        self.commericalInvoicePrintFlag = FedexIdentifier("Y", "113")
        # Fedex identifier: 2397
        self.purposeOfShipment = FedexIdentifier("1", "2397")
        # Fedex identifier: 414
        self.unitOfMeasure = FedexIdentifier("BOX", "414")
        # Fedex identifier: 1202
        self.recipientEmailAddress = FedexIdentifier("", "1202")
        # Fedex identifier: 2806
        self.ETDIndicator = FedexIdentifier("Y", "2806")
        # Fedex identifier: 72
        self.termsOfSale = FedexIdentifier("9", "72")
        # Fedex identifier: 4099
        self.termsOfSaleDescription = FedexIdentifier("DDP", "4099")
        # Fedex identifier: 6112
        self.digitalCompanyLogoIndicator = FedexIdentifier("Y", "6112")
        # Fedex identifier: 6114
        self.digitalCompanyLogoImagePath = FedexIdentifier("C:\\fedex\\letterhead\\title.jpg", "6114")
        # Fedex identifier: 6115
        self.digitalSignatureImagePath = FedexIdentifier("C:\\fedex\\letterhead\\signature.bmp", "6115")
        # Fedex identifier: 99
        self.theEnd = FedexIdentifier("", "99")

    # def __dict__(self):
    #     return self.value

    def getAttrWithDotInFormat(self, attr_str):
        try:
            subclass = self.__getattribute__(attr_str)
            resultStr = subclass.__getattribute__("identifier") + ',\"' + subclass.__getattribute__("value") + '\"\n'
            return resultStr
        except Exception as e:
            print(e)

    def initFromReferenceNotes(self, reference_notes):
        self.referenceNotes.value = reference_notes

    # def initFromTransactionID(self, transaction_id):
    #     self.transactionID.value = transaction_id

    def initFromDepartmentNotes(self, department_notes):
        self.departmentNotes.value = department_notes

    def initFromRecipientContactName(self, recipient_contact_name):
        self.recipientContactName.value = recipient_contact_name

    def initFromRecipientPhoneNumber(self, recipient_phone_number):
        if len(recipient_phone_number) <= 15:
            self.recipientPhoneNumber.value = recipient_phone_number
        else:
            raise ValueError("Recipient Phone Number should have less than 15 letters")

    def initFromRecipientAddress1(self, recipient_address_1):
        if len(recipient_address_1) <= 35:
            self.recipientAddress1.value = recipient_address_1
        else:
            raise ValueError("Address Line 1 should have less than 35 letters")

    def initFromRecipientAddress2(self, recipient_address_2):
        if len(recipient_address_2) <= 35:
            self.recipientAddress2.value = recipient_address_2
        else:
            raise ValueError("Address Line 2 should have less than 35 letters")

    def initFromRecipientCity(self, recipient_city):
        self.recipientCity.value = recipient_city

    def initFromRecipientPostalCode(self, recipient_postal_code):
        if len(recipient_postal_code) <= 10:
            self.recipientPostalCode.value = recipient_postal_code
        else:
            raise ValueError("Recipient Postal Code should have less than 10 letters")

    def initFromRecipientCountry(self, recipient_country):
        if len(recipient_country) == 2:
            self.recipientCountry.value = recipient_country
        else:
            raise ValueError("Country Row should have only TWO letters")

    def initFromCommodityUnitValue1(self, commodity_unit_value_1):
        self.commodityUnitValue1.value = commodity_unit_value_1

    def initFromRecipientEmailAddress(self, recipient_email_address):
        self.recipientEmailAddress.value = recipient_email_address

    def dotInGenerate(self, directory):
        filename = directory + self.referenceNotes.__getattribute__("value") + ".in"
        with open(filename, 'w') as inFile:
            for attr, value in self.__dict__.items():
                if attr != "theEnd":
                    inFile.writelines(self.getAttrWithDotInFormat(attr))
            inFile.writelines(self.getAttrWithDotInFormat("theEnd"))

