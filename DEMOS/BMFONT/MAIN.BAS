Option _Explicit
'$Include: 'INCLUDES\VGA.BI'
'$include: 'INCLUDES\CONV.BI'
'$include: 'INCLUDES\BMFONT.BI'

Const cornflowerBlue = &HFF6495ED
Dim dump As String

common shared font as TBMFont
common shared fontGlyphs() as TBMFontGlyph
redim as TBMFontGlyph fontGlyphs(32 to 126)

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

freeBMFont font, fontGlyphs()

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
'$include: 'INCLUDES\BMFONT.BM'
