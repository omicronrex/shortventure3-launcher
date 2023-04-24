if (loading) {
    surface_set_target(load_surf)
    draw_rectangle_color(x1-8,y1-8,x2+8,y2+8,$999999,$999999,$999999,$999999,0)
    draw_rectangle_color(x1,y1,x2,y2,$52b280,$52b280,$52b280,$52b280,0)
    draw_rectangle_color(x1+1,y1+1,x2-1,y2-1,$723530,$723530,$723530,$723530,0)
    draw_rectangle_color(x1+2,y1+2,x2-2,y2-2,$00c621,$00c621,$00c621,$00c621,0)
    draw_rectangle_color(x1+3,y1+3,x2-3,y2-3,$ffffff,$ffffff,$ffffff,$ffffff,0)
    surface_reset_target()
}

loading=1
x1=max(9,x1+choose(-1,0))
x2=min(37,x2+choose(1,0))
y1=max(9,y1+choose(-1,0))
y2=min(37,y2+choose(1,0))

draw_surface_stretched(load_surf,332,206,188,188)
screen_refresh()
