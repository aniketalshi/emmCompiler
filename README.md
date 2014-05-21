# Design and Implementaion of E-- Compiler

### Source Files:
Following is the description of important source files:
```
E--_parser.y++          ====>   Code for Syntax Parsing and AST builder of E-- language
Ast.C                   ====>   typeCheck() and IR codegen() routines for AST Nodes
STEClasses.C            ====>   typeCheck() and IR codegen() routines for SymtabEntry Variables
Value.C                 ====>   Stores literal values
Type.C                  ====>   Stores types of different variable
InterCode.C             ====>   Code for Basic block generation and different Code Optimizations.
FinalMachineCodeGen.C   ====>   Converting IR to Final Machine Code
EventHandler.C          ====>   Machine Code Generation for Event Handling
```

### Test Cases:
All important test cases are stored in "demotests" folder. Following are different test cases:


demotests/1_operator         Tests all binary and unary arithmetic operators 
demotests/2_fibonaci         Recursive function to compute nth fibonaci number
demotests/3_factorial        Recursive function to compute factorial of a number
demotests/4_functionCall     Function Call flow "event_a => foo20 => foo19 => ... => foo1"
demotests/5_functionDeadCode Eliminating Dead function definitions 
demotests/6_whileloop        Tests usage of nested while loops with continue
demotests/7_deadcode         Tests dead code elimiation of assignment statements
demotests/8_3events          Tests event handling logic of selecting multiple events
demotests/9_zeroOptimizer    Static Evaluation of operations with zero operands
demotests/10_recursion       Recursive calls printing the recursion depth and local variables across different calls


For more test cases, refer to "alltests" folder. This has a set of negative test cases for testing syntax and semantic errors.

## Build, Compile and Run Instructions:

#### Instructions for building compiler :
```
    make clean; make        // For clean build
    make                    // Otherwise
```
On successful build, compiler binary "demo" is generated.

#### Instructions for Compilation of testcases :
```
    ./demo testname > testname.i        // Will generate optimized machine code
    ./demo testname -noopt >testname.i  // Will generate un-optimized machine code
```
#### Compiler Debug Option '-debug'
```    
    ./demo testname -debug          // Will generate phase wise translation of input file to optimized final machine code
    ./demo testname -noopt -debug   // Will generate phase wise translation of input file to un-optimized final machine code
```

#### Instructions for Execution of *.i files
```
    cp testname.i project/              // Copy final machine code to project folder
    ./erun testname.i -dr -df -m 10000000 -dm 9990 10000
```


Sample execution of `3_factorial` testcase:

```
aniket@aniket:~/emmCompiler/project$ ./erun factorial.i -dr -df -m 10000000 -dm 9990 10000

Enter Event Name ('0' for exit): a
Enter Param 1: 8

Factorial of 1st Param: 40320
Enter Event Name ('0' for exit): a
Enter Param 1: 4

Factorial of 1st Param: 24
Enter Event Name ('0' for exit): e     
Invalid Event Name

Enter Event Name ('0' for exit): 0
Successfully Exited
```


Source Code Repository location:    
https://github.com/aniketalshi/emmCompiler

#
The MIT License (MIT)

Copyright (c) 2014 Aniket Alshi
Copyright (c) 2014 Sahil Parmar
Copyright (c) 2014 Tejal Kaple
Copyright (c) 2014 Sohil Gandhi

