#define Alarm_0
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
if (!Ctrl.paused) play_sound_3d(x,y,-(z*16),choose("cow","cow2"),random_range(0.85,1.1))
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
d3d_transform_add_rotation_z(angle-90)
d3d_transform_add_translation(x,y,24-(z*16))
d3d_model_draw(global.cow,0,0,0,global.cow_tex)
d3d_transform_set_identity()
