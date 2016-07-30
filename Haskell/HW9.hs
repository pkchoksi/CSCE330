halve :: [a] -> ([a],[a])
halve xs = splitAt(length xs `div` 2) xs

safetail :: [a] -> [a]
{-
safetail xs = if (null xs) then xs else (tail xs)

safetail xs | (null xs) = xs
	    | otherwise = (tail xs)
-}
safetail [] = []
safetail (_:xs) = xs
