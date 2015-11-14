fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib x | x > 1 = fib (x - 2) + fib (x - 1)

main = do
    print (sum [fib x | x <- [1..32], even (fib x)])
