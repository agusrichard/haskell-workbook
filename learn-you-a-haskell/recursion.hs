maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x : xs)
  | x > maxTail = x
  | otherwise = maxTail
  where
    maxTail = maximum' xs

maximum2' :: (Ord a) => [a] -> a
maximum2' [] = error "maximum of empty list"
maximum2' [x] = x
maximum2' (x : xs) = max x (maximum' xs)

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x : replicate' (n -1) x

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x : xs) = x : take' (n -1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x : xs) = reverse' xs ++ [x]

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x : xs) (y : ys) = (x, y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x : xs)
  | a == x = True
  | otherwise = a `elem'` xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) =
  let smallerSorted = quicksort [a | a <- xs, a <= x]
      biggerSorted = quicksort [a | a <- xs, a > x]
   in smallerSorted ++ [x] ++ biggerSorted

myMaximum :: (Ord a) => [a] -> a
myMaximum [] = error "I dont take empty list"
myMaximum [x] = x
myMaximum (x : xs)
  | x >= m = x
  | otherwise = m
  where
    m = myMaximum xs

myMinimum :: (Ord a) => [a] -> a
myMinimum [] = error "Cant take empty list"
myMinimum [x] = x
myMinimum (x : xs)
  | x <= m = x
  | otherwise = m
  where
    m = myMinimum xs

mySum :: (Real a) => [a] -> a
mySum [] = 0
mySum (x : xs) = x + mySum xs

myProduct :: (Real a) => [a] -> a
myProduct [] = 1
myProduct (x : xs) = x * myProduct xs