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
require "factor/factor.k"

module WHACK-EXPRESSION-OPERATORS

imports WHACK-FACTOR

rule !B:Bool => notBool B

rule true & B => B

rule false & _ => false

rule true | _ => true

rule false | B => B

rule true && B => B

rule false && _ => false

rule true || _ => true

rule false || B => B

context _ / HOLE:Factor  [ndheat]

context HOLE / _:Factor	[ndheat]

context _ * HOLE:Factor  [ndheat]

context HOLE * _:Factor [ndheat]

context _ % HOLE:Factor	[ndheat]

context HOLE % _:Factor	[ndheat]

context _ + HOLE:Multiplicative	[ndheat]

context HOLE + _:Multiplicative	[ndheat]

context _ - HOLE:Multiplicative	[ndheat]

context HOLE - _:Multiplicative	[ndheat]

context _ << HOLE:Additive	[ndheat]

context HOLE << _:Additive	[ndheat]

context _ >> HOLE:Additive	[ndheat]

context HOLE >> _:Additive	[ndheat]

context HOLE < _:Shift	[ndheat]

context _ < HOLE:Shift	[ndheat]

context HOLE > _:Shift	[ndheat]

context _ > HOLE:Shift	[ndheat]

context HOLE <= _:Shift	[ndheat]

context _ <= HOLE:Shift	[ndheat]

context HOLE >= _:Shift	[ndheat]

context _ >= HOLE:Shift	[ndheat]

context HOLE == _:Relational	[ndheat]

context _ == HOLE:Relational	[ndheat]

context HOLE != _:Relational	[ndheat]

context _ != HOLE:Relational	[ndheat]

context _ & HOLE:Equality	[ndheat]

context HOLE & _:Equality	[ndheat]

context _ ^ HOLE:And	[ndheat]

context HOLE ^ _:And	[ndheat]

context _ | HOLE:Xor	[ndheat]

context HOLE | _:Xor	[ndheat]

context _ && HOLE:Or	[ndheat]

context HOLE && _:Or	[ndheat]

context _ || HOLE	[ndheat]

context HOLE || _	[ndheat]

endmodule
