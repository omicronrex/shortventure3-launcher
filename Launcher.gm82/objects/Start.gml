#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_xscale=2
image_yscale=2
down=0
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=2
sound_play("click")
room_goto_next()
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=1
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(0)
draw_self()
draw_set_font(fntBig)
draw_set2(1,1)
draw_set_color($ffff)
s=1.7-0.1*abs(dsin((TIME/2.8) mod 360))
d3d_transform_add_scaling(s,s,1)
d3d_transform_add_rotation_z(20)
d3d_transform_add_translation(620,100,0)
draw_text_craft(0,2,"Resources!")
draw_set_color($ffffff)
d3d_transform_set_identity()
draw_text_craft(x,y-2,"Start")
draw_set2(0,2)
draw_text_craft(4,room_height+1,"Launcher 0.2.1/GM8 (Modded)")
draw_set2(2,2)
draw_text_craft(room_width-4,room_height+1,"Copyright renex. Please distribute!")
draw_reset()
