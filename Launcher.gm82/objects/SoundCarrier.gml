#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dist=point_distance_3d(x,y,z,Ctrl.x,Ctrl.y,Ctrl.z)

vol=max(0,1-dist/200)

pan=-dsin(angle_difference(Ctrl.dir,point_direction(Ctrl.x,Ctrl.y,x,y)))

sound_volume(snd,vol)
sound_pan(snd,pan)

if (!sound_isplaying(snd)) instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dist=point_distance_3d(x,y,z,Ctrl.x,Ctrl.y,Ctrl.z)
if (dist<200) {
    vol=1-dist/200

    pan=-dsin(angle_difference(Ctrl.dir,point_direction(Ctrl.x,Ctrl.y,x,y)))

    snd=sound_play_ex(sound,vol,pitch,pan)
} else instance_destroy()
