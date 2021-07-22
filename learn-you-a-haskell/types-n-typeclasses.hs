removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A' .. 'Z']]

addThree :: Int -> Int -> Int -> Int
addThree a b c = a + b + c

factorial :: Integer -> Integer
factorial x = product [1 .. x]

-- fromIntegral :: (Num a, Integral b) => b -> a
-- fromIntegral x = x :: Float