{-# LANGUAGE MagicHash #-}
module Foundation.Primitive.Types.Ptr
    ( Addr(..)
    , addrPlus
    , addrPlusSz
    , addrPlusCSz
    , Ptr(..)
    , ptrPlus
    , ptrPlusSz
    , ptrPlusCSz
    , castPtr
    ) where

import           Foundation.Internal.Base
import           Foundation.Primitive.Types.OffsetSize
import           GHC.Ptr
import           GHC.Prim
import           GHC.Types
import           Foreign.C.Types

data Addr = Addr Addr#
    deriving (Eq,Ord)

addrPlus :: Addr -> Offset Word8 -> Addr
addrPlus (Addr addr) (Offset (I# i)) = Addr (plusAddr# addr i)

addrPlusSz :: Addr -> Size Word8 -> Addr
addrPlusSz (Addr addr) (Size (I# i)) = Addr (plusAddr# addr i)

addrPlusCSz :: Addr -> CSize -> Addr
addrPlusCSz addr = addrPlusSz addr . sizeOfCSize

ptrPlus :: Ptr a -> Offset Word8 -> Ptr a
ptrPlus (Ptr addr) (Offset (I# i)) = Ptr (plusAddr# addr i)

ptrPlusSz :: Ptr a -> Size Word8 -> Ptr a
ptrPlusSz (Ptr addr) (Size (I# i)) = Ptr (plusAddr# addr i)

ptrPlusCSz :: Ptr a -> CSize -> Ptr a
ptrPlusCSz ptr = ptrPlusSz ptr . sizeOfCSize