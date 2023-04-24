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

dir=0
dirz=0
dir_go=1
dirz_go=1

t=background_get_texture(bgCmd)

alarm[2]=30
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
alarm[1]=irandom_range(50,200)
dir_go=random(360)
dirz_go=random_range(-30,30)
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[2]=irandom_range(5,40)
dir_go+=random_range(-10,10)
dirz_go+=random_range(-5,5)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!Ctrl.paused) {
    armtimer1+=1
    armtimer2+=1

    armx1=2*sin(armtimer1/35)-30
    armz1=2*cos(armtimer1/27)

    armx2=2*sin(armtimer2/35)
    armz2=2*cos(armtimer2/27)

    if (Ctrl.go) {
        dir_go=point_direction(x,y,Ctrl.x,Ctrl.y)
        dirz_go=angle_difference(point_direction_pitch(x,y,-(z*16),Ctrl.x,Ctrl.y,Ctrl.z),0)
        if (Ctrl.x>x+64) {z+=2/16 ss=0}
        if (Ctrl.x>x+300) instance_destroy()
    }

    dir+=angle_difference(dir,dir_go)/8
    dirz+=angle_difference(dirz,dirz_go)/8

    if (abs(angle_difference(dir,angle_go))>30) angle_go=dir
    if (abs(angle_difference(angle,angle_go))>80) angle=inch_angle(angle,angle_go,30)

    angle=inch_angle(angle,angle_go,4)
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
d3d_model_draw(global.renex,0,0,0,global.renex_tex)
d3d_transform_set_identity()

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(-6,0,23)
d3d_transform_add_rotation_x(armx1)
d3d_transform_add_rotation_z(armz1)
d3d_transform_add_translation(6,0,-23)
d3d_transform_add_rotation_z(angle-90)
d3d_transform_add_translation(x,y,24-(z*16))

d3d_model_draw(global.renex_la,0,0,0,global.renex_tex)
d3d_transform_set_identity()

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(6,0,23)
d3d_transform_add_rotation_x(armx2)
d3d_transform_add_rotation_z(armz2)
d3d_transform_add_translation(-6,0,-23)
d3d_transform_add_rotation_z(angle-90)
d3d_transform_add_translation(x,y,24-(z*16))

d3d_model_draw(global.renex_ra,0,0,0,global.renex_tex)
d3d_transform_set_identity()

d3d_transform_add_rotation_z(50)
d3d_transform_add_rotation_x(35)
d3d_transform_add_translation(6,-4,12)
d3d_transform_add_rotation_x(armx1)
d3d_transform_add_rotation_z(armz1)
d3d_transform_add_translation(0,0,-23)
d3d_transform_add_rotation_z(angle-90)
d3d_transform_add_translation(x,y,24-(z*16))
d3d_draw_block(-2.5,-2.5,-2.5,2.5,2.5,2.5,t,1,1)
d3d_transform_set_identity()

d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(0,0,25)
d3d_transform_add_rotation_x(dirz)
d3d_transform_add_rotation_z(dir)
d3d_transform_add_translation(0,0,-25)
d3d_transform_add_rotation_z(-90)
d3d_transform_add_translation(x,y,24-(z*16))

d3d_model_draw(global.renex_h,0,0,0,global.renex_tex)
d3d_transform_set_identity()
