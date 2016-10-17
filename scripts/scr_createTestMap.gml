///generate a hardcoded test map 

show_debug_message("working_directory:" + string(working_directory));

var file = file_text_open_read(working_directory + "\trainsTestMap.txt");

if (file == -1)
{
    show_debug_message("FILE DONT EXIST")
}

if (file != -1)
{
    var line;
    var xx,yy = 0;
    var currentChar = "0"
    while(!file_text_eof(file))
    {
        
        line = file_text_readln(file);
        show_debug_message("LINE: " + line)
        for(xx = 1; xx <= string_length(line); xx++)
        {
            currentChar = string_char_at(line, xx);
            if(currentChar == "1")
            {
                scr_set_tile(xx-1,yy, $02, $00)
            }
        }
        yy++;
        
    }

}
else
{
    show_debug_message("Error: Could not open file!")
}
