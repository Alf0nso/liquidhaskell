module SndOrdPredNonRel where

{-@ reflect foo @-}
foo :: Int -> Int
foo x = x + 1

{-@ relational bar ~ bar :: f1:(x1':_ -> _) -> x1:_ -> _ 
                          ~ f2:(x2':_ -> _) -> x2:_ -> _ 
                         ~~ (x1' < x2' => r1 x1' <= r2 x2') => x1 < x2 => r1 f1 x1 <= r2 f2 x2 @-}
bar :: (Int -> Int) -> Int -> Int
bar f x = f (x + 1)

{-@ relational baz ~ baz :: x1:Int -> Int ~ x2:Int -> Int ~~ x1 < x2 => r1 x1 < r2 x2 @-}
baz :: Int -> Int
baz x = bar foo x