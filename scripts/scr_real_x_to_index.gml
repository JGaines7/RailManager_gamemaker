//Translate real room x coordinate to tile index
var xpos = argument0;
var x_adjusted = xpos - global.xorigin;
return x_adjusted div global.tile_size;

