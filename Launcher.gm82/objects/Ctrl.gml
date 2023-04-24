#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=60

selgo=0
sel=-1

esc=0
paused=0
button1=0
button2=0
snap=0
portald=0
rail_state=0
boost=0
angle_boost=0
vol=0
launching=0
waiting=5
subalpha=0
subtitle=""

fog_fac=1
light_fac=1

dir=global.savedir
dirz=global.savedirz
fov=80
fov_fac=0

spd=global.savespd
basespd=1.5
path=global.savepath
pathpos=global.savepos
go=global.savego
length=path_get_length(path)
mc_dir=0
mc_ang=0
minecart_direction=0
minecart_angle=0

nxto=global.savenxto
nyto=global.savenyto
falling=global.savefalling
zspeed=global.savezspeed
fallto=global.savefallto

nx=global.savenx
ny=global.saveny
nz=global.savenz
x=nx
y=ny
z=nz

snd=sound_loop_paused("minecart",0)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!sound_isplaying(MUSIC)) play_music()
alarm[0]=60
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (launching=-1 || waiting) DT=1
else DT=delta_time/(1000/60)
TIME+=16*DT

close_button()
resize_window()

if (instance_exists(BookUi)) {
    if (keyboard_check_pressed(vk_escape)) {
        with (BookUi) instance_destroy()
    }
} else if (instance_exists(LecternUi)) {
    if (keyboard_check_pressed(vk_escape)) {
        with (LecternUi) instance_destroy()
    }
} else if (paused) {
    button1=(point_in_rectangle(mouse_x,mouse_y,427-200,252-20,427+200,252+20))
    button2=(point_in_rectangle(mouse_x,mouse_y,427-200,300-20,427+200,300+20))
    if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_escape)) {
        if (button1 || keyboard_check_pressed(vk_escape)) {
            sound_play("click")
            sound_kind_resume(1)
            sound_resume(snd)
            paused=0
            mouse_clear(mb_left)
            if (debug_mode) live_path_reload()
            center_mouse()
            window_set_cursor(cr_none)
        } else if (button2) {
            sound_play("click")
            window_set_visible(0)
            sleep(500)
            game_end()
        }
    }
} else {
    if (launching) {
        fov_fac=min(1,fov_fac+1/100)
        fov=lerp(80,10,dcos(90-90*fov_fac))
        portald=fov_fac*100
        dir+=angle_difference(dir,point_direction(x,y,launching.x,launching.y))/10
        dirz+=angle_difference(dirz,point_direction_pitch(x,y,z,launching.x,launching.y,12-(launching.z*16)))/10
        sound_global_volume(0.5*(1-fov_fac))

        if (fov_fac==1) {
            with (launching) {
                launch_game(game)
                alarm[0]=60
            }
            launching=-1
            center_mouse()
        }
    } else if (keyboard_check_pressed(vk_escape) || !window_has_focus() && !instance_exists(Herobrine)) {
        paused=1
        sound_pause(snd)
        sound_kind_pause(1)
        window_set_cursor(cr_default)
        exit
    } else if (!waiting) {
        fov_fac=max(0,fov_fac-1/100)
        sound_global_volume(0.5*(1-fov_fac))
        fov=lerp(80,10,cosine(0,1,fov_fac))
        if (fov==80) {
            launching=0
            if (instance_exists(Herobrine)) {
                dir+=angle_difference(dir,270)/30
                dirz=lerp(dirz,0,1/30)
            } else {
                dir=modwrap(dir+(window_mouse_get_x()-(WIDTH div 2))/-3,0,360)
                dirz=median(-89,dirz+(window_mouse_get_y()-(HEIGHT div 2))/-3,89)
            }
        }

        center_mouse()
    } else center_mouse()

    if (waiting) waiting-=1

    maxspd=basespd+boost+angle_boost

    if (go) {
        spd=inch(spd,maxspd,DT/40)
        if (instance_exists(Herobrine)) spd=lerp(spd,maxspd*0.1,1/20)

        pathpos+=(spd/length)*DT

        if (debug_mode) if (mouse_wheel_down() || mouse_wheel_up()) go=0

        vol=spd/basespd*0.2
        sound_resume(snd)
        sound_volume(snd,vol)

        if (pathpos>=1) {
            pathpos=1
            spd=0
            go=0
            nxto=nx
            nyto=ny
            zspeed=0

            //i accidentally miscounted 13 games so some of the stations were removed
            if (path==path2) skip_over(path3)
            if (path==path6) skip_over(path7)
            if (path==path12) skip_over(path13)

            if (path==path4) {falling=1 nyto=752 fallto=88}
            if (path==path5) {falling=1 fallto=14}
            if (path==path10) {sound_play("travel") dir+=180 minecart_direction+=180 start_path(path11) spd=maxspd snap=1 portald=100}
            if (path==path15) {falling=1 nxto=224 fallto=101}
        }

        ox=nx nx=path_get_x(path,pathpos)
        oy=ny ny=path_get_y(path,pathpos)
        oz=nz nz=(path_get_speed(path,pathpos)-100)*-16

        if (spd>0) {
            mc_dir=point_direction(ox,oy,nx,ny)
            mc_ang=point_direction(0,oz,point_distance(ox,oy,nx,ny),nz)
        }
    } else {
        vol=inch(vol,0,DT/30)
        sound_volume(snd,vol)
        if (vol==0) sound_pause(snd)
        mc_ang=0

        if (debug_mode) {
            w=mouse_wheel_up()-mouse_wheel_down()
            if (w!=0) {
                pathpos=median(0,pathpos+(w*8)/length,1)
                nx=path_get_x(path,pathpos)
                ny=path_get_y(path,pathpos)
                nz=(path_get_speed(path,pathpos)-100)*-16
            }
        }
    }

    if (falling) {
        nx=inch(nx,nxto,DT)
        ny=inch(ny,nyto,DT)
        mc_ang=0
        zspeed=min(3.2*DT,zspeed+0.1*DT)
        nz=min(nz+zspeed,(fallto-100)*-16)
        if (nz==(fallto-100)*-16) {
            falling=0
            if (path==path5) start_path(path6)
            if (path==path15) start_path(path16)
        }
    }

    minecart_direction+=(angle_difference(minecart_direction,mc_dir)*DT)/10
    minecart_angle+=(angle_difference(minecart_angle,mc_ang)*DT)/10

    angle_boost=lerp(angle_boost,angle_difference(minecart_angle,0)/40,DT/100)

    if (portald) portald-=DT
    if (rail_state) rail_state-=DT
    boost=inch(boost,0,DT/150)

    if (snap) {
        snap=0
        x=nx
        y=ny
        z=nz
    } else {
        x=lerp(x,nx,DT/8)
        y=lerp(y,ny,DT/8)
        z=lerp(z,nz,DT/8)
    }
}

if (subalpha>0) subalpha-=1/100
#define Collision_Booster
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
boost=1
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
finalize()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (window_has_focus()) center_mouse()
event_step()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_scene()
#define KeyPress_78
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (debug_mode) start_path(execute_string("return path"+string(real(string_digits(path_get_name(path)))+1)))
#define KeyPress_80
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (debug_mode) start_path(execute_string("return path"+string(real(string_digits(path_get_name(path)))-1)))
#define KeyPress_82
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (debug_mode) start_path(path)
