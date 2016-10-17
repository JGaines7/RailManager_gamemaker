///get tile word at indices and return array of (type, variant, ???)

var xindex = argument0;
var yindex = argument1;

var tileInfo = scr_get_tile_word(xindex, yindex);
var tileType = ((tileInfo >> global.tile_type_shift) & global.tile_type_bits);
var tileVariant = ((tileInfo >> global.tile_variant_shift) & global.tile_variant_bits);

 returnArray[0] = tileType;
 returnArray[1] = tileVariant;

return returnArray;
