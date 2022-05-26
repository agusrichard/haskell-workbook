oddEven x
    | x `mod` 2 == 0 = "I am even"
    | otherwise = "I am odd"

lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

myFactorial 1 = 1
myFactorial n = n * myFactorial (n - 1)

calc1 x y
    | x > y = (im x) * y
    | otherwise = 0
    where im x = 2 ^ x