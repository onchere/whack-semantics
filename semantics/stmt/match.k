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
require "../expression/matchexpr.k"

module WHACK-STMT-MATCH

imports WHACK-EXPRESSION-MATCHEXPR

rule match E:Expression {
		(Options: Result) _
		default: _
	 }
	=> Result requires inExprList(Options, E)

rule match E:Expression {
		_ Cases
		default: Default
	 }
	=> match E { Cases default: Default } [owise]

rule match E:Expression {
		.MatchCases
		default: Default
	} => Default

rule match E:Expression {
		(Options: Result) _
	 }
	=> Result requires inExprList(Options, E)

rule match E:Expression {
		_ Cases
	 }
	=> match E { Cases } [owise]

rule match _ { .MatchCases } => . [structural]

endmodule
