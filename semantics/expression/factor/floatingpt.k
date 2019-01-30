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

module WHACK-FACTOR-FLOATINGPT

imports WHACK-SYNTAX

syntax KResult ::= Float

//@ Unary Operations for Floating Point Numbers

rule +F:Float => 0.0 +Float F

rule -F:Float => 0.0 -Float F

//@ Binary Operations for Floating Point Numbers

rule F1:Float * F2:Float => F1 *Float F2

rule F1:Float / F2:Float => F1 /Float F2 requires F2 =/=Float 0.0

rule F1:Float % F2:Float => F1 %Float F2 requires F2 =/=Float 0.0

rule F1:Float + F2:Float => F1 +Float F2

rule F1:Float - F2:Float => F1 -Float F2

rule F1:Float ^ F2:Float => F2 ^Float F2

//@ Comparisons for Floating Point Numbers

rule F1:Float <= F2:Float => F1 <=Float F2

rule F1:Float >= F2:Float => F1 >=Float F2

rule F1:Float < F2:Float => F1 <Float F2

rule F1:Float > F2:Float => F1 >Float F2

rule F1:Float == F2:Float => F1 ==Float F2

rule F1:Float != F2:Float => F1 =/=Float F2

endmodule
