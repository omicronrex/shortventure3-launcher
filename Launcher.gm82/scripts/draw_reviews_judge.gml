///draw_reviews_judge(x,y)
var dx,dy;

dx=argument0
dy=argument1+16

draw_rating(dx,dy,"Overall: ",global.scoresO[game,judge])
draw_rating(dx,dy+16,"Gameplay: ",global.scoresG[game,judge])
draw_rating(dx,dy+32,"Innovation: ",global.scoresI[game,judge])
draw_rating(dx,dy+48,"Audio-Visual: ",global.scoresA[game,judge])
draw_rating(dx,dy+64,"Theme: ",global.scoresT[game,judge])
