///get tile type at indices
var tileInfo = scr_get_tile_word(argument0, argument1);
var tileType = ((tileInfo >> global.tile_type_shift) & global.tile_type_bits);
return tileType;

