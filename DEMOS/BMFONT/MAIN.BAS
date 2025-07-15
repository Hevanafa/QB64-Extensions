Option _Explicit
'$Include: 'INCLUDES\VGA.BI'

type TBMFont
  face as string
end type

Const cornflowerBlue = &HFF6495ED
Dim dump As String
dim font as TBMFont


' TODO: Try to read the BMFont file
if not _fileexists("FONTS\P8.TXT") then
  print "Error: Couldn't open file!"
  end
end if

open "FONTS\P8.TXT" for input as #1

dim txtLine as string
do while not EOF(1)
  line input #1, txtLine
  
  if startsWith(txtLine, "info") then
    print ""
    ' print txtLine
  elseif startsWith(txtLine, "char") then
    if not startsWith(txtLine, "chars") then
      do while contains(txtLine, "  ")
        txtLine = replaceAll(txtLine, "  ", " ")
      loop
      print txtLine
    end if
  end if
loop

close #1

input "", dump

end


initBuffer

_font 8


Cls , cornflowerBlue

' color &hFFFFFFFF
' _PrintString (10, 10), "This is Font 8"

' Flush
_PutImage , surface, scaled
_Display

Input "asdf", dump

system


'$Include: 'INCLUDES\VGA.BM'
'$Include: 'INCLUDES\STRINGS.BM'
