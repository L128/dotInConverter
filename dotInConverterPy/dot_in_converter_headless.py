from customerinfo import CustomerInfo
import sys
import csv

ROWNUM = 27

targetCSV = str(sys.argv[1])
outputDir = str(sys.argv[2])

with open(targetCSV, 'r') as f:
    reader = csv.reader(f)
    for row in reader:
        user = CustomerInfo()
        user.initFromRecipientEmailAddress(row[2])
        user.initFromRecipientContactName(row[3])
        user.initFromRecipientAddress1(row[4])
        user.initFromRecipientAddress2(row[5])
        user.initFromRecipientCity(row[6])
        user.initFromRecipientCountry(row[7])
        user.initFromRecipientPostalCode(row[8])
        user.initFromRecipientPhoneNumber(row[9])
        user.initFromReferenceNotes(row[12])
        user.initFromCommodityUnitValue1(row[23])
        user.initFromDepartmentNotes(row[26])
        user.dotInGenerate(outputDir)