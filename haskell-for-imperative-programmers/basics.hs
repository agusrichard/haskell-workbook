my_sum :: Num a => [a] -> a
my_sum [] = 0
my_sum (x : xs) = x + my_sum xs

in_range :: Ord p => p -> p -> p -> Bool
in_range min max x = x >= min && x <= max

x :: Int
x = 5

in_range_let :: Ord p => p -> p -> p -> Bool
in_range_let min max x =
  let in_lower_bound = x >= min
      in_upper_bound = x <= max
   in in_lower_bound && in_upper_bound

in_range_where :: Ord p => p -> p -> p -> Bool
in_range_where min max x = in_lower_bound && in_upper_bound
  where
    in_lower_bound = x >= min
    in_upper_bound = x <= max

in_range_if :: Ord p => p -> p -> p -> Bool
in_range_if min max x = if ilb then iub else False
  where
    ilb = x >= min
    iub = x <= max