class MyEq a where  
    (==) :: a -> a -> Bool  
    (/=) :: a -> a -> Bool  
    x == y = not (x Main./= y)  
    x /= y = not (x Main.== y)

data TrafficLight = Red | Yellow | Green 

instance MyEq TrafficLight where  
    Red == Red = True  
    Green == Green = True  
    Yellow == Yellow = True  
    _ == _ = False