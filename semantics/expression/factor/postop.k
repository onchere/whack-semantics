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
require "../../../syntax.k"

module WHACK-FACTOR-POSTOP

imports WHACK-SYNTAX

// we assume int's here @TODO

rule <k>...
		(V:Variable++):Factor => Val
	...</k>
	<stack>...
		V |-> Loc
	...</stack>
	<state>...
		Loc |-> (Val => Val +Int 1)
	...</state>

rule <k>...
		(V:Variable--):Factor => Val
	...</k>
	<stack>...
		V |-> Loc
	...</stack>
	<state>...
		Loc |-> (Val => Val -Int 1)
	...</state>

endmodule
