exp1 :: Int -> Int -> Int
exp1 m 0 = 1
exp1 m (n+1) = m * (exp1 m n)

elem1 :: Eq a => a -> [a] -> Bool
elem1 a [] = False
elem1 a (b : bs) | a == b = True
	            | otherwise = elem1 a bs


merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x : xs) (y : ys) = if x > y then
			     y : merge (x : xs) ys
			  else
			     x : merge (y : ys) xs

halve :: [a] -> ([a], [a])
halve xs = splitAt(length xs `div` 2) xs
msort :: Ord a => [a] -> [a]
msort [x] = [x]
msort xs = merge (msort (fst (halve xs))) (msort (snd (halve xs)))

{-
last1 :: [a] -> [a]
last1 [] = []
last1 [x] = x
last1 (x : xs) = last1 xs
-}


{-
(^) :: Int -> Int -> Int
m^0 = 1
m^(n+1) = m * (m^n)
-}