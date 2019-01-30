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

module WHACK-FACTOR-INTEGRAL

imports WHACK-SYNTAX

syntax KResult ::= Int

//@ Unary Operations for Integers

rule +I:Int => 0 +Int I

rule -I:Int => 0 -Int I

rule ~I:Int => ~Int I

//@ Binary Operations for Integers

rule I1:Int * I2:Int => I1 *Int I2

rule I1:Int / I2:Int => I1 /Int I2 requires I2 =/=Int 0

rule I1:Int % I2:Int => I1 %Int I2 requires I2 =/=Int 0

rule I1:Int + I2:Int => I1 +Int I2

rule I1:Int - I2:Int => I1 -Int I2

rule I1:Int & I2:Int => I1 &Int I2

rule I1:Int ^ I2:Int => I2 ^Int I2

rule I1:Int | I2:Int => I1 |Int I2

rule I1:Int << I2:Int => I1 <<Int I2

rule I1:Int >> I2:Int => I1 >>Int I2

//@ Comparisons for Integers

rule I1:Int <= I2:Int => I1 <=Int I2

rule I1:Int >= I2:Int => I1 >=Int I2

rule I1:Int < I2:Int => I1 <Int I2

rule I1:Int > I2:Int => I1 >Int I2

rule I1:Int == I2:Int => I1 ==Int I2

rule I1:Int != I2:Int => I1 =/=Int I2

endmodule
