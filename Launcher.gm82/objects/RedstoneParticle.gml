#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=4
z=0
image=0
zoff=0

hspeed=random_range(-0.1,0.1)
vspeed=random_range(-0.1,0.1)
zspeed=random_range(-0.1,0.1)

friction=0.001

image_blend=merge_color($ff,0,random(0.3))
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
zspeed=inch(zspeed,0,DT*0.001)
z+=zspeed

image=min(8,image+DT/10)
if (image>=8) instance_destroy()
