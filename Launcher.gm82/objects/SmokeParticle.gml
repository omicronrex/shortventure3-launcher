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

hspeed=random_range(-0.1,0.1)*DT
vspeed=random_range(-0.1,0.1)*DT
zspeed=random_range(-0.1,0.1)*DT

friction=0.001*DT

image_blend=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
zspeed-=0.005*DT
z+=zspeed

image=min(8,image+DT/16)
if (image>=8) instance_destroy()
