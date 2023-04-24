#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.v=1

zspeed=-1
speed=0.7
direction=315

angle=0

alarm[0]=room_speed*60*5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
zspeed+=0.1
z+=zspeed
if (z>zstart+16) {
    z=zstart+16
    zspeed=0
    speed*=0.6
}

angle+=0.8
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_zbias(-1/1999)
d3d_set_zwriteenable(0)
d3d_set_depth(zstart+16)
d3d_set_culling(1)
draw_sprite_ext(sprShadow,0,x,y,0.075,0.075,0,$ffffff,0.4)
d3d_set_culling(0)
d3d_set_depth(0)
d3d_set_zbias(0)
d3d_set_zwriteenable(1)


d3d_transform_add_rotation_x(-90)
d3d_transform_add_rotation_z(angle)
d3d_transform_add_translation(x,y,z-5+dsin(angle*2))
draw_sprite_ext(sprite_index,0,0,0,0.2,0.2,0,$ffffff,1)
d3d_transform_set_identity()
