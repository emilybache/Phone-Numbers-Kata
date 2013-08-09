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

data AddressBook = AddressBook [TelephoneNumber]

isConsistent :: AddressBook -> Bool
isConsistent (AddressBook numbers) = undefined 