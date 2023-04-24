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
special=0
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
if (!Ctrl.paused) play_sound_3d(x,y,-(z*16),choose("chicken1","chicken2","chicken3"),random_range(0.85,1.1))
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (special && !global.v) {
    if (distance_to_object(Ctrl)<48 && !Ctrl.go) special+=1
    if (special==600) {
        play_sound_3d(x,y,z,"plop",1)
        i=instance_create(x,y,Egg)
        i.z=z/-16+8
        i.zstart=i.z
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ss=0.2
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
d3d_transform_add_translation(x,y,23-(z*16))
d3d_model_draw(global.chicken,0,0,0,global.chicken_tex)
d3d_transform_set_identity()
