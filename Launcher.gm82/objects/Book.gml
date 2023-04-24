#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=1/2
image_index=irandom(image_number-1)

image_xscale=2
image_yscale=2

on=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
on=0
if (instance_position(mouse_x,mouse_y,id)) on=1
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(BookUi)) {
    i=instance_create(0,0,BookUi)
    i.text=global.review[game,judge]
    i.judge=judge
    i.game=game
    with (i) event_user(0)
    sound_play(choose("book_flip1","book_flip2"))
}
