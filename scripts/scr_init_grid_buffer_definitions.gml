
//World as commented is stored as 16 bit tiles in a contiguous buffer.
// |0000|0000|0000|0000|
// |xxxx|                   //Tile Type
// |    |xxxx|              //Tile Variant
// |    |    |xxxx|xxxx|    //To be determined

global.world_buffer_data_size = 2 //bytes per tile

//Define the bit shift and number of bits for each field in buffer word
    global.tile_type_shift = 4//12
    global.tile_type_bits = $F
    
    global.tile_variant_shift = 0//8
    global.tile_variant_bits = $F
    
//End Define bit shifts

//Define keys used in key->sprite lookup for rendering.
    //keys
    global.SPR_KEY_GRASS =  0;
    global.SPR_KEY_WATER =  1;
    global.SPR_KEY_RAIL =   2;
    
    global.tileSpriteMap = ds_map_create();
    
    //sprite values
    global.tileSpriteMap[? global.SPR_KEY_GRASS] = spr_grass
    global.tileSpriteMap[? global.SPR_KEY_WATER] = spr_water
    global.tileSpriteMap[? global.SPR_KEY_RAIL] = spr_rail
//End Define key->sprite lookup
    

