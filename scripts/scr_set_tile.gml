///Update tile in grid manager at X,Y
///Arguments:
/// X index
/// Y index
/// Tile Type
/// Tile Variant


var xp = argument0
var yp = argument1
var tileType = argument2
var tileVariant = argument3
var bitField8Bit = 0;

//Push tile type
bitField8Bit = bitField8Bit | (tileType << global.tile_type_shift)
//Push tile variant
bitField8Bit = bitField8Bit | (tileVariant << global.tile_variant_shift)
scr_set_tile_word(xp,yp,bitField8Bit)
