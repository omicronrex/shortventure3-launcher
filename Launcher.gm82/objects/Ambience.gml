#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=200
z=0
sound="water"
mintime=150
maxtime=450
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=max(1,irandom_range(mintime,maxtime)*DT)

if (!Ctrl.paused) play_sound_3d(x+random_range(-16,16),y+random_range(-16,16),-(z*16)+random_range(-16,16),sound,random_range(0.85,1.15))
