-- -*-haskell-*-
import Control.Monad
import Foreign
import Foreign.C

peekIntConv :: (Storable a, Integral a, Integral b) => Ptr a -> IO b
peekIntConv = liftM fromIntegral . peek

{# -- start of context hook
  context -- context hook specifier
  prefix="comments" -- prefix
#}

{# -- start of enum hook 
  enum -- enum hook specifier
  colour -- c enum name
  as -- alias keyword
  Colour -- alias name
  { -- start namings
  upcaseFirstLetter -- ^ a naming
  } --end namings
#}

{# -- start of fun hook
  fun -- fun hook specifier
  pure -- pure
  bar -- c fun name
  as -- alias keyword
  barFun -- alias name
  { -- start of arguments
  `Int' -- ^ int argument
  } -- end of arguments
   -> -- output type keyword
   `Float' -- ^ Float output
#}

{# -- start of fun hook
  fun -- fun hook specifier
  foobar -- c name
  { -- start of arguments
  `String'& -- ^ first argument
   , -- first comma
   alloca- -- second argument in-marshaller
   `Int' -- ^ second argument
   peekIntConv* -- second argument out-marshaller
   , -- second comma
   `Float' -- ^ third argument
  } -- end of arguments
  -> -- output type keyword
  `Int' -- ^ output type
#}

main :: IO ()
main = do
  {# -- start of call hook
    call -- call hook specifier
    bar -- c name
  #} -- end of call hook
    3
  return ()
