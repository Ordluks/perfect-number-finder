module Main where

import System.TimeIt (timeIt)

findDividers :: Int -> [Int]
findDividers num =
  1
    : filter
      (\x -> num `mod` x == 0)
      [2 .. num - 1]

isPerfectNumber :: Int -> Bool
isPerfectNumber num = num /= 1 && sum (findDividers num) == num

readInput :: IO Int
readInput = do
  text <- getLine
  return (read text :: Int)

perfectNumbersFinder :: Int -> Int -> IO ()
perfectNumbersFinder from to = print $ filter isPerfectNumber [from .. to]

main :: IO ()
main = do
  putStrLn "From:"
  from <- readInput
  putStrLn "To:"
  to <- readInput
  timeIt $ perfectNumbersFinder from to