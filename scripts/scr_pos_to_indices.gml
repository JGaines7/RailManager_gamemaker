//Translate real room coordinate to tile index

var xpos = argument0;
var ypos = argument1;
var x_adjusted = xpos - global.xorigin;
var y_adjusted = ypos - global.yorigin;

ret[0] = x_adjusted div global.tile_size;
ret[1] = y_adjusted div global.tile_size;

return ret;
