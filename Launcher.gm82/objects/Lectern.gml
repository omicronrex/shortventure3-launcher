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
r=8
zr=8

function=fun_read
subtitle="Judge Reviews"
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//for some reason the blockbench book model is backward ass and has backfaces???????
d3d_set_cull_mode(cull_clockwise)
d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(-22.5)
d3d_transform_add_translation(0,-3,0)
d3d_transform_add_rotation_z(image_angle)
d3d_transform_add_translation(x,y,5.5-(z*16))
d3d_model_draw(global.book,0,0,0,global.book_tex)
d3d_transform_set_identity()

if (on) {
    d3d_set_zbias(-2/1999)
    draw_set_blend_mode(bm_add)
    d3d_set_fog(1,merge_color(0,$ffffff,0.2+0.1*sin(TIME/200)),0,0)

    //blockbench fucking sucks, i had to get this lectern model out of sketchfab and
    //it's somehow shaped incorrectly, positioned incorrectly, and textured incorrectly.
    //good thing i don't need texture for the white highlight.
    d3d_transform_add_scaling(32,34,32)
    d3d_transform_add_rotation_x(90)
    d3d_transform_add_translation(8,-8,0)
    d3d_transform_add_rotation_z(image_angle)
    d3d_transform_add_translation(x,y,24-(z*16))
    d3d_model_draw(global.lectern,0,0,0,-1)
    d3d_transform_set_identity()

    d3d_transform_add_scaling(16,16,16)
    d3d_transform_add_rotation_x(-22.5)
    d3d_transform_add_translation(0,-3,0)
    d3d_transform_add_rotation_z(image_angle)
    d3d_transform_add_translation(x,y,5.5-(z*16))
    d3d_model_draw(global.book,0,0,0,-1)
    d3d_transform_set_identity()

    draw_set_blend_mode(0)
    d3d_set_fog(0,0,0,0)
    d3d_set_zbias(0)
}

on=0
d3d_set_culling(0)
