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