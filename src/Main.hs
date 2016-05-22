import Connection
import Control.Concurrent
import Network.Socket

main::IO()
main = do
  sock <- socket AF_INET Stream defaultProtocol
  bind sock $ SockAddrInet 3000 iNADDR_ANY
  listen sock 2
  connectionHandler sock
  
connectionHandler :: Socket -> IO ()
connectionHandler sock = do
  (client, _) <- accept sock
  _ <- forkIO (startConn client)
  connectionHandler sock
