# Hello world of MTE
* Xcode-v12.0-Beta1
* compile with MTE enabled

1. run: `make`
2. drag binary to IDA Pro
3. disassemble with llvm 10.0
```
// 0x9AC813E8
echo "0xE8 0x13 0xC8 0x9A" | llvm-mc --disassemble -triple=arm64 -mattr=mte
IRG	X8, SP, X8

// 0x91810108
echo "0x08 0x01 0x81 0x91" | llvm-mc --disassemble -triple=arm64 -mattr=mte
ADDG	X8, X8, #16, #0

// 0xD9200908
echo "0x08 0x09 0x20 0xD9" | llvm-mc --disassemble -triple=arm64 -mattr=mte
STG	X8, [X8]

// 0x52800009
echo "0x09 0x00 0x80 0x52" | llvm-mc --disassemble -triple=arm64 -mattr=mte
MOV	W9, #0
```