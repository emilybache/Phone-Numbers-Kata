module PhoneNumber where

import Test.QuickCheck
import Data.List ((\\))

maxLength :: Int
maxLength = 15

data Digit = Number Int
           | Space
           | Dash deriving (Eq)	  

instance Show Digit where 
  show (Number x) = show x
  show (Space   ) = " "
  show (Dash    ) = "-"

instance Arbitrary Digit where
  arbitrary = elements (Space : Dash : digits) where
    digits = map Number [0..9]

data TelephoneNumber = TelephoneNumber String [Digit] deriving (Eq)

instance Show TelephoneNumber where
  show (TelephoneNumber name ds) = name ++ " : " ++ concatMap show ds

instance Arbitrary TelephoneNumber where  
  arbitrary = do
    num <- elements (map Number [0..9]) -- Must begin with number
    nums <- listOf1 arbitrary
    name <- elements ["John", "Fred", "George"]
    return (TelephoneNumber name (num:nums))

data AddressBook = AddressBook [TelephoneNumber] deriving Show

isConsistent :: AddressBook -> Bool
isConsistent (AddressBook numbers) = not (any id (map (\n -> isPrefixOf (numbers \\ [n]) n) numbers))

instance Arbitrary AddressBook where
  arbitrary = do
    nums <- listOf1 arbitrary
    return (AddressBook nums)   

isPrefixOf :: [TelephoneNumber] -> TelephoneNumber -> Bool
isPrefixOf nums num = any (startsWith num)  nums

-- Deliberately hyper naive!
startsWith :: TelephoneNumber -> TelephoneNumber -> Bool
startsWith (TelephoneNumber _ a) (TelephoneNumber _ b) = all id (zipWith (==) (filter isNumber a) (filter isNumber b))

isNumber :: Digit -> Bool
isNumber (Number _) = True
isNumber _          = False

-- Now, with this naive definition we can create test data that satisfies the definitions
inconsistent :: IO [AddressBook]
inconsistent = sample' (suchThat arbitrary (not . isConsistent))

consistent :: IO [AddressBook]
consistent = sample' (suchThat arbitrary isConsistent)

