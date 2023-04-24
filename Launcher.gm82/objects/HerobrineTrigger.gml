#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.hero==0) {
    global.hero=1
    sound_play("cave1")
} else if (global.hero==1) {
    instance_create(Ctrl.x,Ctrl.y+96,Herobrine)
    global.hero=2
}
#define Collision_Ctrl
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=2
