import Data.Map (Map)
import qualified Data.Map as Map

data Bool' = True | False

data Point = Point Float Float deriving (Show)

data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

data Seven = Seven Int

surface :: Shape -> Float
surface (Circle _ r) = pi * (r ^ 2)
surface (Rectangle (Point x1 y1) (Point x2 y2)) = abs x2 - x1 * abs y2 - y1

isSeven :: Seven -> String
isSeven (Seven x)
  | x == 7 = "I am seven"
  | otherwise = "Who the hell am I?"

listOfCircles = map (Circle (Point 1 2)) [1, 2, 3]

translate :: Shape -> Float -> Float -> Shape
translate (Circle (Point x y) r) a b = Circle (Point (x + a) (y + b)) r
translate (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1 + a) (y1 + b)) (Point (x2 + a) (y2 + b))

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)

data Person = Person String String Int deriving (Show)

email :: Person -> String
email (Person e _ _) = e

fullname :: Person -> String
fullname (Person _ fn _) = fn

age :: Person -> Int
age (Person _ _ a) = a

sherlock = Person "sherlock@holmes.com" "Sherlock Holmes" 35

data Animal = Animal
  { name :: String,
    old :: Int
  }
  deriving (Show)

godzilla = Animal {name = "Godzilla", old = 21}

-- data Car = Car
--   { company :: String,
--     model :: String,
--     year :: Int
--   }
--   deriving (Show)

-- tellCar :: Car -> String
-- tellCar (Car {company = c, model = m, year = y}) = "This " ++ show c ++ " " ++ show m ++ " was made in " ++ show y

data Car a b c = Car
  { company :: a,
    model :: b,
    year :: c
  }
  deriving (Show)

tellCar :: (Show a) => Car String String a -> String
tellCar Car {company = c, model = m, year = y} = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Eq, Ord, Show, Read, Bounded, Enum)

type IntMap = Map
type IntStringMap = Map Int String

myMap :: Integer -> Map Integer [Integer]
myMap n = Map.fromList (map makePair [1..n])
    where makePair x = (x, [x])

data Either' a b = Left' a | Right' b deriving (Eq, Ord, Read, Show)

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
  case Map.lookup lockerNumber map of
    Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"
    Just (state, code) -> if state /= Taken
                          then Right code
                          else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap  
lockers = Map.fromList   
    [(100,(Taken,"ZD39I"))  
    ,(101,(Free,"JAH3I"))  
    ,(103,(Free,"IQSA9"))  
    ,(105,(Free,"QOTSA"))  
    ,(109,(Taken,"893JJ"))  
    ,(110,(Taken,"99292"))  
    ]  

infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)