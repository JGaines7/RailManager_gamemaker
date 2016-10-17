/// Generate a path from start position(real) and stop position(index)
/// Returns a path object

var start_x_real = argument0
var start_y_real = argument1
stop_x_i = argument2
stop_y_i = argument3

//translate starting real to starting tile.
//tile that the head of the train is occupying (used for pathing tile checking)
start_x_i = scr_real_x_to_index(start_x_real);
start_y_i = scr_real_y_to_index(start_y_real);

//do a* pathfinding from this tile to destination tile
//create path object with these points
//return path


//Datastructs
G=ds_map_create();
H=ds_map_create();
F=ds_priority_create();
P=ds_map_create();
C=ds_list_create();

//init the G value
ds_map_add(G, scr_xy_to_key(start_x_i, start_y_i), 0)

searching=true;
curX = start_x_i;
curY = start_y_i;

while(searching)
{
    scr_process_current_node();
}

//create path backwards
var path = -1
if(found)
{
    path=path_add();
    var curNode=scr_xy_to_key(stop_x_i,stop_y_i);
    while (curNode != scr_xy_to_key(start_x_i,start_y_i))
    {
        path_add_point(path, scr_key_to_x(curNode) * global.tile_size + global.xorigin + (global.tile_size >> 1), 
                             scr_key_to_y(curNode) * global.tile_size + global.yorigin + (global.tile_size >> 1),100);
        curNode=ds_map_find_value(P,curNode);
        
    }
    path_add_point(path, start_x_i * global.tile_size + global.xorigin + (global.tile_size >> 1), 
                         start_y_i * global.tile_size + global.yorigin + (global.tile_size >> 1),100);
                         
    path_reverse(path);
    path_set_closed(path, false);
    path_set_kind(path, 0);
}

//cleanup
ds_map_destroy(G);
ds_map_destroy(H);
ds_priority_destroy(F);
ds_map_destroy(P);
ds_list_destroy(C);

return path;

