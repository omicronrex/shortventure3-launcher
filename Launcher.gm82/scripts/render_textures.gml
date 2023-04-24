global.lavaframe+=1/8
global.kelpframe+=1/6
global.waterframe+=1/4

surface_set("lava",16,16)
fr=global.lavaframe mod 39
draw_background(global.lavatex,0,floor(abs(20.5-fr))*-16)

surface_set("lava_flow",32,32)
fr=global.lavaframe mod 16
draw_background(global.lavaflowtex,0,floor(fr)*-32)

d3d_set_color_mask(1,1,1,0)

surface_set("water",16,16)
draw_clear_alpha(0,0.7)
fr=global.waterframe mod 32
draw_background(global.watertex,0,floor(fr)*-16)

surface_set("water_flow",32,32)
draw_clear_alpha(0,0.7)
draw_background(global.waterflowtex,0,floor(fr)*-32)

d3d_set_color_mask(1,1,1,1)

surface_set("portal",16,16)
draw_clear_alpha(0,0)
draw_background(global.portaltex,0,floor(fr)*-16)

surface_set("seagrass",16,16)
draw_clear_alpha(0,0)
fr=global.kelpframe mod 18
draw_background(global.seagrasstex,0,floor(fr)*-16)

surface_set("seagrasstop",16,16)
draw_clear_alpha(0,0)
fr=global.kelpframe mod 19
draw_background(global.seagrasstoptex,0,floor(fr)*-16)

surface_set("seagrassbot",16,16)
draw_clear_alpha(0,0)
draw_background(global.seagrassbottex,0,floor(fr)*-16)

surface_set("kelp",16,16)
draw_clear_alpha(0,0)
fr=global.kelpframe mod 20
draw_background(global.kelptex,0,floor(fr)*-16)

surface_set("kelptop",16,16)
draw_clear_alpha(0,0)
draw_background(global.kelptoptex,0,floor(fr)*-16)

surface_reset()
