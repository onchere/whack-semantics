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
require "semantics/element/element.k"
require "semantics/stmt/stmt.k"

module WHACK

imports WHACK-ELEMENT
imports WHACK-STMT

configuration
	<k color="green"> $PGM:K </k>
	<streams>
		<in color="cyan" stream="stdin"> .List </in>
		<out color="cyan" stream="stdout"> .List </out>
	</streams>
	<types color="Fuchsia"> .Map </types>
	<stack color="magenta"> .Map </stack>
	<heap> .Map </heap>
	<state> .Map </state>

	<aliases> .Map </aliases>

	<functions>
		.List
	</functions>

	<structs>
		.List
	</structs>

	<interfaces>
		.List
	</interfaces>

	<classes>
		.List
	</classes>

endmodule
