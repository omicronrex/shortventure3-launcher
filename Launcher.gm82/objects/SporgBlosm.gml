#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=1
z=0
zoff=0
image=0

hspeed=random_range(-1.5,1.5)
vspeed=random_range(-1.5,1.5)
zspeed=random_range(0.1,0.2)

friction=0.005
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
z+=zspeed

if (speed<0.1) instance_destroy()
