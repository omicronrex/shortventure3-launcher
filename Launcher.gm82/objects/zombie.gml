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
armtimer1=random(100)
armx1=0
armz1=0
armtimer2=random(100)
armx2=0
armz2=0
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
if (!Ctrl.paused) play_sound_3d(x,y,-(z*16),"zombie",random_range(0.85,1.1))
#define Step_0
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
if (!Ctrl.paused) {
    armtimer1+=1
    armtimer2+=1

    armx1=2*sin(armtimer1/35)-90
    armz1=2*cos(armtimer1/27)

    armx2=2*sin(armtimer2/35)-90
    armz2=2*cos(armtimer2/27)
}
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
d3d_model_draw(global.zombie,0,0,0,global.zombie_tex)
d3d_transform_set_identity()

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(-6,0,23)
d3d_transform_add_rotation_x(armx1)
d3d_transform_add_rotation_z(armz1)
d3d_transform_add_translation(6,0,-23)
d3d_transform_add_rotation_z(angle-90)
d3d_transform_add_translation(x,y,24-(z*16))

d3d_model_draw(global.zombie_la,0,0,0,global.zombie_tex)
d3d_transform_set_identity()

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(6,0,23)
d3d_transform_add_rotation_x(armx2)
d3d_transform_add_rotation_z(armz2)
d3d_transform_add_translation(-6,0,-23)
d3d_transform_add_rotation_z(angle-90)
d3d_transform_add_translation(x,y,24-(z*16))

d3d_model_draw(global.zombie_ra,0,0,0,global.zombie_tex)
d3d_transform_set_identity()
