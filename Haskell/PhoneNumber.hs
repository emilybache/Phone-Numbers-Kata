module PhoneNumber where

import Test.QuickCheck

maxLength :: Int
maxLength = 15

data Digit = Number Int
           | Space
           | Dash deriving (Show,Eq)	   

instance Arbitrary Digit where
  arbitrary = elements (Space : Dash : digits) where
    digits = map Number [0..9]

data TelephoneNumber = TelephoneNumber [Digit] deriving (Show,Eq)

instance Arbitrary TelephoneNumber where  
  arbitrary = do
    nums <- listOf1 arbitrary
    return (TelephoneNumber nums)

data AddressBook = AddressBook [TelephoneNumber]

isConsistent :: AddressBook -> Bool
isConsistent (AddressBook numbers) = not (any id (map (isPrefixOf numbers) numbers))

instance Arbitrary AddressBook where
  arbitrary = do
    nums <- listOf1 arbitrary
    return (AdddressBook numbers)
    

isPrefixOf :: [TelephoneNumber] -> TelephoneNumber -> Bool
isPrefixOf nums num = any (startsWith num)  nums

startsWith :: TelephoneNumber -> TelephoneNumber -> Bool
startsWith (TelephoneNumber a) (TelephoneNumber b) = all id (zipWith (==) a b)