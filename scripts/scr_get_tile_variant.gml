///get tile variant at indices
var tileInfo = scr_get_tile_word(argument0, argument1);
var tileVariant = ((tileInfo >> global.tile_variant_shift) & global.tile_variant_bits);
return tileVariant;
