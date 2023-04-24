///draw_reviews_global(x,y)
var dx,dy;

dx=argument0
dy=argument1+16

draw_rating(dx,dy,"Overall: ",get_game_data(game,gd_rate_overall))
draw_rating(dx,dy+16,"Gameplay: ",get_game_data(game,gd_rate_gameplay))
draw_rating(dx,dy+32,"Innovation: ",get_game_data(game,gd_rate_innovation))
draw_rating(dx,dy+48,"Audio-Visual: ",get_game_data(game,gd_rate_av))
draw_rating(dx,dy+64,"Theme: ",get_game_data(game,gd_rate_theme))

dy=dy+80
t=get_game_data(game,gd_trophy_overall   ) if (t) {draw_trophy(dx,dy,t,"Overall"     ) dy+=32}
t=get_game_data(game,gd_trophy_gameplay  ) if (t) {draw_trophy(dx,dy,t,"Gameplay"    ) dy+=32}
t=get_game_data(game,gd_trophy_innovation) if (t) {draw_trophy(dx,dy,t,"Innovation"  ) dy+=32}
t=get_game_data(game,gd_trophy_av        ) if (t) {draw_trophy(dx,dy,t,"Audio-Visual") dy+=32}
t=get_game_data(game,gd_trophy_theme     ) if (t) {draw_trophy(dx,dy,t,"Theme"       ) dy+=32}
