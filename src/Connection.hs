module Connection(startConn) where

import Network.Socket
import System.IO

startConn :: Socket -> IO ()

startConn client = do
  hdl <- socketToHandle client ReadMode
  hSetBuffering hdl NoBuffering
  contents <- hGetContents hdl
  putStr contents
