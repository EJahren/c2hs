-- GENERATED by C->Haskell Compiler, version 0.17.2 Crystal Seed, 24 Jan 2009 (Haskell)
-- Edit the ORIGNAL .chs file instead!


{-# LINE 1 "Comments.chs" #-}
-- -*-haskell-*-
import Control.Monad
import Foreign
import Foreign.C

peekIntConv :: (Storable a, Integral a, Integral b) => Ptr a -> IO b
peekIntConv = liftM fromIntegral . peek


{-# LINE 15 "Comments.chs" #-}


data Colour = Red
            | Green
            | Blue
            deriving (Enum)

{-# LINE 33 "Comments.chs" #-}


barFun :: (Int) -> (Float)
barFun a1 =
  let {a1' = fromIntegral a1} in 
  let {res = barFun'_ a1'} in
  let {res' = realToFrac res} in
  (res')

{-# LINE 57 "Comments.chs" #-}


foobar :: (String) -> (Float) -> IO ((Int), (Int))
foobar a1 a3 =
  (\s f -> withCStringLen s (\(p, n) -> f (p, fromIntegral n))) a1 $ \(a1'1, a1'2) -> 
  alloca $ \a2' -> 
  let {a3' = realToFrac a3} in 
  foobar'_ a1'1  a1'2 a2' a3' >>= \res ->
  let {res' = fromIntegral res} in
  peekIntConv  a2'>>= \a2'' -> 
  return (res', a2'')

{-# LINE 87 "Comments.chs" #-}


main :: IO ()
main = do
  bar -- end of call hook
    3
  return ()

foreign import ccall safe "Comments.chs.h bar"
  barFun'_ :: (CInt -> CFloat)

foreign import ccall safe "Comments.chs.h foobar"
  foobar'_ :: ((Ptr CChar) -> (CInt -> ((Ptr CInt) -> (CFloat -> (IO CInt)))))

foreign import ccall safe "Comments.chs.h bar"
  bar :: (CInt -> (IO CFloat))