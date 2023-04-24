#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=1
z=0
image=irandom(7)

zoff=-random_range(8,32)
d=random(360)
r=random_range(16,32)
x+=lengthdir_x(r,d)
y+=lengthdir_y(r,d)
direction=d+180

image_blend=merge_color($f048d8,$661f5c,random(1))
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
zoff=lerp(zoff,0,DT/100)
speed+=DT/200

if (point_distance(x,y,xstart,ystart)<4) instance_destroy()
