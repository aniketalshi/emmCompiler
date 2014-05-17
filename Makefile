CXX=g++
#CXX=clang++
CXXFLAGS = -g -O -Wno-deprecated -std=c++0x -Wall
FLEX = flex
BISON = bison

demo:	driveParse.o E--_lexer.o E--_parser.o Ast.o STEClasses.o SymTabMgr.o Value.o Type.o SymTabEntry.o Error.o ParserUtil.o SymTab.o InterCode.o CodeOpt.o AbstractMachineCode.o EventHandler.o
	$(CXX) -o $@ $^ -lfl

E--_lexer.o:	E--_lexer.C E--.tab.h
E--_parser.o: E--_parser.C E--.tab.h

E--_parser.C: E--_parser.y++
	$(BISON) -t -d -o E--_parser.C E--_parser.y++; \
  mv E--_parser.H E--.tab.h

SymTabMgr.o: SymTabMgr.h SymTabMgr.C
SymTabEntry.o: SymTabEntry.h SymTabEntry.C
STEClasses.o: STEClasses.h STEClasses.C
Ast.o: Ast.h Ast.C
Value.o: Value.h Value.C
Type.o: Type.h Type.C
Error.o: Error.h Error.C
ParserUtil.o: ParserUtil.h ParserUtil.C
SymTab.o: SymTab.h SymTab.C
InterCode.o: InterCode.h InterCode.C
CodeOpt.o: CodeOpt.h CodeOpt.C
AbstractMachineCode.o: AbstractMachineCode.h AbstractMachineCode.C
EventHandler.o: EventHandler.C

clean:
	-echo "Removing all object files!"
	-rm -f demo *.o
	-echo "Removing intermediate C files!"
	-rm -f E--_parser.C
	-rm -rf myoutputs
