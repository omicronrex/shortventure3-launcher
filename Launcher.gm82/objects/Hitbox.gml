#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
z=0
r=3
zr=2

on=0

function=fun_roll
path=path1
subtitle=""
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///check for clicks

on=0
execute_look(x,y,z*-16+16,r,zr,0)

if (point_in_rectangle(427,240,global.__x-global.__z-8,global.__y-global.__zz-8,global.__x+global.__z+8,global.__y+global.__zz+8)) {
    with (Hitbox) on=0
    on=1
    if (subtitle!="") {
        Ctrl.subtitle=subtitle
        Ctrl.subalpha=1
    }
    if (mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_left)) script_execute(function)
}
