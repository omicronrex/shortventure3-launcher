///draw_trophy(x,y,trophy,label)

draw_sprite_ext(sprTrophies,argument2-1,argument0,argument1,2,2,0,$ffffff,1)

draw_set_font(fntBig)
draw_text(argument0+40,argument1,argument3)
draw_set_font(fntSmall)
draw_text(argument0+40,argument1+19,pick(argument2-1,"First Place","Second Place","Third Place"))
