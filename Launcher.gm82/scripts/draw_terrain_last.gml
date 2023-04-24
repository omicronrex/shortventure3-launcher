key=ds_map_find_first(MODELS_LATE[argument0])
repeat (ds_map_size(MODELS_LATE[argument0])) {
    model=key
    texture=ds_map_find_value(MODELS_LATE[argument0],key)

    if (texture==PORTAL) texture=surface_get_texture(surface_get("portal",16,16))
    if (texture==LAVA) texture=surface_get_texture(surface_get("lava",16,16))
    if (texture==LAVA_FLOW) texture=surface_get_texture(surface_get("lava_flow",32,32))

    if (ds_map_exists(NOLIGHT[argument0],key)) d3d_set_lighting(0)
    d3d_model_draw(model,0,0,0,texture)
    d3d_set_lighting(1)

    key=ds_map_find_next(MODELS_LATE[argument0],key)
}
