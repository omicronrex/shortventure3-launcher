///add_game(...)
var i,j;

i=REMAPLIST[global.gamecount]
j=0
repeat (gd_length) {
    if (j=gd_image) {
        ds_grid_set(global.gamedata,i,j,background_add(get_game_data(i,gd_path)+"\thumb.png",0,0))
    } else if (j=gd_readme) {
        ds_grid_set(global.gamedata,i,j,file_text_read_all(get_game_data(i,gd_path)+"\thumb.txt","#"))
    } else {
        ds_grid_set(global.gamedata,i,j,argument[j])
    }
    j+=1
}

global.gamecount+=1
