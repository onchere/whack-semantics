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
require "../initializer.k"

module WHACK-STMT-DECLASSIGN

imports WHACK-INITIALIZER

rule
  <k>
		T:Type (I:Ident Init:Initializer, Rest:DeclVarList => Rest)
	...</k>
	<stack> Mem:Map => Mem[I/Loc] </stack>
	<state>...
		. => Loc |-> 0
	...</state>
	requires fresh(Loc:Int)

rule
  <k>
		T:Type (I:Ident, Rest:DeclVarList => Rest)
	...</k>
	<stack> Mem:Map => Mem[I/Loc] </stack>
	<state>...
		. => Loc |-> 0
	...</state>
	requires fresh(Loc:Int) 

rule T:Type .DeclVarList => . [structural]

endmodule
