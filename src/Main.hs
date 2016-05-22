-- | Main module
module Main where


import Connection
import Control.Concurrent
import Network.Socket

-- | Main function
main::IO ()
main = do
  sock <- socket AF_INET Stream defaultProtocol
  bind sock $ SockAddrInet 3000 iNADDR_ANY
  listen sock 2
  connectionHandler sock

-- | Handles connections requested on a socket 
connectionHandler :: Socket -- ^ The socket to accept connections on 
                                  -> IO () 
connectionHandler sock = do
  (client, _) <- accept sock
  _ <- forkIO (startConn client)
  connectionHandler sock
