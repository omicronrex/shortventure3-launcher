#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
z=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (point_distance_3d(x,y,-(z*16),Ctrl.x,Ctrl.y,Ctrl.z)<200) {
    i=instance_create(x+random_range(-80,80),y+random_range(-48,48),SporgBlosm)
    i.z=-(z*16)+random_range(-48,48)
}
alarm[0]=1+irandom(5)*DT
