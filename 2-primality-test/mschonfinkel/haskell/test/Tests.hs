{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE RecordWildCards #-}

import Data.Foldable     (for_)
import Test.Hspec        (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import Primes

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "isPrime" $ for_ cases test
  where

    test Case{..} = it explanation assertion
      where
        explanation = unwords [show input, "-", description]
        assertion   = isPrime (fromInteger input) `shouldBe` expected

data Case = Case { description :: String
                 , input       :: Integer
                 , expected    :: Bool
                 }

cases :: [Case]
cases = [ Case { description = "Check if 0 is not prime"
               , input       = 0
               , expected    = False
               }
        , Case { description = "Check if 1 is not prime"
               , input       = 1
               , expected    = False
               }
        , Case { description = "Check if 2 is prime"
               , input       = 2
               , expected    = True
               }
        , Case { description = "Check if 3 is prime"
               , input       = 3
               , expected    = True
               }
        , Case { description = "Check if 79 is prime"
               , input       = 79
               , expected    = True
               }
        , Case { description = "Check if 561 is not prime"
               , input       = 561
               , expected    = False
               }
        , Case { description = "Check if 1471 is prime"
               , input       = 1471
               , expected    = True
               }
        , Case { description = "Check if 104742 is not prime"
               , input       = 104742
               , expected    = False
               }
        , Case { description = "Check if 104743 is prime"
               , input       = 104743
               , expected    = True
               }
        ]