#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number

firstnum=15
secondnum=7
subtarct=$((firstnum - secondnum))
multiply=$((firstnum * secondnum))
modulus=$((firstnum % secondnum))
sum=$((firstnum + secondnum))
dividend=$((firstnum / secondnum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

cat <<EOF
$firstnum subtract $secondnum is $subtarct

$firstnum multiply $secondnum is $multiply

$firstnum modulus $secondnum is $modulus

$firstnum divided by $secondnum gives $dividend with a remainder of $modulus  

$firstnum plus $secondnum is $sum

$firstnum divided by $secondnum is $dividend
  - More precisely, it is $fpdividend
EOF
