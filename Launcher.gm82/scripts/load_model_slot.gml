dir=argument0
for (file=file_find_first(dir+"*.g3z",0);file!="";file=file_find_next()) {
    fn=dir+file

    texture=get_texture(file)

    //unlit models
    m=d3d_model_create()
    if (
        string_pos("rail",file)
    ||  (string_pos("redstone",file) && !string_pos("redstone_ore",file))
    ||  string_pos("cornflower",file)
    ||  string_pos("fern",file)
    ||  string_pos("magma",file)
    ||  string_pos("daisy",file)
    ||  string_pos("peony",file)
    ||  string_pos("poppy",file)
    ||  string_pos("mushroom",file)
    ||  string_pos("nether_portal",file)
    ||  string_pos("berry",file)
    ||  string_pos("dandelion",file)
    ||  string_pos("sea_lantern",file)
    ||  string_pos("torch",file)
    ||  string_pos("lava",file)
    ||  (string_pos("grass",file) && !string_pos("grass_block",file))
    ) dsmap(NOLIGHT[argument1],m,1)

    //transparent models
    if (
        string_pos("water",file)
    ||  string_pos("ice",file)
    ||  string_pos("nether_portal",file)
    ) dsmap(MODELS_LATE[argument1],m,texture)
    else dsmap(MODELS[argument1],m,texture)

    //animated models
    if (string_pos("lava_still",file)) LAVA=texture
    if (string_pos("lava_flow",file)) LAVA_FLOW=texture
    if (string_pos("water_still",file)) WATER=texture
    if (string_pos("water_flow",file)) WATER_FLOW=texture
    if (string_pos("portal",file)) PORTAL=texture
    if (string_pos("seagrass",file) && !string_pos("_seagrass",file)) SEAGRASS=texture
    if (string_pos("tall_seagrass_top",file)) SEAGRASS_TOP=texture
    if (string_pos("tall_seagrass_bottom",file)) SEAGRASS_BOT=texture
    if (string_pos("kelp",file) && !string_pos("kelp_plant",file)) KELP_TOP=texture
    if (string_pos("kelp_plant",file)) KELP=texture
    if (string_pos("powered_rail",file) && !string_pos("powered_rail_on",file)) RAIL=texture
    if (string_pos("powered_rail_on",file)) POWERED_RAIL=texture
    if (string_pos("redstone_dust_dot",file)) DOT=texture
    if (string_pos("redstone_dust_line",file)) LINE=texture

    d3d_model_load_g3z(m,fn)
    d3d_model_draw(m,0,0,32000,-1)

    count+=1
    if (count>3) {
        draw_loader()
        count=0
    }
} file_find_close()
