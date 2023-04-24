#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
z=0
wall=1

intensity=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (point_distance_3d(x,y,-(z*16),Ctrl.x,Ctrl.y,Ctrl.z)<300) {
    i=instance_create(x+random_range(-1,1),y+random_range(-1,1),RedstoneParticle)
    i.z=-(z*16)-3-wall*2+random_range(-1,1)
}
alarm[0]=max(1,irandom_range(20,50)*DT)
