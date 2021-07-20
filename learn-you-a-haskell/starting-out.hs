doubleMe :: Num a => a -> a
doubleMe x = x + x

doubleUs :: Num a => a -> a -> a
doubleUs x y = x * 2 + y * 2

doubleUsTwo :: Num a => a -> a -> a
doubleUsTwo x y = doubleMe x + doubleMe y

doubleSmallNumber :: (Ord a, Num a) => a -> a
doubleSmallNumber x =
  if x > 100
    then x
    else x * 2

doubleMeList :: Num a => [a] -> [a]
doubleMeList xs = [x * 2 | x <- xs]

doubleMeIfIAmOdd :: [Int] -> [Int]
doubleMeIfIAmOdd xs = [if odd x then 2 * x else x | x <- xs]

triangles :: [(Integer, Integer, Integer)]
triangles = [(a, b, c) | c <- [1 .. 10], b <- [1 .. 10], a <- [1 .. 10]]

rightTriangles :: [(Integer, Integer, Integer)]
rightTriangles = [(a, b, c) | c <- [1 .. 10], b <- [1 .. c], a <- [1 .. b], a ^ 2 + b ^ 2 == c ^ 2]