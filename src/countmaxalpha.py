#!/usr/bin/python

countAlpha = [0] * 26
instr = input("Enter a text:")
maxCount = 0
for c in instr:
    if c.isalpha():
        c = c.lower()
        idxNum = ord(c) - ord('a')
        countAlpha[idxNum] += 1
        if countAlpha[idxNum] > maxCount:
            maxCount = countAlpha[idxNum]
for i,j in enumerate(countAlpha):
    if j == maxCount and maxCount > 0:
        print(chr(ord('a') + i))
        break
