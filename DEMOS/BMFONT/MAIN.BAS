Option _Explicit
'$Include: 'INCLUDES\VGA.BI'
'$include: 'INCLUDES\CONV.BI'
'$include: 'INCLUDES\TIMING.BI'
'$include: 'INCLUDES\FPS.BI'
'$include: 'INCLUDES\BMFONT.BI'

Const cornflowerBlue = &HFF6495ED
const False = 0
const True = not false
Dim dump As String

common shared font as TBMFont
common shared fontGlyphs() as TBMFontGlyph
redim as TBMFontGlyph fontGlyphs(32 to 126)
' common shared imgGasolineMaid as long
dim done as integer
done = false

' Attempt to read the BMFont file
' DONE: Upgrade this to a sub: loadBMFont
' DONE: Add the freeBMFont counterpart
' DONE: Add the printBMFont sub
' DONE: Add measureBMFont sub
' DONE: Apply char offset adjustment
loadBMFont font, fontGlyphs(), "FONTS\P8.TXT"
' loadImage imgGasolineMaid, "gasoline_maid.png"

' print "Font face: " + font.face
' print "Filename: " + font.filename
' print "id 32 x: " + i32str(fontGlyphs(32).x)

initBuffer
' initFPSCounter

_Blend
_Font 8
_PrintMode _KeepBackground

do
  _limit 60

  incrementFPS
  if _KeyDown(27) then done = true

  Cls , cornflowerBlue

  ' color &hFFFFFFFF
  ' _PrintString (10, 10), "This is Font 8"
  spr font.imgHandle, 10, 20

  ' spr imgGasolineMaid, 150, 20

  ' dim w as integer
  ' dim s as string
  ' s = "hello pico-8 and qb64!"
  ' w = measureBMFont(s, font, fontGlyphs())
  ' printBMFont s, 10, 10, font, fontGlyphs()
  ' printBMFont "length: " + i32str(w), 10, 20, font, fontGlyphs()

  printBMFont "fps: " + i32str(lastFPS), 280, 0, font, fontGlyphs()

  ' Flush
  _PutImage , surface, scaled
  _Display
loop until done

cls
freeBMFont font, fontGlyphs()
' freeImage imgGasolineMaid

system


' implementation
'$include: 'INCLUDES\CONV.BM'
'$Include: 'INCLUDES\VGA.BM'
'$Include: 'INCLUDES\STRINGS.BM'
'$include: 'INCLUDES\BMFONT.BM'
'$include: 'INCLUDES\FPS.BM'
'$include: 'INCLUDES\TIMING.BM'
