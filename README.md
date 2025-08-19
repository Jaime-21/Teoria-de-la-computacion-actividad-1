# teoria-de-la-computacion
Group: Jaime Jesus Cotes Nuñez, Andres Mazo Hernadez, Juan Gomez Rivas
- windows 11, copilador GHC 9.6.7, inteliJ IDEA whit plugin of haskell

  
- This project implements **Church encodings** of Boolean values (`true` and `false`) and basic logical operations in **pure lambda calculus**, written in Haskell.

- Detailed instructions for running your solution:
To run the solution, you must clone the repository and open it either in a terminal or in IDEA.
After cloning the repository, open the terminal either in IntelliJ or on your computer and enter the following commands in GHCI:
      - :l ChurchBool.hs
      - test
  With that, the program runs.

  - Detailed explination of your solution:
  First of all, we know that we must provide the solution using only the definitions of true and false
        -true = \x y -> x
        -false = \x y -> y
-With that in mind, the way to solve the proposed problems is to refer to the definitions of IFTHENELSE, AND, OR, and NOT in the truth tables.

IFTHENELSE:
This is the IFTHENELSE truth table. With this in mind, we can solve the proposed exercise.
| condition | value if True | value if False |  results  |
| --------- | ------------- | -------------- | --------- |
| true      | M             | N              | M         |
| false     | M             | N              | N         |

This is the answer to the exercise

ifThenElse = \b x y -> b x y
-Why?
-Based on the truth table, \b can be either true or false. If we make the replacement and then do the demonstration, we will  end up with the same answers as in the truth table.
-Let's do the demonstration
-\b x y -> b x y
-if \b= true, replacing it would result in = truth(X Y) =  (\x y -> x) XY = (\y.X) Y = X.
-if \b=false, replacing it would result in = false(X Y) = (\X y -> y) XY = (\y.y) Y = Y.

-This matches the truth table for IFTHENELSE exactly.


CHURCHAND:
This is the CHURCHAND truth table. With this in mind, we can solve the proposed exercise.
| a     | b     | a ∧ b |
| ----- | ----- | ----- |
| true  | true  | true  |
| true  | false | false |
| false | true  | false |
| false | false | false |

-This is the answer to the exercise

-\a b -> a b false
-Why?
-Thanks to the truth table, we know that AND only gives true when there are two  truths. What can we deduce from this?
    -when a = true, we depend on b to know the result
    -When a = false, the result will always be false, no matter what b is.
-With this in mind, the formula \a b -> a b false allows us to obtain the same result as in the truth table.

-Let's do the demonstration
-\a b -> a b false
-if \a= true and \b=true then it would be true(true false) = (\x y -> x) true false = (\y.true)false = true
-if \a= true and \b=false then it would be true(false false) = (\x y -> x) false false = (\y.false)false = false
-if \a= false and \b=true then it would be false(true false) = (\x y -> y) true false = (\y.y)false = false
-if \a= false and \b=false then it would be false(false false) = (\x y -> y) false false = (\y.y)false = false

-This matches the truth table for CHURCHAND exactly.

CHURCHOR:
This is the CHURCHOR truth table. With this in mind, we can solve the proposed exercise.
| a     | b     | a ∨ b |
| ----- | ----- | ----- |
| true  | true  | true  |
| true  | false | true  |
| false | true  | true  |
| false | false | false |

-This is the answer to the exercise
-CHURCHOR = \a b -> a true b

-Why?
-Unlike the AND truth table, here the result will only be false when a and b are both false. With this in mind, we know:
    -If a = true, the result is always true ( no matter what b is).
    -If a = false, the result depends on b.
-So, the way to express the truth table in lambda code would be CHURCHOR = \a b -> a true b

-Let's do the demonstration
-CHURCHOR = \a b -> a true b
-if \a=true and \b=true then it would be true(true true) = (\x y -> x) true true = (\y.true)true = true
-if \a=true and \b=false then it would be true(true false) = (\x y -> x) true false= (\y.true) false = true
-if \a=false and \b=true then it would be false(true true) = (\x y -> y) true true= (\y.y) true= true
-if \a=false and \b=false then it would be false(true false) = (\x y -> y) true false= (\y.y) false= false

-This matches the truth table for CHURCHAND exactly.

CHURCHNOT:
This is the CHURCHNOT truth table. With this in mind, we can solve the proposed exercise.
| a     | ¬a    |
| ----- | ----- |
| true  | false |
| false | true  |

-This is the answer to the exercise
-CHURCHNOT = \a -> a false true

-Why?
-This truth table is much easier than the previous ones for AND, OR, IFTHENELESE.
-Here, the objective is to invert the given value.
-So, the way to obtain the results shown in the table would be with the formula \a -> a false true

-Let's do the demonstration
-CHURCHNOT = \a -> a false true
-if \a=true then it would remain true (false true) = (\x y -> x) false true = (\y.false) true = false
-if \a=false then it would remain false (false true) = (\x y -> y) false true = (\y.y) true = true

-This matches the truth table for CHURCHAND exactly.

-Reference sources:
-The only source of information used for this project is ChatGPT AI.
