module Brainfuck where

import Tape

-- The op codes we will parse into
data BFOp = OAdd
          | OSub
          | OLeft
          | ORight
          | OInput
          | OOutput
          | OLoop [BFOp]
           deriving Show
