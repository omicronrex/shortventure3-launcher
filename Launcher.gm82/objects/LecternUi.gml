#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=427-352/2
y=240-84/2

button1=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (Book) instance_destroy()
window_set_cursor(cr_none)
center_mouse()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(BookUi)) if (point_in_rectangle(mouse_x,mouse_y,427-200,y+120-20,427+200,y+120+20)) {
    button1=1
    if (mouse_check_button_pressed(mb_left)) {
        sound_play("click")
        mouse_clear(mb_left)
        instance_destroy()
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=0 repeat (6) {o=instance_create(x+71+36*i,y+36,Book) o.game=game o.judge=i o.author=global.judge[i] i+=1}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(BookUi)) exit

rect(0,0,854,480,0,0.7)
draw_background(bgLecternUi,x,y)
with (Book) draw_self()

with (Book) if (on) {
    mx=mouse_x+16
    my=mouse_y-32
    draw_background(bgNametag,mx,my)
    draw_text_craft(mx+8,my,"Review")
    draw_set_color($a8a8a8)
    draw_text_craft(mx+8,my+24,"by "+author)
    draw_set_color($ffffff)
}

draw_set2(1,1)
draw_set_font(fntBig)
draw_sprite_ext(sprButton,button1,427,y+120,2,2,0,$ffffff,1)
draw_text_craft(427,y+120-2,"Done")
draw_set2(0,0)
