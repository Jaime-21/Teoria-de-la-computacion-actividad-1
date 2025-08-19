module ChurchBool where


type ChurchBool = forall a. a -> a -> a


true :: ChurchBool
true = \x y -> x


false :: ChurchBool
false = \x y -> y


ifThenElse :: ChurchBool -> a -> a -> a
ifThenElse = \b x y -> b x y


churchAnd :: ChurchBool -> ChurchBool -> ChurchBool
churchAnd = \a b -> a b false

churchOr :: ChurchBool -> ChurchBool -> ChurchBool
churchOr = \a b -> a true b

churchNot :: ChurchBool -> ChurchBool
churchNot = \a -> a false true


showBool :: ChurchBool -> String
showBool b = b "True" "False"


test :: IO ()
test = do
  putStrLn $ "true AND false = " ++ showBool (churchAnd true false)
  putStrLn $ "true OR false = " ++ showBool (churchOr true false)
  putStrLn $ "NOT true = " ++ showBool (churchNot true)
  putStrLn $ "NOT false = " ++ showBool (churchNot false)
  putStrLn $ "ifThenElse true \"yes\" \"no\" = " ++ ifThenElse true "yes" "no"
  putStrLn $ "ifThenElse false \"yes\" \"no\" = " ++ ifThenElse false "yes" "no"
