pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x,y,z) | x<-[1..n], y<-[1..n], z<-[1..n], (x^2+y^2==z^2)]

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (reverse (tail(reverse (factors x)))) == x]

scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum[(x*y) | (x,y) <- zip xs ys]