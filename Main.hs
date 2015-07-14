module Main where

import Parser

import System.IO

process :: String -> IO ()
process line = do
  let res = parseToplevel line
  case res of
    Left err -> print err
    Right ex -> mapM_ print ex

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  loop
  where
  loop = do
    putStr "ready> "
    input <- getLine
    case input of
      "" -> putStrLn "Goodbye."
      input -> do
        process input
        loop
