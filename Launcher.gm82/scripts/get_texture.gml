if (ds_map_exists(TEXTURES,argument0))
    return ds_map_find_value(TEXTURES,argument0)

str=filename_remove_ext(argument0)

if (string_pos("jmc2obj",str)) {
    str=string_delete(str,1,7)
    str=string_delete(str,1,string_pos("jmc2obj",str)+7)
    str="jmc2obj\"+string_replace_all(str+".png","-","\")
}
if (string_pos("minecraft",str)) {
    str=string_delete(str,1,9)
    str=string_delete(str,1,string_pos("minecraft",str)+9)
    str="minecraft\"+string_replace_all(str+".png","-","\")
}

str=working_directory+"\data\tex\"+str


tex=background_get_texture(background_add(str,0,0))

ds_map_add(TEXTURES,argument0,tex)

return tex
