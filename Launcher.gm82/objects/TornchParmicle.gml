#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=4.5
z=0
image=0
zoff=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=max(0,scale-DT/10)
if (scale==0) instance_destroy()
