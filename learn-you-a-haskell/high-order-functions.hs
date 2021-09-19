addThree :: (Num a) => a -> a -> a -> a
addThree x y z = x + y + z

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred x = compare 100 x