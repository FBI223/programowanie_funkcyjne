import System.IO;
import System.Environment;
 
eratosthenes :: Int -> [Int]
eratosthenes n = eratosthenesPrim [2 .. n]
    where
        eratosthenesPrim [] = []
        eratosthenesPrim (x : xs) = x : eratosthenesPrim (filter (\y -> y `mod` x /= 0) xs)
 


writePrimesToFile :: Handle -> [Int] -> IO ()
writePrimesToFile handle [] = return ()
writePrimesToFile handle (x : xs) = do
                                        hPutStrLn handle (show x)
                                        writePrimesToFile handle xs
 
 
main :: IO ()
main = do
    (firstArg : secondArg : _) <- getArgs
    fileHandle <- openFile firstArg WriteMode
    let n = read secondArg :: Int
    writePrimesToFile fileHandle (eratosthenes n)
    hClose fileHandle

