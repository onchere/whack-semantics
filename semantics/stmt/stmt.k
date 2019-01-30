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
require "../expression/expression.k"
require "body.k"
require "let.k"
require "match.k"
require "preop.k"
require "postop.k"
require "declassign.k"
require "assign.k"
require "if.k"
require "while.k"
require "for.k"

module WHACK-STMT

  imports WHACK-EXPRESSION
  imports WHACK-STMT-BODY
  imports WHACK-STMT-LET
  imports WHACK-STMT-MATCH
  imports WHACK-STMT-PREOP
  imports WHACK-STMT-POSTOP
  //imports WHACK-STMT-DECLASSIGN
  imports WHACK-STMT-ASSIGN
  //imports WHACK-STMT-IF
  //imports WHACK-STMT-WHILE
  //imports WHACK-STMT-FOR

  rule S1:Stmt S2:StmtList => S1 ~> S2

  rule S1:Stmt S2:Stmt => S1 ~> S2

  rule .StmtList => . [structural]

endmodule
