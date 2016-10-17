//Translate real room x coordinate to tile index
var ypos = argument0;
var y_adjusted = ypos - global.yorigin;
return y_adjusted div global.tile_size;

