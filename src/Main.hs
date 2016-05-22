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
  thingToPrint <- recv client 500
  printTheShit thingToPrint

printTheShit :: String -> IO ()
printTheShit shitToPrint = do
  putStr shitToPrint
