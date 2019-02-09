/**
 * Copyright 2019-present Onchere Bironga
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
module WHACK-SYNTAX
  syntax Character ::= Char

  syntax Integral ::= Int

  syntax Binary ::= Token{"[0b][0-1]+"}

  syntax Octal ::= Token{"[0o][0-7]+"}

  syntax Hexadecimal ::= Token{"[0x][0-9a-fA-F]+"}

  syntax FloatingPt ::= Float

  syntax Boolean ::= Bool

  syntax Ident ::= Id

  syntax IdentList ::= NeList{Ident, ","}

  syntax ScopeRes ::= NeList{Ident, "::"}

  syntax SimpleSymbolName ::= ScopeRes
                            | Ident     [prefer]

  syntax OverloadID ::= SimpleSymbolName "::" StructOpName

  syntax Identifier ::= OverloadID
                      | SimpleSymbolName

  syntax ArrayType ::= "[" Expression "]" Type  [strict(1)]

  syntax ExprType ::= "type" "(" Expression ")"

  syntax FnType ::= "func" "(" TypeList "->" ListOfTypes ")"
                  | "func" "(" "()" "->" ListOfTypes ")"
                  | "func" "(" TypeList ")"

  syntax BasicType ::= FnType
                     | ExprType
                     | ArrayType
                     | SimpleSymbolName

  syntax PointerType ::= PointerType "*"
                       | BasicType "*"

  syntax NullableType ::= PointerType "?"
                        | BasicType "?"

  syntax ConcreteType ::= NullableType
                        | PointerType
                        | BasicType

  syntax Type ::= ConcreteType "&"
                | ConcreteType

  syntax VariadicType ::= Type Expansion

  syntax ListOfTypes ::= List{Type, ","}

  syntax TypeList ::= VariadicType
                    | ListOfTypes "," VariadicType
                    | ListOfTypes

  syntax Expansion ::= "..."

  syntax ExpandOp ::= Variable Expansion

  syntax SizeOf ::= "sizeof" "(" Type ")"

  syntax AlignOf ::= "alignof" "(" Type ")"

  syntax OffsetOf ::= "offsetof" "(" Type "," Ident ")"

  syntax Cast ::= "cast" "<" Type ">" "(" Expression ")"

  syntax Reference ::= Variable "&"

  syntax InitList ::= "{" ExprList "}"

  syntax Range ::= Factor ".." Factor ".." "=" Factor
                 | Factor ".." "=" Factor
                 | Factor ".." Factor ".."
                 | Factor ".."
                 | Factor

  syntax ForInExpr ::= "for" IdentList "in" Range "if" LogicalOr
                     | "for" IdentList "in" Range

  syntax MemberInitListMember ::= Ident ":" Expression

  syntax MemberInitList ::= NeList{MemberInitListMember, ","}

  syntax Initializer ::= "{" MemberInitList "}"
                       | InitList

  syntax Value ::= Type Initializer

  syntax NewExpr ::= "new" "(" Expression ")" Type Initializer
                   | "new" "(" Expression ")" Type
                   | "new" Type Initializer
                   | "new" Type

  syntax Future ::= "await" /*Launch in a coroutine, return a coroutine handle?*/
                  | "async" /*Launch asynchronously in another thread, return joinable?*/

  syntax FuncArgs ::= "(" ExprList ")"

  syntax FuncArgsList ::= NeList{FuncArgs, ""}

  syntax Callables ::= NeList{Factor, "->"}

  syntax FuncCall ::= Future Callables FuncArgsList
                    | Callables FuncArgsList

  syntax ReferenceCapture ::= Ident "&"

  syntax Captures ::= "&"
                    | "="
                    | ReferenceCapture
                    | Ident "=" Expression
                    | Ident

  syntax CapturesList ::= List{Captures, ","}

  syntax Capture ::= "[" CapturesList "]"

  syntax VariadicArg ::= VariadicType Ident

  syntax TypeIdent ::= Type Ident

  syntax TypeIdentList ::= NeList{TypeIdent, ","}

  syntax Args ::= VariadicArg
                | TypeIdentList "," VariadicArg
                | TypeIdentList

  syntax Closure ::= "func" Capture "(" Args ")" ListOfTypes Body
                   | "func" "(" Args ")" ListOfTypes Body

  syntax Factor ::= "(" Expression ")"    [bracket]
                  | "*" Factor            [strict]
                  | "!" Factor            [strict]
                  | "~" Factor            [strict]
                  | "+" Factor            [strict]
                  | "-" Factor            [strict]
                  | MatchExpr
                  | Closure
                  | Reference
                  | MemberInitList
                  | InitList
                  | NewExpr
                  | Value
                  | PreOp
                  | PostOp
                  | Expansion
                  | ExpandOp
                  | SizeOf
                  | AlignOf
                  | Cast
                  | Character
                  | FloatingPt
                  | Integral
                  | Binary
                  | Hexadecimal
                  | Boolean
                  | String
                  | Element
                  | StructMember
                  | Identifier

  syntax Multiplicative ::= Multiplicative "/" Factor  [left, strict]
                          | Multiplicative "*" Factor  [left, strict]
                          | Multiplicative "%" Factor  [left, strict]
                          | Factor

  syntax Additive ::= Additive "+" Multiplicative   [left, strict]
                    | Additive "-" Multiplicative   [left, strict]
                    | Multiplicative

  syntax Shift ::= Shift "<<" Additive  [left, strict]
                 | Shift ">>" Additive  [left, strict]
                 | Additive

  syntax Relational ::= Relational "<" Shift   [left, strict]
                      | Relational ">" Shift   [left, strict]
                      | Relational "<=" Shift  [left, strict]
                      | Relational ">=" Shift  [left, strict]
                      | Shift

  syntax Equality ::= Equality "==" Relational [left, strict]
                    | Equality "!=" Relational [left, strict]
                    | Relational

  syntax And ::= And "&" Equality  [left, strict]
               | Equality

  syntax Xor ::= Xor "^" And  [left, strict]
               | And

  syntax Or ::= Or "|" Xor  [left, strict]
              | Xor

  syntax LogicalAnd ::= LogicalAnd "&&" Or [left, strict]
                      | Or

  syntax LogicalOr ::= LogicalOr "||" LogicalAnd [left, strict]
                     | LogicalAnd

  syntax Ternary ::= LogicalOr "?" Expression ":" Expression [strict(1)]

  syntax AddressOf ::= "&" Factor [strict]

  syntax ExprList ::= NeList{Expression, ","}

  syntax MatchExprCase ::= ExprList ":" Expression

  syntax MatchExprCases ::= List{MatchExprCase, ";"}

  syntax MatchExpr ::= "match" Expression "{"
                        MatchExprCases
                        "default" ":" Expression
                      "}" [strict(1)]

  syntax Expression ::= AddressOf
                      | Ternary
                      | LogicalOr

  syntax MatchCase ::= ExprList ":" Stmt

  syntax MatchCases ::= NeList{MatchCase, ""}

  syntax Match ::= "match" Expression "{"
                    MatchCases
                    "default" ":" Stmt
                  "}" [strict(1)]
                | "match" Expression "{"
                    MatchCases
                  "}" [strict(1)]

  syntax TypeSwitchCase ::= TypeList ":" Stmt

  syntax TypeSwitchCases ::= NeList{TypeSwitchCase, ""}

  syntax TypeSwitch ::= "match" ExprType "{"
                          TypeSwitchCases
                          "default" ":" Stmt
                        "}"

  syntax Let ::= "let" "mut" IdentList "=" ExprList  [strict(2)]
               | "let" IdentList "=" ExprList        [strict(2)]

  syntax EquatableOps ::= "&"
                        | "|"
                        | "+"
                        | "-"
                        | "^"
                        | "%"
                        | "/"
                        | "*"
                        | ">>"
                        | "<<"

  syntax OpEq ::= Variable EquatableOps "=" Expression

  syntax DeclVar ::= Ident Initializer
                   | Ident

  syntax DeclVarList ::= NeList{DeclVar, ","}

  syntax DeclAssign ::= Type DeclVarList

  syntax While ::= "while" LogicalOr Stmt  [strict(1)]

  syntax LetBind ::= "let" SimpleSymbolName "(" IdentList ")" "=" Expression

  syntax If ::= "if" LetBind Stmt "else" Stmt     [strict(1)]
              | "if" LetBind Stmt                 [strict(1)]
              | "if" LogicalOr Stmt "else" Stmt   [strict(1)]
              | "if" LogicalOr Stmt               [strict(1)]

  syntax StmtsList ::= NeList{Stmt, ";"}

  syntax ForInIncrExpr ::= "for" StmtsList LogicalOr ";" StmtsList
                         | "for" Stmt ";" LogicalOr ";" StmtsList   [prefer]
                         | "for" ";" LogicalOr ";" StmtsList

  syntax ForExpr ::= ForInExpr
                   | ForInIncrExpr

  syntax For ::= ForExpr Stmt

  syntax StructMember ::= Factor "." SimpleSymbolName

  syntax Element ::= Factor "[" Expression "]"

  syntax PostOp ::= Factor "--"
                  | Factor "++"

  syntax PreOp ::= "--" Factor
                 | "++" Factor

  syntax Return ::= "return" ExprList

  syntax Delete ::= "delete" ExprList

  syntax Yield ::= "yield" ExprList

  syntax Break ::= "break"

  syntax Continue ::= "continue"

  syntax Unreachable ::= "unreachable"

  syntax Defer ::= "defer" Stmt

  syntax FactorList ::= NeList{Factor, ","}

  syntax Assign ::= FactorList "=" ExprList

  syntax Alias ::= "using" IdentList "=" ListOfTypes

  syntax StmtList ::= List{Stmt, ""}

  syntax Body ::= "{" StmtList "}"

  syntax Stmt ::= Body
                | Alias
                | Assign
                | Defer
                | Unreachable
                | Continue
                | Break
                | Yield
                | Delete
                | Return
                | PreOp
                | PostOp
                | For
                | While
                | DeclAssign
                | OpEq
                | If
                | Let
                | TypeSwitch
                | Match
                | NewExpr
                | FuncCall
                | Structure
                | Enumeration
                | DataClass
                | Comment

  syntax Tag ::= SimpleSymbolName FuncArgs
               | SimpleSymbolName

  syntax TagList ::= NeList{Tag, ","}

  syntax Tags ::= "@" Tag
                | "@" "(" TagList ")"

  syntax ClassDefMember ::= Ident "(" ListOfTypes ")"

  syntax ClassDefMemberList ::= NeList{ClassDefMember, ""}

  syntax ClassDef ::= "class" "{"
                        ClassDefMemberList
                      "}"

  syntax EnumDef ::= "enum" ":" Ident "{" IdentList "}"
                   | "enum" "{" IdentList "}"

  syntax Enumeration ::= Ident EnumDef

  syntax DataClass ::= Ident ClassDef

  syntax Function ::= "func" "operator" OverloadableOps "(" Args ")" ListOfTypes Body
                    | "func" Ident "(" Args ")" ListOfTypes Body

  syntax StructDefMember ::= Tags DeclAssign
                           | DeclAssign

  syntax StructDefMemberList ::= List{StructDefMember, ""}

  syntax StructDef ::= "struct" Tags "{"
                          StructDefMemberList
                        "}"
                      | "struct" "{"
                          StructDefMemberList
                        "}"

  syntax Structure ::= Ident StructDef

  syntax OverloadableOps ::= "<<="
                           | ">>="
                           | "&&"
                           | "||"
                           | "<<"
                           | ">>"
                           | ">="
                           | "<"
                           | ">"
                           | "!="
                           | "=="
                           | "-="
                           | "+="
                           | "|="
                           | "/="
                           | "%="
                           | "&="
                           | "^="
                           | "*="
                           | "|"
                           | "!"
                           | "~"
                           | "="
                           | "/"
                           | "*"
                           | "--"
                           | "-"
                           | "++"
                           | "+"
                           | "()"
                           | "[]"

  syntax NewOperator ::= "operator" "new" "[]"
                       | "operator" "new"

  syntax StructOpName ::= "operator" Type
                        | "operator" OverloadableOps

  syntax StructMemberName ::= StructOpName
                            | Ident

  syntax StructFuncPrologue ::= "func" "(" "mut" Ident ")"
                              | "func" "(" Ident ")"

  syntax StructFuncEpilogue ::= Body
                              | "=" "default"

  syntax StructOpBegin ::= StructFuncPrologue StructOpName

  syntax StructOp ::= StructOpBegin "(" Args ")" Type StructFuncEpilogue
                    | StructOpBegin "(" Args ")" StructFuncEpilogue
                    | StructOpBegin "(" TypeList ")" Type StructFuncEpilogue
                    | StructOpBegin "(" TypeList ")" StructFuncEpilogue

  syntax StructFunc ::= StructFuncPrologue Ident "(" Args ")" ListOfTypes StructFuncEpilogue

  syntax InterfaceMember ::= FnType StructMemberName

  syntax InterfaceMemberList ::= List{InterfaceMember, ""}

  syntax SimpleSymbolNameList ::= NeList{SimpleSymbolName, ","}

  syntax InterfaceDecl ::= "interface" ":" SimpleSymbolNameList
                         | "interface"

  syntax InterfaceDef ::= InterfaceDecl "{"
                            InterfaceMemberList
                          "}"

  syntax Interface ::= Ident InterfaceDef

  syntax ExternFunc ::= "extern" FnType Ident ";"
                      | "extern" FnType Ident

  syntax Exports ::= "export" IdentList ";"
                   | "export" IdentList

  syntax ModuleUse ::= "use" SimpleSymbolName "!" "{" IdentList "}" "as" Ident
                     | "use" SimpleSymbolName "!" "{" IdentList "}"
                     | "use" SimpleSymbolName "{" IdentList "}" "as" Ident
                     | "use" SimpleSymbolName "{" IdentList "}"
                     | "use" SimpleSymbolName "as" Ident
                     | "use" SimpleSymbolName

  syntax ModuleUses ::= ModuleUse ";"
                      | ModuleUse
                      | Comment

  syntax ModuleUsesList ::= List{ModuleUses, ""}

  syntax ModuleDecl ::= "module" Ident ";"
                      | "module" Ident

  syntax CompilerOpt ::= "{-" "OPTIONS" IdentList "-}"

  syntax UntilNewLineToken ::= Token{"[^'\n']+"}
                             | Token{"[\n]"}

  syntax Comment ::= "//" UntilNewLineToken

  syntax CompilerOpts ::= CompilerOpt
                        | Comment

  syntax CompilerOptsList ::= List{CompilerOpts, ""}

  syntax TopLevelElement ::= Comment
                           | ExternFunc
                           | Exports
                           | DataClass
                           | Interface
                           | Enumeration
                           | Structure
                           | StructFunc
                           | StructOp
                           | Alias
                           | Function

  syntax TopLevelElementList ::= List{TopLevelElement, ""}

  syntax Whack ::= CompilerOptsList ModuleDecl ModuleUsesList TopLevelElementList

endmodule
