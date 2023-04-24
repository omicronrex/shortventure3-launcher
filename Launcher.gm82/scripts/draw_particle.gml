d3d_set_point_options(screen_size_at_distance(x,y,z+zoff,scale),0,0,0,1)

d=point_direction(x,y,Ctrl.x,Ctrl.y)
dv=point_direction_pitch(x,y,z+zoff,Ctrl.x,Ctrl.y,Ctrl.z)

d3d_primitive_begin_texture(pr_pointlist,sprite_get_texture(sprite_index,floor(image)))
d3d_vertex_color(x+lengthdir_zx(-1,d,dv),y+lengthdir_zy(-1,d,dv),z+zoff+lengthdir_zz(-1,d,dv),image_blend,1)
d3d_primitive_end()
