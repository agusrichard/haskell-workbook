range :: (Ord t, Num t) => t -> t -> t -> [t]
range m n s
  | m >= n = []
  | otherwise = m : range (m + s) n s

and' :: [Bool] -> Bool
and' [] = True
and' (x : xs) = if x == False then x else and' xs

or' :: [Bool] -> Bool
or' [] = False
or' (x : xs) = if x then x else or' xs

pairs :: [(Integer, Integer)]
pairs = [(x, y) | x <- [1, 2, 3], y <- [1, 2, 3]]

evens :: [Int] -> [Int]
evens [] = []
evens (x : xs)
  | (mod x 2) == 0 = x : evens xs
  | otherwise = evens xs

-- Tuples
fst :: (a, b) -> a
fst (x, _) = x

snd :: (a, b) -> b
snd (_, y) = y

add_tuples :: Num a => [(a, a)] -> [a]
add_tuples xs = [x + y | (x, y) <- xs]