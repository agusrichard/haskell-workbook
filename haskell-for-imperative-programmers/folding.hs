-- foldr (\x acc -> expression) start_acc list
sum' :: [Int] -> Int
sum' = foldr (+) 0

count :: (Foldable t, Eq a, Num b) => a -> t a -> b
count e = foldr (\x acc -> if x == e then acc + 1 else acc) 0

is_all :: (Foldable t, Eq a) => a -> t a -> Bool
is_all e = foldr (\x acc -> e == x && acc) True

length :: [a] -> Int
length = foldr (const $ (+) 1) 0

-- foldl (\x acc elem -> expression) start_acc list