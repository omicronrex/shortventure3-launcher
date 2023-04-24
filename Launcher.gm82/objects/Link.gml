#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
window_set_cursor(cr_default)
url_open(link)
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
window_set_cursor(cr_handpoint)
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
window_set_cursor(cr_default)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fntSmall)
image_xscale=string_width(str)
image_yscale=12
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color($ff8000)
draw_text(x,y,str)
draw_sprite_ext(tex_1x1,0,x,bbox_bottom,sprite_width,1,0,$ff8000,1)
