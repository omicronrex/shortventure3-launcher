if (debug_mode) {
    with (Ambience) {
        execute_look(x,y,z*-16,4,4,1)
        draw_circle_color(global.__x,global.__y,global.__z,$808080,$808080,0)
    }
    with (SoundCarrier) {
        execute_look(x,y,z,2,2,1)
        draw_circle_color(global.__x,global.__y,global.__z,$c0c0c0,$c0c0c0,0)
    }

    with (NetherSpawner) {
        execute_look(x,y,z*-16,4,4,1)
        draw_circle_color(global.__x,global.__y,global.__z,$800080,$800080,0)
    }
    with (LightSounce) {
        execute_look(x,y,z*-16,4,4,1)
        draw_circle_color(global.__x,global.__y,global.__z,$ffff,$ffff,0)
    }
    with (SporeSpawn) {
        execute_look(x,y,z*-16,4,4,1)
        draw_circle_color(global.__x,global.__y,global.__z,$ff00,$ff00,0)
    }
}

if (portald) draw_surface_stretched_ext(surface_get("portal",16,16),0,0,854,480,$ffffff,portald/100)

//crosshair
if (!instance_exists(Herobrine)) {
    draw_set_blend_mode_ext(10,1)
    draw_sprite(sprCrosshair,0,427,240)
    draw_set_blend_mode(0)
}
d3d_end()

draw_set_font(fntBig)
if (debug_mode) draw_text_craft(10,10,str_ins("x: %#y: %#z: %",x,y,mc_y))

draw_set_halign(1)
draw_set_alpha(subalpha)
draw_text_craft(427,480-30,subtitle)
draw_set_halign(0)
draw_set_alpha(1)

with (LecternUi) event_draw()
with (BookUi) event_draw()

if (!debug_mode) if (paused) {
    rect(0,0,854,480,0,0.7)
    draw_set_font(fntBig)
    draw_set_halign(1)
    draw_text_craft(427,160,"Launcher Menu")
    draw_set_valign(1)
    draw_sprite_ext(sprButton,button1,427,252,2,2,0,$ffffff,1)
    draw_text_craft(427,252-2,"Back to Launcher")
    draw_sprite_ext(sprButton,button2,427,300,2,2,0,$ffffff,1)
    draw_text_craft(427,300-2,"Save and Quit")
    draw_reset()
}
