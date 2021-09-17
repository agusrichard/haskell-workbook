luckySeven :: Int -> [Char]
luckySeven 7 = "Thank god, you are a lucky one!"
luckySeven _ = "Sorry, you are not a lucky one."

factorial 0 = 1
factorial n = n * factorial (n - 1)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

findDistance :: (Floating a) => (a, a) -> (a, a) -> a
findDistance (x1, y1) (x2, y2) = sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

head' :: (Ord a) => [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x : _) = x

length' :: (Num a) => [a] -> a
length' [] = 0
length' (_ : xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x : xs) = x + sum' xs

allPlustTheFirst :: (Num a) => [a] -> a
allPlustTheFirst [] = error "Can't do that!"
allPlustTheFirst xs@(y : ys) = sum xs + y + sum ys

oddOrEven :: (Integral a) => a -> String
oddOrEven x
  | x `mod` 2 == 0 = "I've got you even"
  | x `mod` 2 /= 0 = "I am such an odd guy"
  | otherwise = "I am no body"

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
  | bmi <= 18.5 = "You are so skinny"
  | bmi <= 25.0 = "You are pretty normal"
  | bmi <= 30.0 = "You are fat! Get lose some weight"
  | otherwise = "You are a whale!"
  where
    bmi = weight / height ^ 2

myFunction :: Int -> String
myFunction x = if x == 0 then "It's zero" else "I am awesome"

listComprehensionWithLet :: (Integral a) => [a] -> [a]
listComprehensionWithLet xs = [y `mod` 2 | x <- xs, let y = x * 2]

amIYoung :: Int -> String
amIYoung x
  | x <= 0 = "You've not even born yet"
  | x <= 17 = "I guess you are pretty young"
  | otherwise = "You are a living dinosaur"

listFuncOne :: [Int] -> [Int]
listFuncOne [] = error "I dont take empty list"
listFuncOne xs = [x * z | x <- xs]
  where
    z = 10

listFuncTwo :: [Int] -> [Int]
listFuncTwo [] = error "I dont take empty list"
listFuncTwo xs = [x * z | x <- xs, let z = 99, x `mod` 2 == 0]

firstSecondSum :: (Real a) => [a] -> a -> a
firstSecondSum [] _ = 0
firstSecondSum _ x
  | x <= 0 = 0
  | otherwise = x