fac n =
  if n <= 1
    then 1
    else n * fac (n - 1)
-- Guards
fac n
  | n <= 1 = 1
  | otherwise = n * fac (n - 1)

-- Pattern Matching
is_zero :: (Eq a, Num a) => a -> Bool
is_zero 0 = True
is_zero _ = False

fac_where :: (Ord t, Num t) => t -> t
fac_where n = aux n 1
  where
    aux n acc
      | n <= 1 = acc
      | otherwise = aux (n - 1) (n * acc)