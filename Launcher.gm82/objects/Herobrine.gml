#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("slenderman")
dist=500
sound_kind_pause(1)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop("slenderman")
sound_kind_resume(1)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (LightSounce) intensity=lerp(intensity,0,1/10)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dist=lerp(dist,50,1/80)
if (dist<65) instance_destroy()

x=Ctrl.x
y=Ctrl.y+dist

angle=90
dir=90
z=Ctrl.z/-16

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_rotation_z(angle-90)
d3d_transform_add_translation(x,y,24-(z*16))
d3d_model_draw(global.renex,0,0,0,global.hero_tex)
d3d_transform_set_identity()

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(-6,0,23)
//d3d_transform_add_rotation_x(armx1)
//d3d_transform_add_rotation_z(armz1)
d3d_transform_add_translation(6,0,-23)
d3d_transform_add_rotation_z(angle-90)
d3d_transform_add_translation(x,y,24-(z*16))

d3d_model_draw(global.renex_la,0,0,0,global.hero_tex)
d3d_transform_set_identity()

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(6,0,23)
//d3d_transform_add_rotation_x(armx2)
//d3d_transform_add_rotation_z(armz2)
d3d_transform_add_translation(-6,0,-23)
d3d_transform_add_rotation_z(angle-90)
d3d_transform_add_translation(x,y,24-(z*16))

d3d_model_draw(global.renex_ra,0,0,0,global.hero_tex)
d3d_transform_set_identity()

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(0,0,25)
//d3d_transform_add_rotation_x(dirz)
d3d_transform_add_rotation_z(dir)
d3d_transform_add_translation(0,0,-25)
d3d_transform_add_rotation_z(-90)
d3d_transform_add_translation(x,y,24-(z*16))

d3d_model_draw(global.renex_h,0,0,0,global.hero_tex)
d3d_transform_set_identity()
