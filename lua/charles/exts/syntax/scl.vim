" Vim syntax file for Siemens SCL (Structured Control Language)

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Block declarations
syn keyword sclBlock FUNCTION FUNCTION_BLOCK DATA_BLOCK ORGANIZATION_BLOCK END_FUNCTION END_FUNCTION_BLOCK END_DATA_BLOCK END_ORGANIZATION_BLOCK

" Variable sections
syn keyword sclSection VAR VAR_INPUT VAR_OUTPUT VAR_IN_OUT VAR_TEMP END_VAR CONST BEGIN

" Data types
syn keyword sclType BOOL BYTE WORD DWORD INT DINT REAL CHAR STRING TIME DATE TOD DATE_AND_TIME S5TIME ARRAY STRUCT END_STRUCT OF

" Control flow
syn keyword sclConditional IF THEN ELSIF ELSE END_IF CASE OF END_CASE
syn keyword sclRepeat FOR TO BY DO END_FOR WHILE END_WHILE REPEAT UNTIL END_REPEAT
syn keyword sclStatement RETURN EXIT CONTINUE

" Operators
syn keyword sclOperator AND OR XOR NOT MOD DIV

" Boolean literals
syn keyword sclBoolean TRUE FALSE

" Numbers
syn match sclNumber "\<\d\+\>"
syn match sclFloat "\<\d\+\.\d*\>"
syn match sclHex "\<16#[0-9A-Fa-f]\+\>"

" PLC addresses
syn match sclAddress "\<[IQME][BWD]\?\d\+\(\.\d\+\)\?\>"
syn match sclAddress "\<DB\d\+\.DB[BWDX]\d\+\(\.\d\+\)\?\>"

" Strings
syn region sclString start=+'+ end=+'+

" Comments
syn match sclComment "//.*$"
syn region sclComment start="/\*" end="\*/"

" Assignment
syn match sclOperator ":="

" Highlighting links
hi def link sclBlock Structure
hi def link sclSection StorageClass
hi def link sclType Type
hi def link sclConditional Conditional
hi def link sclRepeat Repeat
hi def link sclStatement Statement
hi def link sclOperator Operator
hi def link sclBoolean Boolean
hi def link sclNumber Number
hi def link sclFloat Float
hi def link sclHex Number
hi def link sclAddress Special
hi def link sclString String
hi def link sclComment Comment

let b:current_syntax = "scl"
