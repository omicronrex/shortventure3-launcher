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
ss=0
dead_tex=background_get_texture(bgDead)
dead_angle=0
dead=0

if (global.creeper_dead) instance_destroy()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=425
*/
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[1]=10
angle_go=point_direction(x,y,Ctrl.x,Ctrl.y)
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.creeper_dead=1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
z=median(-67,lerp(z,Ctrl.z/-16+0.5*sin(TIME/300)-1,1/8),-32)
if (z==-67 && !dead) {
    dead=1
    alarm[2]=200
    play_sound_3d(x,y,-z*16,"fallbigclassic",1)
    play_sound_3d(x,y,-z*16,"creeper",1)
}

if (dead) dead_angle=lerp(dead_angle,90,1/10)
#define Draw_0
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
d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_rotation_y(-dead_angle)
d3d_transform_add_rotation_z(angle-90)
d3d_transform_add_translation(x,y,24-(z*16))
d3d_model_draw(global.creeper,0,0,0,global.creeper_tex)
if (dead) d3d_model_draw(global.creeper,0,0,0,dead_tex)
d3d_transform_set_identity()
