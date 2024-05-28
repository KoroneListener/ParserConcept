This is only some idea and not, for now, be used.

Init:
The expression is stored in EXPRESSION and operator priorities are defined.

parse_expression:
This function takes the current priority as an argument and evaluates the expression recursively.
Based on the priority, it will call the parse_expression function with the next priority.

Parsing Numbers and Operators:
The function starts by parsing the first number and then enters a loop to parse the next operator.
Depending on the operator it either continues or returns based on the priority comparison.

Recursion:
The function is called recursively with appropriate prioprities based on the operator.

End of Expression: When the end of the expression is reached the final result is returned.

THIS IS PSEUDOCODE AND NOT ACTUAL CODE.
*/
