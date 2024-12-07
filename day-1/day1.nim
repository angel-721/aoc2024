import strutils
import std/algorithm
import math

proc partOne(filePath: string): void =

  var leftNums: seq[int] = @[]
  var rightNums: seq[int] = @[]

  var differences: seq[int] = @[]

  let f: File = open(file_path)
  let fileLines: string = readAll(f)
  let splitNumbers: seq[string] = fileLines.splitWhitespace()

  for i in 0 ..< splitNumbers.len:
    if i mod 2 == 0:
      leftNums.add(parseInt(splitNumbers[i]))
    else:
      rightNums.add(parseInt(splitNumbers[i]))


  leftNums.sort()
  rightNums.sort()

  for i in 0 ..< leftNums.len:
    differences.add(abs(leftNums[i] - rightNums[i]))


  echo differences.sum()





partOne("./input1")
