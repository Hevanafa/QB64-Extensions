Option _Explicit
'$Include: 'INCLUDES\VGA.BI'
'$include: 'INCLUDES\CONV.BI'


type TBMFontGlyph
  as integer id, x, y
  as integer width, height, xoffset, yoffset, xadvance
  ' as integer page, chnl
end type

type TBMFont
  face as string
  filename as string
  lineHeight as integer
  imgHandle as long
end type

Const cornflowerBlue = &HFF6495ED
Dim dump As String

dim font as TBMFont
dim fontGlyphs(32 to 126) as TBMFontGlyph


' Attempt to read the BMFont file
' DONE: Upgrade this to a sub: loadBMFont
' TODO: Add the freeBMFont counterpart
' TODO: Add the printBMFont sub
' TODO: Add measureBMFont sub
loadBMFont font, fontGlyphs(), "FONTS\P8.TXT"

print "Font face: " + font.face
print "Filename: " + font.filename
print "id 32 x: " + i32str(fontGlyphs(32).x)

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


' implementation
'$include: 'INCLUDES\CONV.BM'
'$Include: 'INCLUDES\VGA.BM'
'$Include: 'INCLUDES\STRINGS.BM'

sub loadBMFont(font as TBMFont, fontGlyphs() as TBMFontGlyph, filename as string)
  if not _fileexists(filename) then
    print "Error: Couldn't open file!"
    end
  end if

  dim as string  txtLine
  dim as integer a
  dim as string  pairs(0 to 9)
  dim as string  pair(0 to 1)
  dim as string  k, v
  dim as TBMFontGlyph tempGlyph

  open filename for input as #1

  do while not EOF(1)
    line input #1, txtLine
    
    if startsWith(txtLine, "info") then
      split txtLine, " ", pairs()

      for a=0 to ubound(pairs)
        print i32str(a) + ": " + pairs(a)

        split pairs(a), "=", pair()
        k = pair(0): v = pair(1)
        if k = "face" then _
          font.face = replaceAll(v, chr$(34), "")
      next

    elseif startsWith(txtLine, "page") then
      split txtLine, " ", pairs()

      for a=0 to ubound(pairs)
        print i32str(a) + ": " + pairs(a)

        split pairs(a), "=", pair()
        k = pair(0): v = pair(1)
        if k = "file" then _
          font.filename = replaceAll(v, chr$(34), "")
      next

      ' print txtLine
    elseif startsWith(txtLine, "char") and not startsWith(txtLine, "chars") then
      do while contains(txtLine, "  ")
        txtLine = replaceAll(txtLine, "  ", " ")
      loop
      ' print txtLine

      ' Parse the whole line first, then copy the record/UDT to the list of font glyphs
      split txtLine, " ", pairs()

      for a=0 to ubound(pairs)
        print i32str(a) + ": " + pairs(a)

        split pairs(a), "=", pair()
        k = pair(0): v = pair(1)
        if k = "id" then
          tempGlyph.id = parseInt(v)
        elseif k = "x" then tempGlyph.x = parseInt(v)
        elseif k = "y" then tempGlyph.y = parseInt(v)
        elseif k = "width" then tempGlyph.width = parseInt(v)
        elseif k = "height" then tempGlyph.height = parseInt(v)
        elseif k = "xoffset" then tempGlyph.xoffset = parseInt(v)
        elseif k = "yoffset" then tempGlyph.yoffset = parseInt(v)
        elseif k = "xadvance" then tempGlyph.xadvance = parseInt(v)
        end if
      next

      if lbound(fontGlyphs) <= tempGlyph.id and tempGlyph.id <= ubound(fontGlyphs) then _
        fontGlyphs(tempGlyph.id) = tempGlyph
    end if
  loop

  close #1

  if isImageSet(font.imgHandle) then freeImage font.imgHandle
  loadImage font.imgHandle, font.filename
end sub

'$include: 'INCLUDES\BITMAP.BM'
