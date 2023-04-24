///launch_game(game id)
//blocking call
var dir,exe;

var game;game=argument0

sound_kind_pause(all)
window_set_visible(0)

set_working_directory(get_game_data(game,gd_path))

execute_program(get_game_data(game,gd_exe),"",1)

keyboard_set_numlock(1)

set_working_directory(global.mylocation)

window_set_visible(1)
screen_refresh()
sound_kind_resume(all)
