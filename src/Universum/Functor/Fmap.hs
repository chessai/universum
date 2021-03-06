{-# LANGUAGE Safe #-}

module Universum.Functor.Fmap
       ( map
       , (<<$>>)
       ) where

import Universum.Function ((.))
import Universum.Functor.Reexport (Functor (..))

-- | 'Prelude.map' generalized to 'Functor'.
map :: Functor f => (a -> b) -> f a -> f b
map = fmap

-- $setup
-- >>> import Universum.Base (negate)
-- >>> import Universum.Monad (Maybe (..))

-- | Alias for @fmap . fmap@. Convenient to work with two nested 'Functor's.
--
-- >>> negate <<$>> Just [1,2,3]
-- Just [-1,-2,-3]
(<<$>>) :: (Functor f, Functor g) => (a -> b) -> f (g a) -> f (g b)
(<<$>>) = fmap . fmap
infixl 4 <<$>>
