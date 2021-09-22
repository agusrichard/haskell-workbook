addThree :: (Num a) => a -> a -> a -> a
addThree x y z = x + y + z

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred x = compare 100 x

compareWithOne :: (Num a, Ord a) => a -> Ordering
compareWithOne = compare 1

divideTwo :: (Floating a) => a -> a
divideTwo = (/ 2)

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