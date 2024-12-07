import std/[algorithm, tables, strformat, strutils, math]

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

proc partTwo(filePath: string): void =
  var leftNums: seq[int] = @[]
  var rightNums: seq[int] = @[]

  let f: File = open(filePath)
  let fileLines: string = readAll(f)
  f.close() # Close the file after reading

  let splitNumbers: seq[string] = fileLines.splitWhitespace()

  for i in 0 ..< splitNumbers.len:
    if i mod 2 == 0:
      leftNums.add(parseInt(splitNumbers[i]))
    else:
      rightNums.add(parseInt(splitNumbers[i]))

  var similarityTable = initTable[int, int]()

  for num in rightNums:
    similarityTable[num] = similarityTable.getOrDefault(num, 0) + 1

  var answer = 0
  for num in leftNums:
    let occurrences = similarityTable.getOrDefault(num, 0)
    answer += num * occurrences

  echo answer



partTwo("./input1")
