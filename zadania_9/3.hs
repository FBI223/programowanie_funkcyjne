import System.IO;
import System.Environment; -- dla funkcji getArgs


main :: IO ()
main = do
    (firstArg:_) <- getArgs                     -- Pobierz pierwszy argument z wiersza poleceń
    fileHandle <- openFile firstArg ReadMode    -- Otwórz plik w trybie odczytu
    content <- hGetContents fileHandle          -- Pobierz zawartość pliku
    let liczba_znakow = length content          -- Policz liczbę znaków w pliku
    putStrLn $ "Liczba znaków: " ++ show liczba_znakow
    hClose fileHandle   



{-

import System.Environment
import System.IO
 
countFile :: Handle -> IO Int
countFile handle = do
  eof <- hIsEOF handle
  if eof
    then return 0
    else do
      line <- hGetLine handle
      count <- countFile handle
      return (length line + count)
 

 
main = do
  (firstArg : _) <- getArgs
  fileHandle <- openFile firstArg ReadMode
  count <- countFile fileHandle
  print count
  hClose fileHandle

-}

