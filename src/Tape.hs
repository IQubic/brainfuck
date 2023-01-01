module Tape ( emptyTape
            , fromList
            , getFocus
            , modifyFocus
            , moveLeft
            , moveRight
            ) where

-- | A tape. Essentially a list zipper.
-- Invariant: The left and right lists will always be infinite
data Tape a = T [a] a [a]

-- An empty tape with all elements set to a default value
emptyTape :: a -> Tape a
emptyTape def = T (repeat def) def (repeat def)

-- | Create a tape from a list
-- The head is the focus, the tail goes to the left
-- The rest is filled with a default value
fromList :: a -> [a] -> Tape a
fromList _   [] = error "fromList: empty tape"
fromList def (x:xs) = T (repeat def) x (xs ++ repeat def)

-- | Get the focus
getFocus :: Tape a -> a
getFocus (T _ x _) = x

-- | Modify the focus
modifyFocus :: (a -> a) -> Tape a -> Tape a
modifyFocus f (T ls x rs) = T ls (f x) rs

-- | Move the focus one step left
moveLeft :: Tape a -> Tape a
moveLeft (T [] _ _) = error "moveLeft: Empty left list"
moveLeft (T (l:ls) x rs) = T ls l (x:rs)

-- | Move the focus one step right
moveRight :: Tape a -> Tape a
moveRight (T _ _ []) = error "moveRight: Empty right list"
moveRight (T ls x (r:rs)) = T (x:ls) r rs
