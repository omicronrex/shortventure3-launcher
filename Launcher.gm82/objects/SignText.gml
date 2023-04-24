#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
z=0
angle=0
str=0
type=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fntSmall)
if (type) {
    d3d_transform_add_scaling(1/6,1/6,1)
    d3d_transform_add_rotation_x(-90)
    d3d_transform_add_rotation_z(mcang(angle)+90)
    d3d_transform_add_translation(x,y,z*-16+12.4)
    d3d_set_depth(6.5)
} else {
    d3d_transform_add_scaling(1/6,1/6,1)
    d3d_transform_add_rotation_x(-90)
    d3d_transform_add_rotation_z(mcang(angle)+90)
    d3d_transform_add_translation(x,y,z*-16+7)
    d3d_set_depth(-1.5)

}
draw_set2(1,0)
draw_set_color(0)
draw_text_ext(0,0,str,10,-1)
draw_reset()
d3d_set_depth(0)
d3d_transform_set_identity()
