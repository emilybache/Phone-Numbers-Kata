module PhoneNumber where

import Test.QuickCheck

data Digit = Number Int
           | Space
           | Dash deriving (Show,Eq)	   

data TelephoneNumber = TelephoneNumber [Digit] deriving (Show,Eq)

data AddressBook = AddressBook [TelephoneNumber]

isConsistent :: AddressBook -> Bool
isConsistent (AddressBook numbers) = undefined 