#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
r=7
zr=7

function=fun_launch
lid_angle=0
lid=0
open=0
subtitle="Play Game"
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
open=0
play_sound_3d(x,y,16-(z*16),"ender_close",random_range(0.9,1.05))
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (open) lid=min(90,lid+4) else lid=max(0,lid-4)

lid_angle=-85*dsin(lid)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_rotation_z(image_angle+180)
d3d_transform_add_translation(x,y,23-(z*16))
d3d_model_draw(global.ender,0,0,0,global.ender_tex)
if (on) {
    d3d_set_zbias(-2/1999)
    draw_set_blend_mode(bm_add)
    d3d_set_fog(1,merge_color(0,$ffffff,0.2+0.1*sin(TIME/200)),0,0)
    d3d_model_draw(global.ender,0,0,0,-1)
    draw_set_blend_mode(0)
    d3d_set_fog(0,0,0,0)
    d3d_set_zbias(0)
}
d3d_transform_set_identity()

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(0,-7,9)
d3d_transform_add_rotation_x(lid_angle)
d3d_transform_add_translation(0,7,-9)
d3d_transform_add_rotation_z(image_angle+180)

d3d_transform_add_translation(x,y,23-(z*16))
d3d_model_draw(global.ender_lid,0,0,0,global.ender_tex)
if (on) {
    d3d_set_zbias(-2.1/1999)
    draw_set_blend_mode(bm_add)
    d3d_set_fog(1,merge_color(0,$ffffff,0.2+0.1*sin(TIME/200)),0,0)
    d3d_model_draw(global.ender_lid,0,0,0,-1)
    draw_set_blend_mode(0)
    d3d_set_fog(0,0,0,0)
    d3d_set_zbias(0)
}

d3d_transform_set_identity()

on=0
