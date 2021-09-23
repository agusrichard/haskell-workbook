addThree :: (Num a) => a -> a -> a -> a
addThree x y z = x + y + z

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred x = compare 100 x

compareWithOne :: (Num a, Ord a) => a -> Ordering
compareWithOne = compare 1

divideTwo :: (Floating a) => a -> a
divideTwo = (/ 2)

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n : chain (n `div` 2)
  | odd n = n : chain (n * 3 + 1)
  | otherwise = [n]

minus' :: (Real a) => a -> a -> a
minus' x y = x - y

minusTen :: (Real a) => a -> a
minusTen = (subtract 10)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

applyMod :: (a -> a -> a) -> a -> a
applyMod f x = f x x

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x : xs) = f x : map' f xs

zipWithThree :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
zipWithThree _ [] _ _ = []
zipWithThree _ _ [] _ = []
zipWithThree _ _ _ [] = []
zipWithThree f (x : xs) (y : ys) (z : zs) = f x y z : zipWithThree f xs ys zs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x : xs)
  | p x = x : filter' p xs
  | otherwise = filter' p xs

myMap' :: (a -> b) -> [a] -> [b]
myMap' _ [] = []
myMap' f (x : xs) = f x : myMap' f xs

myFilter' :: (a -> Bool) -> [a] -> [a]
myFilter' _ [] = []
myFilter' p (x : xs)
  | p x = x : myFilter' p xs
  | otherwise = myFilter' p xs

collatzChain :: Int -> [Int]
collatzChain 1 = [1]
collatzChain n
  | even n = n : collatzChain (n `div` 2)
  | odd n = n : collatzChain (3 * n + 1)
  | otherwise = [n]

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1 .. 100]))
  where
    isLong xs = length xs > 15