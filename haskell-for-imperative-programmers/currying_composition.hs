-- Currying and Partial Function Application
add :: Integer -> Integer -> Integer
add = (\x -> (\y -> x + y))

double_list :: [Integer] -> [Integer]
double_list = map (\x -> 2 * x)

-- Composition
-- f . g === \x -> f (g x)
double = (\x -> 2 * x)

triple = (\x -> 3 * x)

double_triple_me = triple . double

-- Dollar sign
f xs = map (\x -> x + 1) (filter (\x -> x > 1) xs)

f' xs = map (\x -> x + 1) $ filter (\x -> x > 1) xs