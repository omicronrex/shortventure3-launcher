var w;

draw_text(argument0,argument1,argument2)
w=70//string_width(argument2)+4
draw_sprite(sprHearts,0,argument0+w,argument1+1)
draw_sprite_part(sprHearts,1,0,0,argument3*9,9,argument0+w,argument1+1)
draw_text(argument0+w+100,argument1,string_format(argument3,0,1)+"/10")
