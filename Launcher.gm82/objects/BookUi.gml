#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=427-288/2
y=240-356/2-32

button1=0
page=0
readme=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(LecternUi)) {
    sound_play("add_item"+string(irandom_range(1,4)))
    window_set_cursor(cr_none)
    center_mouse()
}
instance_destroy_id(Link)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
button1=0
if (point_in_rectangle(mouse_x,mouse_y,427-200,y+392-20,427+200,y+392+20)) {
    button1=1
    if (mouse_check_button_pressed(mb_left)) {
        sound_play("click")
        mouse_clear(mb_left)
        instance_destroy()
    }
}

if (mouse_check_button_pressed(mb_left)) {
    if (page>0) if (point_in_rectangle(mouse_x,mouse_y,x+52,y+314-8,x+52+36,y+314+20+8)) {
        sound_play(choose("book_flip1","book_flip2"))
        page-=1
        check_pats_links()
    }
    if (page<pages-1) if (point_in_rectangle(mouse_x,mouse_y,x+196,y+314-8,x+196+36,y+314+20+8)) {
        sound_play(choose("book_flip1","book_flip2"))
        page+=1
        check_pats_links()
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
format_pages(text)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rect(0,0,854,480,0,0.7)
if (wide[page]) draw_background_ext(bgBookUi,x-288/4,y,1.5,1,0,$ffffff,1)
else draw_background(bgBookUi,x,y)

draw_set_color(0)
draw_set_font(fntBig)
draw_set_halign(2)
draw_text(x+256,y+24,str_ins("Page % of %",page+1,pages))
draw_set_halign(0)
draw_set_font(fntSmall)
if (wide[page]) {
    draw_set_font(fntMono)
    draw_text(x+48-288/4,y+55,text[page])
    draw_set_font(fntSmall)
} else draw_text_ext(x+32,y+55,text[page],-1,224)
if (page==0) {
    if (readme) draw_reviews_global(x+32,y+55+string_height_ext(text[page],-1,224))
    else draw_reviews_judge(x+32,y+55+string_height_ext(text[page],-1,224))
}
if (pats_links[page]) with (Link) event_draw()
draw_set_color($ffffff)

draw_set2(1,1)
draw_set_font(fntBig)
draw_sprite_ext(sprButton,button1,427,y+392,2,2,0,$ffffff,1)
draw_text_craft(427,y+392-2,"Done")
draw_set2(0,0)

if (page>0) draw_sprite(sprBookPage,0,x+52,y+314)
if (page<pages-1) draw_sprite(sprBookPage,1,x+196,y+314)
