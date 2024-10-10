stirling :: Int -> Int -> Int
stirling 0 0 = 1
stirling n 0 | n >= 1 = 0
stirling n k | n == k = 1
stirling n k | k > n = 0 

stirling n k | n > k && k >= 1 = (n - 1) * stirling (n - 1) k + stirling (n - 1) (k - 1)
