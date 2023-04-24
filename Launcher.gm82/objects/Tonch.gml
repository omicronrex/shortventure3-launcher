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
    i=instance_create(x,y,TornchParmicle)
    i.z=-(z*16)-3-2*wall
    if (!irandom(3)) {
        i=instance_create(x,y,SmokeParticle)
        i.z=-(z*16)-3-2*wall
    }
}
alarm[0]=1+irandom(20)*DT
