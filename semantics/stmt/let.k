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
require "../../syntax.k"

module WHACK-STMT-LET

  imports WHACK-SYNTAX

  rule
    <k>...
  		let (I:Ident, Is:IdentList => Is) = (E:Expression, Es:ExprList => Es)
  	...</k>
  	<stack>
  		Mem:Map => Mem[I/Loc]
  	</stack>
  	<state>...
  		. => Loc |-> E
  	...</state>
  	requires fresh(Loc:Int)

  rule let .IdentList = .ExprList => . [structural]

endmodule
