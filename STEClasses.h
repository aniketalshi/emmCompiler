#ifndef STE_CLASSES_H
#define STE_CLASSES_H

#include "SymTab.h"
#include "SymTabEntry.h"
#include "Ast.h"

enum opn {INCR, DECR};

class StmtNode;
class RuleNode;
class ExprNode;
class PatNode;
class VariableEntry;
class OpNode;
class PrimitivePatNode;
extern string newName(const string&);

/****************************************************************
  The first few classes dont really add any functionality over
  the base class, except for providing a convenient constructor.
****************************************************************/

class GlobalEntry: public SymTabEntry {
    public:
        GlobalEntry(string name, int line=0, int column=0, string file=""):
            SymTabEntry(name, SymTabEntry::Kind::GLOBAL_KIND, line, column,file), rules_() {};
        ~GlobalEntry() {};

        const vector<RuleNode*> rules() const { return rules_;};
        vector<RuleNode*> rules() { return rules_;};
        const RuleNode* rule(int i) const { return rules_[i];}
        RuleNode* rule(int i) { return rules_[i];}
        void addRule(RuleNode* re) { rules_.push_back(re);};

        const Type* typeCheck();
        void print(ostream&, int indent=0) const;
        void memAlloc();
        InterCodesClass* codeGen();     
        void eventHandler(ostream &os);
    private:
        vector<RuleNode*> rules_;
};

class BlockEntry: public SymTabEntry {
    public:
        BlockEntry(string name, int line=0, int column=0, string file=""):
            SymTabEntry(name, SymTabEntry::Kind::BLOCK_KIND, line, column, file, (Type*)&Type::voidType) {};
        ~BlockEntry() {};
        const Type* typeCheck() {return NULL;}
        void print(ostream& out, int indent=0) const;
};

class RuleBlockEntry: public BlockEntry {
    public:
        RuleBlockEntry(int line=0, int column=0, string file=""):
            BlockEntry(newName("rule"), line, column, file) { kind(SymTabEntry::Kind::RULE_BLOCK_KIND);};
        ~RuleBlockEntry() {};
        InterCodesClass* codeGen() { return NULL;}
};

/****************************************************************
  Following classes add more significant functionality to that
  provided by SymTabEntry.
 ****************************************************************/

class VariableEntry: public SymTabEntry {
    public:
        enum VarKind {GLOBAL_VAR, LOCAL_VAR, PARAM_VAR, CLASS_VAR, UNDEFINED};

    public:
        VariableEntry(string name, VarKind v, Type* type=nullptr,
                ExprNode* init=nullptr, int ln=0, int col=0, string file=""):
            SymTabEntry(name, SymTabEntry::Kind::VARIABLE_KIND, ln, col, file, type) 
        {
            vkind_ = v; initVal(init);
        };

        VariableEntry(const VariableEntry &v);
        ~VariableEntry() {};

        VarKind varKind() const { return vkind_;};
        void varKind(VarKind v) { vkind_ = v;};

        int offSet() const { return offSet_;} ;
        void offSet(int o) {offSet_ = o;};

        const ExprNode* initVal() const { return initVal_;}
        ExprNode* initVal() { return initVal_;};
        void initVal(ExprNode *init) { initVal_ = init;};

        void print(ostream& os, int indent=0) const;
        const Type* typeCheck();
        void memAlloc();
        InterCodesClass* codeGen();
        string getRegisterName();
        void   setRegisterName(string reg_name); 

    private:
        VarKind vkind_;
        int offSet_;
        ExprNode* initVal_;
        string registerName_ ;
};

class ClassEntry: public SymTabEntry {
    public:
        ClassEntry(string name, int line=0, int column=0, string file="")
            : SymTabEntry(name, SymTabEntry::Kind::CLASS_KIND, line, column, file) {}
        ~ClassEntry() {};

        void print(ostream& os, int indent) const;
        const Type* typeCheck();
        void memAlloc();
};

class FunctionEntry: public SymTabEntry {
    public:
        FunctionEntry(string name, Type* type=nullptr,
                int line=0, int column=0, string file=""):
            SymTabEntry(name, SymTabEntry::Kind::FUNCTION_KIND, line, column, file, type)
        {
            body_ = nullptr;
        }
        ~FunctionEntry() {};

        const CompoundStmtNode* body() const { return body_;}
        CompoundStmtNode* body() {return body_;}
        void body(CompoundStmtNode* n) { body_ = n;}

        void print(ostream& os, int indent) const;
        const Type* typeCheck();
        void memAlloc();
        InterCodesClass* codeGen();
    private:
        CompoundStmtNode* body_;
};

class EventEntry: public SymTabEntry {
    public:
        EventEntry(string name, int line=0, int column=0, string file=""):
            SymTabEntry(name, SymTabEntry::Kind::EVENT_KIND, line, column, file) {};
        ~EventEntry() {};

        void print(ostream& out, int indent=0) const; 
        const Type* typeCheck();
        void memAlloc();
};

class AddressManage {
    int address_;
    int global_addr_; 
    public:
        enum OffKind { GLOBAL, NONGLOBAL};  

        AddressManage () : address_(0), global_addr_(0) {} 
        void setAddress (OffKind k, int addr) { 
            if (k == GLOBAL)     
                global_addr_ = addr; 
            else if (k == NONGLOBAL)
                address_ = addr;
        }
        
        int getAddress (OffKind k, int size, int incr) { 

            if (k == GLOBAL) {
                
                if (incr == INCR) {
                    int currAddr = global_addr_; 
                    global_addr_ = global_addr_ + size;
                    return currAddr;
                } else {
                    global_addr_ = global_addr_ - size;
                    return global_addr_;
                }
                
            } else {
                
                if (incr == INCR) {
                    int currAddr = address_; 
                    address_     = address_ + size;
                    return currAddr; 
                } else {
                    address_ = address_ - size;
                    return address_;
                }
                
            }
        }
        
        void print_Address (OffKind k) { 
            if (k == GLOBAL) 
                printf ("offset: %d \n", global_addr_); 
            else
                printf ("offset: %d \n", address_);
        }
};

#endif
