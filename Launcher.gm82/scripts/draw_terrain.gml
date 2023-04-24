key=ds_map_find_first(argument0)
repeat (ds_map_size(argument0)) {
    model=key
    texture=ds_map_find_value(argument0,key)

    if (texture==PORTAL) texture=surface_get_texture(surface_get("portal",16,16))
    if (texture==LAVA) texture=surface_get_texture(surface_get("lava",16,16))
    if (texture==LAVA_FLOW) texture=surface_get_texture(surface_get("lava_flow",32,32))
    if (texture==WATER) texture=surface_get_texture(surface_get("water",16,16))
    if (texture==WATER_FLOW) texture=surface_get_texture(surface_get("water_flow",32,32))
    if (texture==SEAGRASS) texture=surface_get_texture(surface_get("seagrass",16,16))
    if (texture==SEAGRASS_TOP) texture=surface_get_texture(surface_get("seagrasstop",16,16))
    if (texture==SEAGRASS_BOT) texture=surface_get_texture(surface_get("seagrassbot",16,16))
    if (texture==KELP) texture=surface_get_texture(surface_get("kelp",16,16))
    if (texture==KELP_TOP) texture=surface_get_texture(surface_get("kelptop",16,16))
    if (texture==RAIL) if (rail_state) texture=POWERED_RAIL
    if (texture==DOT) if (rail_state) texture=background_get_texture(global.red_dot_tex)
    if (texture==LINE) if (rail_state) texture=background_get_texture(global.red_line_tex)

    if (ds_map_exists(argument1,key)) d3d_set_lighting(0)
    d3d_model_draw(model,0,0,0,texture)
    d3d_set_lighting(1)

    key=ds_map_find_next(argument0,key)
}
