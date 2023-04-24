var list,i;

load_models()

global.gamedata=ds_grid_create(game_count,gd_length)
global.gamecount=0

load_games()

global.gamecount=0

load_judges()

window_set_cursor(cr_none)
play_music()

if (debug_mode) {
    live_roomeditor_start()
    live_roomeditor_add_obj_exclusion(Ctrl)
    live_roomeditor_add_obj_exclusion(GameStation)
    //live_roomeditor_add_obj_exclusion(SignText)
    live_roomeditor_add_obj_exclusion(Hitbox)
    live_roomeditor_add_obj_exclusion(Ambience)
    live_roomeditor_add_obj_exclusion(Readme)
}
