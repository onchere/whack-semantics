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
require "matchexpr.k"
require "preop.k"
require "postop.k"
require "sizeof.k"
require "variable.k"
require "character.k"
require "integral.k"
require "floatingpt.k"
require "boolean.k"
require "string.k"

module WHACK-FACTOR

imports WHACK-FACTOR-MATCHEXPR
//imports WHACK-FACTOR-PREOP
//imports WHACK-FACTOR-POSTOP
imports WHACK-FACTOR-SIZEOF
imports WHACK-FACTOR-VARIABLE
imports WHACK-FACTOR-CHARACTER
imports WHACK-FACTOR-INTEGRAL
imports WHACK-FACTOR-FLOATINGPT
imports WHACK-FACTOR-BOOLEAN
imports WHACK-FACTOR-STRING

endmodule
