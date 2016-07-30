import Data.Char

type Bit = Int
bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2 * y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode :: String -> [Bit]
encode = concat . map (addparity . make8 . int2bin .ord)

decode :: [Bit] -> String
decode = map (chr . bin2int . checkparity) .chop9

addparity :: [Bit] -> [Bit]
addparity bs = (parity bs) : bs

parity :: [Bit] -> Bit
parity bs = if odd (sum bs) then
		1
	    else
		0

checkparity :: [Bit] -> [Bit]
checkparity (b : bs) = if b == parity bs then
				bs
		       else
				error "error: parity bits do not match"

chop9 :: [Bit] -> [[Bit]]
chop9 [] = []
chop9 bits = take 9 bits : chop9 (drop 9 bits)

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id

-- forget the first bit
forgetFirst :: [Bit] ->[Bit]
forgetFirst xs = tail xs

channel' :: [Bit] -> [Bit]
channel' = forgetFirst 

transmit' :: String -> String
transmit' = decode . channel' . encode

{-
import Data.Char

type Bit = Int
bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2 * y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode :: String -> [Bit]
encode = concat . map (make8 . int2bin . ord)

chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

decode :: [Bit] -> String
decode = map (chr . bin2int) . chop8

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id
-}