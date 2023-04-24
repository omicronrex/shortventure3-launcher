render_textures()

xto=lengthdir_zx(1,dir,dirz)
yto=lengthdir_zy(1,dir,dirz)
zto=lengthdir_zz(1,dir,dirz)

mc_y=64-(z/16)

layer=0
if (mc_y<=40) layer=2
//else if (mc_y>-10) layer=1

layer2=-1
if (mc_y>30 && mc_y<=40) layer2=0
//if (mc_y>-10 && mc_y<=30) layer2=2
//if (mc_y>-20 && mc_y<=-10) layer2=1

d3d_start()
draw_set_color($ffffff)

d3d_set_projection_ext(0,0,0,xto,yto,zto,0,0,-1,fov,-16/9,0.5,32768)

if (instance_exists(Herobrine)) light_fac=lerp(light_fac,0.2,1/30)
else if (mc_y<60) light_fac=lerp(light_fac,0.2,0.02)
else light_fac=1

if (layer>0) {
    draw_clear(0)
    fog_color=0
    if (mc_y<=-10) fog_fac=lerp(fog_fac,0.5,0.02)
} else {
    //draw sky
    d3d_set_hidden(0)
    texture_set_interpolation(1)
    d3d_draw_ellipsoid(-2,-2,-2,2,2,2,background_get_texture(bgSky),1,-1,8)
    texture_set_interpolation(0)
    draw_set_blend_mode(bm_add)
    d3d_transform_add_rotation_x(225)
    d3d_set_depth(1)
    draw_sprite_ext_fixed(sprSun,0,0,0,0.02,0.02,0,$ffffff,1)
    draw_set_blend_mode(0)
    d3d_set_depth(0)
    d3d_transform_set_identity()

    //clouds
    d3d_set_fog(1,$ffd2b9,6144,8192)
    texture_set_repeat(1)
    k=65536
    d3d_primitive_begin_texture(pr_trianglestrip,background_get_texture(bgCloud))
    u=(TIME/5120000) mod 1
    d3d_vertex_texture(-k,-k,-3072,u,0)
    d3d_vertex_texture(k,-k,-3072,u+1,0)
    d3d_vertex_texture(-k,k,-3072,u,1)
    d3d_vertex_texture(k,k,-3072,u+1,1)
    d3d_primitive_end()
    d3d_set_hidden(1)

    if (instance_exists(Herobrine)) {
        fog_color=0
        fog_fac=lerp(fog_fac,0.1,1/20)
    } else {
        fog_color=$ffd2b9
        fog_fac=1
    }
}

d3d_set_projection_ext(x,y,z,x+xto,y+yto,z+zto,0,0,-1,fov,-16/9,1,2000)
prepare_look(x,y,z,x+xto,y+yto,z+zto,0,0,-1,fov,-16/9)
if (!paused && !go && launching==0 && !instance_exists(LecternUi) && !instance_exists(BookUi)) {
    with (Hitbox) event_user(0)
}

//sky light
d3d_set_lighting(1)
d3d_light_define_ambient($303030)
d3d_light_define_direction(0,1,2,3,merge_color(0,$ffffff,light_fac))
d3d_light_enable(0,1)
d3d_light_define_direction(1,-1,-2,3,merge_color(0,$c0c0c0,light_fac))
d3d_light_enable(1,1)

//set up torch light for 6 nearest torches
p=ds_priority_create()
with (LightSounce) ds_priority_add(other.p,id,point_distance_3d(x,y,-(z*16),other.x,other.y,other.z))
i=2 repeat (min(ds_priority_size(p),8)) {
    t=ds_priority_delete_min(p)
    t.intensity=min(1,t.intensity+DT/25)
    if (t.object_index==TorchRed) d3d_light_define_point(i,t.x,t.y,-(t.z*16),70,merge_color(0,$4040c0,t.intensity))
    else d3d_light_define_point(i,t.x,t.y,-(t.z*16),100,merge_color(0,$80ffff,t.intensity))
    d3d_light_enable(i,1)
i+=1}
ds_priority_destroy(p)

d3d_set_fog(1,fog_color,500*fog_fac,750*fog_fac)
d3d_set_culling(1)
texture_set_repeat(1)

//terrain
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(45,-391,65)
d3d_transform_add_scaling(-16,16,16)
    draw_terrain(MODELS[layer],NOLIGHT[layer])
    if (layer2>=0) draw_terrain(MODELS[layer2],NOLIGHT[layer2])
    draw_terrain(MODELS_LATE[layer],NOLIGHT[layer])
    if (layer2>=0) draw_terrain(MODELS_LATE[layer2],NOLIGHT[layer2])
d3d_transform_set_identity()
d3d_set_culling(0)

//minecart
d3d_transform_add_scaling(16,16,16)
d3d_transform_add_rotation_x(minecart_angle+90)
d3d_transform_add_rotation_z(minecart_direction+90)
d3d_transform_add_translation(x,y,z+20)
d3d_model_draw(global.minecart,0,0,0,global.minecart_tex)
d3d_transform_set_identity()

//other entities
with (Entity) if (point_distance_3d(x,y,-(z*16),other.x,other.y,other.z)<600) event_draw()
with (EnderChest) event_draw()
with (Readme) if (point_distance_3d(x,y,-(z*16),other.x,other.y,other.z)<200) event_draw()
with (Lectern) event_draw()
with (Herobrine) event_draw()

d3d_set_lighting(0)

with (Egg) event_draw()

//draw signs
with (SignText) if (point_distance_3d(x,y,-(z*16),other.x,other.y,other.z)<200) event_draw()
with (GameStation) if (point_distance_3d(x,y,-(z*16),other.x,other.y,other.z)<300) event_draw()
with (Chunger) if (point_distance_3d(x,y,-(z*16),other.x,other.y,other.z)<300) event_draw()

//particles
with (TornchParmicle) draw_particle()
with (RedstoneParticle) draw_particle()
with (SmokeParticle) draw_particle()
with (NetherParticle) draw_particle()
with (SporgBlosm) draw_particle()

if (launching==0 && !go) {
    //button hitboxes
    draw_set_alpha(0.2+0.1*sin(TIME/200))
    d3d_set_zbias(-2/1999)
    with (Hitbox) if (on) d3d_draw_block(x-r,y-r,z*-16+16-zr,x+r,y+r,z*-16+16+zr,-1,1,1)
    d3d_set_zbias(0)
    draw_set_alpha(1)
}

if (debug_mode) {
    draw_set_color($ff)
    with (Booster) d3d_draw_cylinder(x-2,y-2,-2000,x+2,y+2,2000,-1,0,0,0,4)
    draw_set_color($ffffff)
}

d3d_set_projection_default()
d3d_set_fog(0,0,0,0)

draw_hud()
