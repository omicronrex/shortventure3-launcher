///get_game_data(game,gd_...)

if (argument1==gd_path) return drive+"games\"+ds_grid_get(global.gamedata,argument0,gd_path)

return ds_grid_get(global.gamedata,argument0,argument1)
