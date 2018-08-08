import Gauge.Main
import Control.Monad
import Data.IORef
import qualified Data.Vector.Unboxed.Mutable as V

{-
IORef                                    mean 5.602 μs  ( +- 193.2 ns  )
vector                                   mean 1.650 μs  ( +- 16.67 ns  )
-}
main = do
  ref <- newIORef (0 :: Int)
  vec <- V.replicate 1 (0 :: Int)
  defaultMain
    [ bench "IORef" $ nfIO $ replicateM_ 1000 $ modifyIORef' ref (+1)
    , bench "vector" $ nfIO $ replicateM_ 1000 $ V.modify vec (+1) 0
    ]
