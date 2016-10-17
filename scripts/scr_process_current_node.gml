/// Run A* algorithm on current node

//Should only be called from scr_generatePath

//add to closed list
ds_list_add(C, scr_xy_to_key(curX, curY));
//analyze adjacent blocs 
//no diagonals.
var distFromStartToCurrent=ds_map_find_value(G,scr_xy_to_key(curX,curY));


for(var i = max(0, curX-1); i <= min(global.world_width - 1, curX+1); i++)
{
    for(var j = max(0, curY-1); j<= min(global.world_height - 1, curY+1); j++)
    {
        
        //always 1 if no diagonals
        var distFromCurrentToIJ=1;
        
        //if diagonal, ignore
        if(  abs(curX - i) == 1  && abs(curY - j) == 1)
        {
            continue;
        }
        
        //is this node in the closed list? (what does that mean)
        var closed = ds_list_find_index(C,scr_xy_to_key(i,j)) != -1;
        //only look at rail tiles.
        var validTile = scr_get_tile_type(i,j) == global.SPR_KEY_RAIL;
        
        if (!closed && validTile)
        {
            var tempG = distFromStartToCurrent + distFromCurrentToIJ;
            var tempH = 1//abs(i - stop_x_i) + abs(j-stop_y_i);//heuristic. for now diff between current tile and end point
            var tempF= tempG + tempH;
            //check if we've done this tile before
            var processed = ds_map_exists(G, scr_xy_to_key(i,j));
            if (processed)
            {
                //Update lists if G value is better
                if(ds_map_find_value(G,scr_xy_to_key(i,j)) > tempG)
                {
                    ds_map_replace(G, scr_xy_to_key(i,j),tempG)
                    ds_map_replace(H, scr_xy_to_key(i,j),tempH)
                    ds_priority_change_priority(F, scr_xy_to_key(i,j),tempF)
                    ds_map_replace(P, scr_xy_to_key(i,j), scr_xy_to_key(curX,curY))
                }
            }
            else
            {
                //add values to maps if first test
                ds_map_add(G, scr_xy_to_key(i,j),tempG)
                ds_map_add(H, scr_xy_to_key(i,j),tempH)
                ds_priority_add(F, scr_xy_to_key(i,j),tempF)
                ds_map_add(P, scr_xy_to_key(i,j), scr_xy_to_key(curX,curY))
            }
        }
        
        
    }
}

//find best option
var minF = -1
if(!ds_priority_empty(F))
{
    minF=ds_priority_delete_min(F);
}
if(minF == -1)
{
    searching = false;
    found = false;
}
else
{
    curX = scr_key_to_x(minF)
    curY = scr_key_to_y(minF)
}

if(curX == stop_x_i && curY == stop_y_i)
{
    searching = false;
    found = true;
}
