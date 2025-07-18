option _explicit

'$include: 'INCLUDES\VGA.BI'

const cornflowerBlue = &hFF6495ED
const False = 0
const True = not False

dim as long imgGasolineMaid
dim as integer done
dim as integer w, h
dim as double x1, y1, x2, y2, x3, y3, x4, y4

dim as integer halfW, halfH
dim as double rotation, sinTheta, cosTheta

initBuffer
loadImage imgGasolineMaid, "gasoline_maid.png"

do
  _limit 60
  rotation=rotation+0.03

  cls , cornflowerBlue&

  ' spr imgGasolineMaid, 0, 0

  w = _width(imgGasolineMaid)
  h = _height(imgGasolineMaid)

  ' Origin: top left
  _MapTriangle (0, 0)-(w-1, 0)-(0, h-1), imgGasolineMaid to (0, 0)-(w-1, 0)-(0, h-1)
  _MapTriangle (w-1, 0)-(0, h-1)-(w-1, h-1), imgGasolineMaid to (w-1, 0)-(0, h-1)-(w-1, h-1)

  ' Origin: middle
  halfW = w \ 2
  halfH = h \ 2
  sinTheta = sin(rotation)
  cosTheta = cos(rotation)

  ' Rotate each corner
  x1 = 160 + (-halfW * cosTheta + halfH * sinTheta)
  y1 = 100 + (-halfW * sinTheta - halfH * cosTheta)

  x2 = 160 + (halfW * cosTheta + halfH * sinTheta)
  y2 = 100 + (halfW * sinTheta - halfH * cosTheta)

  x3 = 160 + (-halfW * cosTheta - halfH * sinTheta)
  y3 = 100 + (-halfW * sinTheta + halfH * cosTheta)

  x4 = 160 + (halfW * cosTheta - halfH * sinTheta)
  y4 = 100 + (halfW * sinTheta + halfH * cosTheta)

  _MapTriangle (0, 0)-(w-1, 0)-(0, h-1), imgGasolineMaid to (x1, y1)-(x2, y2)-(x3, y3)
  _MapTriangle (w-1, 0)-(0, h-1)-(w-1, h-1), imgGasolineMaid to (x2, y2)-(x3, y3)-(x4, y4)

  _putimage, surface, scaled
  _display
loop until done

freeImage imgGasolineMaid
initTextMode

system


' implementation
'$include: 'INCLUDES\VGA.BM'
'$include: 'INCLUDES\BITMAP.BM'

sub sprRotate(imgHandle as long, destX as integer, destY as integer, rotation as double)
  if isImageSet(imgHandle) then exit sub


end sub

