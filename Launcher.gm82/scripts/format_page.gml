///format_page(str):str_but_better
var str;

str=argument0

str=string_replace_all(str,"%MAKER%","Created by: "+get_game_data(game,gd_makers))

return str
