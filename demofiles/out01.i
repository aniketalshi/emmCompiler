JMP begin
_S_a: MOVL _S_START R005
STI R005 R000           // Return Addr Pushed on Stack
SUB R000 4 R000
INI R005           // READ Event Parameter Input
STI R005 R000           // Parameter Pushed on Stack
SUB R000 4 R000
INI R005           // READ Event Parameter Input
STI R005 R000           // Parameter Pushed on Stack
SUB R000 4 R000
JMP _event_a

_S_START: PRTS "\nEnter event name ('0' for exit):"
IN R005
JMPC EQ R005 97 _S_a
JMPC EQ R005 48 _S_END
PRTS "Invalid Input\n"
JMP _S_START

begin: MOVI  10000 R000           // RSP Initialized
JMP global

// Function/Event Module begins
_event_a: ADD  R000 4  R000
LDI  R000 R020           // Parameter Poped from Stack
ADD  R000 4  R000
LDI  R000 R021           // Parameter Poped from Stack
PRTS "\nFirst Param :"
PRTI R021
STI  R021  R000
SUB  R000 4  R000
STI  R020  R000
SUB  R000 4  R000
MOVL L13 R022
STI  R022  R000           // Return Addr Pushed on Stack
SUB  R000 4  R000
STI R021  R000           // Parameter Pushed on Stack
SUB  R000 4  R000
JMP  fac
L13: ADD  R000 4  R000
LDI  R000 R020
ADD  R000 4  R000
LDI  R000 R021
MOVI  R001 R023
L11: MOVI R023 R021
PRTS "\nResult(fac) :"
PRTI R021
STI  R023  R000
SUB  R000 4  R000
STI  R022  R000
SUB  R000 4  R000
MOVL L14 R024
STI  R024  R000           // Return Addr Pushed on Stack
SUB  R000 4  R000
STI 0  R000           // Parameter Pushed on Stack
SUB  R000 4  R000
STI R021  R000           // Parameter Pushed on Stack
SUB  R000 4  R000
JMP  bar
L14: ADD  R000 4  R000
LDI  R000 R022
ADD  R000 4  R000
LDI  R000 R023
MOVI  R001 R025
L12: MOVI R025 R021
PRTS "\nResult(fac) :"
PRTI R021
ADD  R000 4  R000
LDI  R000  R004           // Return Addr Poped from Stack
JMPI  R004
// Function/Event Module Ends

// Function/Event Module begins
bar: ADD  R000 4  R000
LDI  R000 R026           // Parameter Poped from Stack
ADD  R000 4  R000
LDI  R000 R027           // Parameter Poped from Stack
MOVI 3 R028
MOVI 3 R029
MOVI 1000 R030
MOVI 1001 R031
MOVI 1001 R032
MUL R026 3 R033
MOVI R033 R034
MOVI -1000 R035
MOVI -1000 R036
MOVI 0 R037
MOVIF 0 F011
MOVF F011 F010
MOVI 5 R038
MOVI 5 R039
MOVI 0 R040
MOVI 0 R041
MOVI 0 R042
MOVI 1 R043
MOVI 1 R044
MOVI 0 R045
MOVI 0 R046
MOVI R026  R003
MOVI 3  R002
L16: JMPC GT 1  R002 L15
MUL  R003 2  R003
SUB  R002 1  R002
JMP L16
L15: MOVI  R003 R047
MOVI R047 R048
MOVI 25 R049
MOVI 25 R050
MOVI 1 R051
MOD R026 3 R052
MUL 1001 R033 R053
DIV R053 3 R054
SUB R052 R054 R055
MOVI 1002001 R056
DIV R055 1002001 R057
MOVIF R057 F013
MOVF F013 F012
MOVI 1 R026
PRTS "\n a: "
PRTI R026
PRTS "\n b: "
PRTI R029
PRTS "\n c: "
PRTI R032
PRTS "\n d: "
PRTI R034
PRTS "\n e: "
PRTI R036
PRTS "\n f: "
PRTF F010
PRTS "\n g: "
PRTI R039
MOVI 5 R029
PRTS "\n b again"
PRTI R029
PRTS "\n h: "
PRTI R041
PRTS "\n i: "
PRTI R044
PRTS "\n j: "
PRTI R046
PRTS "\n a again: "
PRTI R026
PRTS "\n l: "
PRTI R048
PRTS "\n m: "
PRTI R050
PRTS "\n n: "
PRTF F012
MOVI R027 R058
JMPC NE R058 0 L9
JMP L8
L9: JMPC NE R051 0 L7
JMP L8
L7: MOVI 1000 R026
JMP L6
L8: MOVI 99 R026
L6: JMPC EQ R051 0 L18
MOVI 0 R059 
JMP L17
L18: MOVI 1 R059
L17: JMPC EQ R058 0 L20
JMPC EQ R059 0 L20
MOVI 1 R060
JMP L19
L20: MOVI 0 R060
L19: JMPC EQ R039 R029 L21
MOVI 0 R061
JMP L22
L21: MOVI 1 R061
L22: JMPC GE R048 R050 L23
MOVI 0 R062
JMP L24
L23: MOVI 1 R062
L24: JMPC EQ R061 0 L26
JMPC EQ R062 0 L26
MOVI 1 R063
JMP L25
L26: MOVI 0 R063
L25: JMPC EQ R060 1 L28
JMPC EQ R063 1 L28
MOVI 0 R064
JMP L27
L28: MOVI 1 R064
L27: JMPC LT R048 R050 L29
MOVI 0 R065
JMP L30
L29: MOVI 1 R065
L30: JMPC EQ R064 1 L32
JMPC EQ R065 1 L32
MOVI 0 R066
JMP L31
L32: MOVI 1 R066
L31: MOVI R066 R067
PRTS "\n zz"
PRTI R067
MOVI R026  R001
ADD  R000 4  R000
LDI  R000  R004           // Return Addr Poped from Stack
JMPI  R004
ADD  R000 4  R000
LDI  R000  R004           // Return Addr Poped from Stack
JMPI  R004
// Function/Event Module Ends

// Function/Event Module begins
fac: ADD  R000 4  R000
LDI  R000 R068           // Parameter Poped from Stack
MOVIF R068 F015
MOVF F015 F014
MOVF 4.5 F016
PRTS "a from fac: "
PRTI R068
PRTS "j from fac: "
PRTF F014
JMPC FLT F014 F016 L4
L3: MOVI 90  R001
ADD  R000 4  R000
LDI  R000  R004           // Return Addr Poped from Stack
JMPI  R004
JMP L2
L4: MOVI 100  R001
ADD  R000 4  R000
LDI  R000  R004           // Return Addr Poped from Stack
JMPI  R004
L2: ADD  R000 4  R000
LDI  R000  R004           // Return Addr Poped from Stack
JMPI  R004
// Function/Event Module Ends

global: JMP _S_START

_S_END: PRTS "DONE"

