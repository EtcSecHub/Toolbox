#!/usr/bin/env python3
# Simple IP to HEX converter

IPin = input("Enter IP to obfuscate: ")
try:
    IPlist = IPin.split('.')
    print("0x",end='')
    for i in IPlist:
        print("{:02x}".format(int(i)),end='')
    print()
except:
    print("Invalid Input")
