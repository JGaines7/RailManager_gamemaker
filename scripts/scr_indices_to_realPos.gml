///convert grid indices to a center of tile in real x/y
xindex = argument0;
yindex = argument1;

var xpos = xindex * global.tile_size + (global.tile_size >> 1) + global.xorigin; //bitwise div by 2
var ypos = yindex * global.tile_size + (global.tile_size >> 1) + global.yorigin; //bitwise div by 2

ret[0] = xpos
ret[1] = ypos

return ret

