-- Higher Order Function
apply :: (a -> b) -> a -> b
apply f x = f x

add_one :: Num a => a -> a
add_one x = x + 1

-- Anonymous Functions
add_two :: Integer -> Integer
add_two = \x -> x + 1

add_two_points :: Integer -> Integer -> Integer
add_two_points = (\x y -> x + y)

map' :: (t -> a) -> [t] -> [a]
map' f xs = [f x | x <- xs]

filter' :: (a -> Bool) -> [a] -> [a]
filter' f xs = [x | x <- xs, f x]