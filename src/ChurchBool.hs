module ChurchBool where

-- Alias de tipo para los booleanos de Church
type ChurchBool = forall a. a -> a -> a

-- Church booleans
true :: ChurchBool
true = \x y -> x

false :: ChurchBool
false = \x y -> y

-- ifThenElse
ifThenElse :: ChurchBool -> a -> a -> a
ifThenElse = \b x y -> b x y

-- Logical operations
churchAnd :: ChurchBool -> ChurchBool -> ChurchBool
churchAnd = \a b -> a b false

churchOr :: ChurchBool -> ChurchBool -> ChurchBool
churchOr = \a b -> a true b

churchNot :: ChurchBool -> ChurchBool
churchNot = \a -> a false true

-- Converts a Church boolean to a string
showBool :: ChurchBool -> String
showBool b = b "True" "False"

-- Run tests
test :: IO ()
test = do
  putStrLn $ "true AND false = " ++ showBool (churchAnd true false)
  putStrLn $ "true OR false = " ++ showBool (churchOr true false)
  putStrLn $ "NOT true = " ++ showBool (churchNot true)
  putStrLn $ "NOT false = " ++ showBool (churchNot false)
  putStrLn $ "ifThenElse true \"yes\" \"no\" = " ++ ifThenElse true "yes" "no"
  putStrLn $ "ifThenElse false \"yes\" \"no\" = " ++ ifThenElse false "yes" "no"
