option _explicit

Const inputStr = "a,b,c"

Dim As String items(9)
Dim As String dump
dim as integer a

split inputStr, ",", items()

for a=0 to ubound(items)
  print items(a)
next

Input "Press Enter to continue"; dump
System

' implementation

sub split(text as string, delimiter as string, outputAry() as string)
  dim as integer i, startPos, delimPos
  dim as string token

  for i = 0 to ubound(outputAry)
    outputAry(i) = ""
  next

  startPos = 1
  i = 0

  do while startPos <= len(text) and i <= ubound(outputAry)
    delimPos = instr(startPos, text, delimiter)

    if delimPos = 0 then
      token = mid$(text, startPos)
    else
      token = mid$(text, startPos, delimPos  - startPos)
    end if

    outputAry(i) = token
    i = i + 1

    if delimPos = 0 then exit do
    startPos = delimPos + len(delimiter)
  loop
end sub
