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

fr=irandom(59)

function=fun_readme
subtitle="Game Information"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fr=(fr+0.5) mod 60
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_transform_add_rotation_x(-90)
d3d_transform_add_rotation_z(image_angle)
d3d_transform_add_translation(x,y,16-(z*16))
d3d_set_depth(7)
d3d_set_lighting(0)
draw_sprite_ext(sprBook,fr,-3.5,-3.5,0.5,0.5,0,$ffffff,1)
if (on) {
    d3d_set_zbias(-2/1999)
    draw_set_blend_mode(bm_add)
    d3d_set_fog(1,merge_color(0,$ffffff,0.2+0.1*sin(TIME/200)),0,0)
    draw_sprite_ext(sprBook,fr,-3.5,-3.5,0.5,0.5,0,$ffffff,1)
    draw_set_blend_mode(0)
    d3d_set_fog(0,0,0,0)
    d3d_set_zbias(0)
}
d3d_set_lighting(1)
d3d_set_depth(0)
d3d_transform_set_identity()

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(0,-8,7)
d3d_transform_add_rotation_z(image_angle)
d3d_transform_add_translation(x,y,16-(z*16))
d3d_model_draw(global.itemframe,0,0,0,global.itemframe_tex)

if (on) {
    d3d_set_zbias(-2/1999)
    draw_set_blend_mode(bm_add)
    d3d_set_fog(1,merge_color(0,$ffffff,0.2+0.1*sin(TIME/200)),0,0)
    d3d_model_draw(global.itemframe,0,0,0,-1)
    draw_set_blend_mode(0)
    d3d_set_fog(0,0,0,0)
    d3d_set_zbias(0)
}
d3d_transform_set_identity()

on=0
