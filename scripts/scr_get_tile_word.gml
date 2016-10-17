///Retrieve 16 byte word from world buffer
///Arguments: X,Y
///Returns buffer_u16
return buffer_peek(global.world_buffer, scr_tile_position_to_buffer_offset(argument0,argument1), buffer_u16)
