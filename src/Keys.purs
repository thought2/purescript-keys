module Keys where

import Prelude

import Data.Bounded.Generic (genericBottom, genericTop)
import Data.Const (Const)
import Data.Enum (class BoundedEnum, class Enum, fromEnum)
import Data.Enum.Generic (genericCardinality, genericFromEnum, genericPred, genericSucc, genericToEnum)
import Data.Generic.Rep (class Generic)
import Data.Identity (Identity)
import Data.Show.Generic (genericShow)

-- https://en.wikipedia.org/wiki/Keyboard_layout#/media/File:ISO_keyboard_(105)_QWERTY_UK.svg

--- FunctionKey

data FunctionKey
  = F1
  | F2
  | F3
  | F4
  | F5
  | F6
  | F7
  | F8
  | F9
  | F10
  | F11
  | F12

derive instance Eq FunctionKey
derive instance Ord FunctionKey
derive instance Generic FunctionKey _

instance Enum FunctionKey where
  succ = genericSucc
  pred = genericPred

instance Bounded FunctionKey where
  bottom = genericBottom
  top = genericTop

instance BoundedEnum FunctionKey where
  cardinality = genericCardinality
  toEnum = genericToEnum
  fromEnum = genericFromEnum

instance Show FunctionKey where
  show = genericShow

functionKeyToInt :: FunctionKey -> Int
functionKeyToInt = fromEnum >>> (_ + 1)

--- NavigationKey

data NavigationKey
  = NavHome
  | NavEnd
  | NavPageKey PageKey
  | NavArrowKey ArrowKey

derive instance Generic NavigationKey _

derive instance Eq NavigationKey

instance Show NavigationKey where
  show = genericShow

--- PageKey

data PageKey
  = PageUp
  | PageDown

derive instance Generic PageKey _

derive instance Eq PageKey

instance Show PageKey where
  show = genericShow

--- ArrowKey

data ArrowKey
  = ArrowUp
  | ArrowDown
  | ArrowLeft
  | ArrowRight

derive instance Generic ArrowKey _

derive instance Eq ArrowKey

instance Show ArrowKey where
  show = genericShow

--- LetterKey

data LetterKey
  = LetterA
  | LetterB
  | LetterC
  | LetterD
  | LetterE
  | LetterF
  | LetterG
  | LetterH
  | LetterI
  | LetterJ
  | LetterK
  | LetterL
  | LetterM
  | LetterN
  | LetterO
  | LetterP
  | LetterQ
  | LetterR
  | LetterS
  | LetterT
  | LetterU
  | LetterV
  | LetterW
  | LetterX
  | LetterY
  | LetterZ

derive instance Generic LetterKey _
derive instance Ord LetterKey
derive instance Eq LetterKey

instance Show LetterKey where
  show = genericShow

instance Enum LetterKey where
  succ = genericSucc
  pred = genericPred

instance Bounded LetterKey where
  bottom = genericBottom
  top = genericTop

instance BoundedEnum LetterKey where
  cardinality = genericCardinality
  toEnum = genericToEnum
  fromEnum = genericFromEnum

--- DigitKey

data DigitKey
  = Digit0
  | Digit1
  | Digit2
  | Digit3
  | Digit4
  | Digit5
  | Digit6
  | Digit7
  | Digit8
  | Digit9

derive instance Generic DigitKey _
derive instance Ord DigitKey
derive instance Eq DigitKey

instance Show DigitKey where
  show = genericShow

instance Enum DigitKey where
  succ = genericSucc
  pred = genericPred

instance Bounded DigitKey where
  bottom = genericBottom
  top = genericTop

instance BoundedEnum DigitKey where
  cardinality = genericCardinality
  toEnum = genericToEnum
  fromEnum = genericFromEnum

--- CharacterKey

data CharacterKey
  = LetterKey LetterKey
  | DigitKey DigitKey

derive instance Generic CharacterKey _

derive instance Eq CharacterKey

instance Show CharacterKey where
  show = genericShow

--- ModifierKey

data ModifierKey
  = ModCtrl
  | ModShift
  | ModAlt
  | ModAltGr

derive instance Generic ModifierKey _

derive instance Eq ModifierKey

instance Show ModifierKey where
  show = genericShow

--- ControlKey

data ControlKey
  = ControlEnter
  | ControlBackspace

derive instance Generic ControlKey _

derive instance Eq ControlKey

--- Key

data Key f
  = FunctionKey FunctionKey
  | NavigationKey NavigationKey
  | CharacterKey CharacterKey
  | ModifierKey (f ModifierKey)

derive instance Generic (Key Identity) _

derive instance Eq (Key Identity)

instance Show (Key Identity) where
  show = genericShow

derive instance Generic (Key (Const Void)) _

derive instance Eq (Key (Const Void))

instance Show (Key (Const Void)) where
  show = genericShow

--- Shorthands

type KeyWithMod = Key Identity

type KeySansMod = Key (Const Void)
