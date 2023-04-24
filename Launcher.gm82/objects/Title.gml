#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
startup_1()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
TIME+=16

close_button()
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
finalize()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_projection_ext(0,0,0,0,-1,0,0,0,-1,53,16/9,1,10)

d3d_transform_set_rotation_z(-(TIME/256) mod 360)
texture_set_interpolation(1)
d3d_draw_cylinder(-2,-2,-1,2,2,1,background_get_texture(bgPanorama),1,1,0,4)
d3d_transform_set_identity()

d3d_set_projection_default()
