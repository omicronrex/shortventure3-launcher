#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
z=0
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
game=global.gamecount

image=get_game_data(game,gd_image)
name=get_game_data(game,gd_name)
makers=get_game_data(game,gd_makers)

w=background_get_width(image)
h=background_get_height(image)

if (w>h) scale=30/w else scale=30/h

var d,maxd,find; maxd=100 find=noone
with (SignText) if (str="[game]") {d=distance_to_instance(other.id) if (d<maxd) {maxd=d find=id}}
find.str=name+"#by "+makers

with (instance_nearest(x,y,Readme)) game=other.game

angle=image_angle+270

i=instance_create(x+pivot_pos_x(24,8,image_angle)-8,y+pivot_pos_y(24,8,image_angle)-8,EnderChest)
i.z=z-1 i.game=game i.image_angle=image_angle

i=instance_create(x+pivot_pos_x(8,8,image_angle)-8,y+pivot_pos_y(8,8,image_angle)-8,Lectern)
i.z=z-1 i.game=game i.image_angle=image_angle

i=instance_create(x+pivot_pos_x(24,8,image_angle)-8,y+pivot_pos_y(24,8,image_angle)-8,NetherSpawner)
i.z=z-2

global.gamecount+=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_transform_add_rotation_x(-90)
d3d_transform_add_rotation_z(angle+90)
d3d_transform_add_translation(x-8,y-8,z*-16-8)
d3d_set_depth(-1)
draw_background_stretched(bgPainting3,0.5,0.5,32,32)
d3d_set_zbias(-1/1999)
draw_background_ext(image,16.5-0.5*w*scale,16.5-0.5*h*scale,scale,scale,0,$ffffff,1)
d3d_set_zbias(0)
d3d_set_depth(0)
d3d_transform_set_identity()
