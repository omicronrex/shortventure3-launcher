if (window_is_maximized()) MAXED=1
else if (MAXED) {
    MAXED=0
    window_set_region_size(854,480,1)
}

if (window_get_width()!=WIDTH || window_get_height()!=HEIGHT) {

    WIDTH=window_get_width()
    HEIGHT=window_get_height()

    window_resize_buffer(WIDTH,HEIGHT)
    window_set_region_size(WIDTH,HEIGHT,0)
    view_wport=WIDTH
    view_hport=HEIGHT
}
