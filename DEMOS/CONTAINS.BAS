dim as string inputStr
inputStr = "abcdef"

print "Does inputStr contain abc?"
print contains(inputStr, "abc")

print "Does inputStr contain def?"
print contains(inputStr, "def")

print "Does inputStr contain xyz?"
print contains(inputStr, "xyz")



function contains% (source as string, searchStr as string)
  contains% = instr(source, searchStr) <> 0
end function
