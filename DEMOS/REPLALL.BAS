dim as string inputStr, changed
inputStr = "a bb cccc cccccc cc cccccc"

print "inputStr: """ + inputStr + """"

changed = replaceAll(inputStr, "cc", "d")
print "After: " + changed

' implementation

function replaceAll$(source as string, searchStr as string, replaceStr as string)
  dim result as string
  dim as integer foundPos, lastPos

  if len(searchStr) = 0 then
    replaceAll$ = source
    exit function
  end if

  result = ""
  lastPos = 1

  do
    foundPos = instr(lastPos, source, searchStr)

    if foundPos = 0 then
      result = result + mid$(source, lastPos)
      exit do
    else
      result = result + mid$(source, lastPos, foundPos - lastPos)
      result = result + replaceStr
      lastPos = foundPos + len(searchStr)
    end if
  loop

  replaceAll$ = result
end function
