#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
z=0
alarm[0]=150
alarm[1]=100

angle_go=random(360)
angle=angle_go

ss=0.25
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=max(1,random_range(150,400)*DT)
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!irandom(4)) {
    alarm[1]=150
    if (!irandom(3)) angle_go=random(360)
} else {
    alarm[1]=10
    angle_go=point_direction(x,y,Ctrl.x,Ctrl.y)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!Ctrl.paused) angle=inch_angle(angle,angle_go,4)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_zbias(-1/1999)
d3d_set_zwriteenable(0)
d3d_set_depth(24-(z*16))
d3d_set_culling(1)
draw_sprite_ext(sprShadow,0,x,y,ss,ss,0,$ffffff,0.4)
d3d_set_culling(0)
d3d_set_depth(0)
d3d_set_zbias(0)
d3d_set_zwriteenable(1)
