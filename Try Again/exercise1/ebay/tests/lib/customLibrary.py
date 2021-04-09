from re import sub
from decimal import Decimal

def BorrowerId(data):
    url = str(data)
    value = url.rsplit('/', 1)[-1]
    return value

def Trim_Symbols(data):
    symbol = sub('[^0-9]', '', data)
    return symbol

def rupiah_format(data):
    result = str(data)
    if len(result) <= 3:
        return 'Rp. ' + result
    else:
        x = result[-3:]
        y = result[:-3]
        return rupiah_format(y) + ',' + (x)

def replace_string(data):
    value = str(data)
    symbol = 'Rp. ,'
    for char in symbol:
        value = value.replace(char,'')
    return value

def replace_number(data):
    value = str(data)
    symbol = '1234567890 '
    for char in symbol:
        value = value.replace(char,'')
    return value

def replace_comma(data):
    value = str(data)
    symbol = ','
    for char in symbol:
        value = value.replace(char,'')
    return value