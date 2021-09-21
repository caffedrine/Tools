# Basics of buffer overflow

## Stack based buffer overflow
Stack is used for static memory allocation.

### Stack operations:
a. PUSH - write to the stack
b. POP - read from the stack

### Stack memory registers:
a. EBP - Extended Base Pointer - address of first element on stack
b. ESP - Extended Stack Pointer - address of next data element to be stored on stack
c. EIP - Extended Instruction Pointer - address of next instruction to be stored
d. ESI - Extended source Index - source index for string operations
e. EDI - Extended Destination Index - destination os index for string operations

### Steps to exploit buffer overflow
1. Perform spilking - send crafted payload to make app crash - used to identify vulnerability.
2. Perform fuzzing
3. Identify the offset - identify the offset where EIP is overwritten
4. Overwrite EIP register  
5. Identify bad characters - identify bad characters that may cause issue in shell code (such as \x00 - no byte)
6. Identify the right nodule - identify module that lacks memory protection (e.g. mona.py module for Immunity debugger)
7. Generate shellcode - use msfvenom to generate shell code
8. Gain root access

## Heap based buffer overflow
Heap is used for dynamic memory alloction.`


# Detection tools
1. OllyDBG
2. Veracode
3. Flawfinder
4. Kiwuan
5. Splint
6. BOVSTT