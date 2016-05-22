-- | The module for handling connections
module Connection(startConn) where
import Network.Socket
import System.IO

-- | Handles a connection to a client, writing everything it sends to the command line
startConn ::  Socket -- ^ The client socket
                  -> IO () 
startConn client = do
  hdl <- socketToHandle client ReadMode
  hSetBuffering hdl NoBuffering
  contents <- hGetContents hdl
  putStr contents
