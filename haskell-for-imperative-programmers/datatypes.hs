data Calculation = Add Int Int | Sub Int Int | Mul Int Int | Div Int Int

calc :: Calculation -> Int
calc (Add x y) = x + y
calc (Sub x y) = x - y
calc (Mul x y) = x * y
calc (Div x y) = div x y