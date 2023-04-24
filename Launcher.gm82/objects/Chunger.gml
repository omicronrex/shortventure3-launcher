#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
z=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_transform_add_rotation_x(-90)
d3d_transform_add_rotation_z(270)
d3d_transform_add_translation(x-8,y-8,z*-16-8)
d3d_set_depth(-1)
draw_background_stretched(bgChunger,0.5,0.5,32,32)
d3d_set_depth(0)
d3d_transform_set_identity()
