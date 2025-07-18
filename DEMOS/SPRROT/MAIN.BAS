option _explicit

'$include: 'INCLUDES\VGA.BI'

const cornflowerBlue = &hFF6495ED
const False = 0
const True = not False

dim shared as long imgGasolineMaid
dim as integer done
dim as integer w, h

dim as double angle

initBuffer
loadImage imgGasolineMaid, "gasoline_maid.png"

_font 8
_printMode _keepBackground

do
  ' Update
  _limit 60
  angle=angle+0.03

  if inkey$ = chr$(27) then done = true

  ' Draw
  cls , cornflowerBlue&

  ' spr imgGasolineMaid, 0, 0

  w = _width(imgGasolineMaid)
  h = _height(imgGasolineMaid)

  ' Origin: top left
  _MapTriangle (0, 0)-(w-1, 0)-(0, h-1), imgGasolineMaid to (0, 0)-(w-1, 0)-(0, h-1)
  _MapTriangle (w-1, 0)-(0, h-1)-(w-1, h-1), imgGasolineMaid to (w-1, 0)-(0, h-1)-(w-1, h-1)

  sprRotate imgGasolineMaid, 160, 100, angle

  color &hFFFFFFFF
  _printString (0, 0), "Rotation:" + str$(angle)

  _putimage, surface, scaled
  _display
loop until done

freeImage imgGasolineMaid
initTextMode

system


' implementation
'$include: 'INCLUDES\VGA.BM'
'$include: 'INCLUDES\BITMAP.BM'

sub sprRotate(imgHandle as long, cx as integer, cy as integer, rotation as double)
  if not isImageSet(imgHandle) then exit sub

  dim as double x1, y1, x2, y2, x3, y3, x4, y4
  dim as integer w, h, halfW, halfH
  dim as double sinTheta, cosTheta

  ' Origin: middle
  w = _width(imgHandle)
  h = _height(imgHandle)
  halfW = w \ 2
  halfH = h \ 2
  sinTheta = sin(rotation)
  cosTheta = cos(rotation)

  ' Rotate each corner
  x1 = cx + (-halfW * cosTheta + halfH * sinTheta)
  y1 = cy + (-halfW * sinTheta - halfH * cosTheta)

  x2 = cx + (halfW * cosTheta + halfH * sinTheta)
  y2 = cy + (halfW * sinTheta - halfH * cosTheta)

  x3 = cx + (-halfW * cosTheta - halfH * sinTheta)
  y3 = cy + (-halfW * sinTheta + halfH * cosTheta)

  x4 = cx + (halfW * cosTheta - halfH * sinTheta)
  y4 = cy + (halfW * sinTheta + halfH * cosTheta)

  ' Top left
  _MapTriangle (0, 0)-(w-1, 0)-(0, h-1), imgHandle to (x1, y1)-(x2, y2)-(x3, y3)
  ' Bottom right
  _MapTriangle (w-1, 0)-(0, h-1)-(w-1, h-1), imgHandle to (x2, y2)-(x3, y3)-(x4, y4)
end sub

