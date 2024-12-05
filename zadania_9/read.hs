
import System.IO;
import System.Environment; -- dla funkcji getArgs


showFile :: Handle -> IO ()
showFile handle = do
                    eof<-hIsEOF handle
                    if eof then return ()
                    else do
                        line<-hGetLine handle
                        putStrLn line
                        showFile handle

main = do
        (firstArg:_) <-getArgs
        fileHandle <-openFile firstArg ReadMode
        showFile fileHandle
        hClose fileHandle