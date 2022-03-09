elem' :: Eq t => t -> [t] -> Bool
elem' _ [] = False
elem' a (x : xs) = (a == x) || (elem' a xs)

nub' :: Eq a => [a] -> [a]
nub' [] = []
nub' (x : xs)
  | elem' x xs = nub' xs
  | otherwise = x : nub' xs

is_asc :: [Int] -> Bool
is_asc [] = True
is_asc [x] = True
is_asc (x : y : xs)
  | x > y = False
  | otherwise = is_asc (y : xs)