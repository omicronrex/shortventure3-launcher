globalvar MODELS,NOLIGHT,MODELS_LATE,TEXTURES;

globalvar LAVA,LAVA_FLOW,WATER,WATER_FLOW,PORTAL,SEAGRASS,SEAGRASS_TOP,SEAGRASS_BOT,KELP,KELP_TOP,RAIL,POWERED_RAIL,DOT,LINE;

MODELS[0]=dsmap()
MODELS[1]=dsmap()
MODELS[2]=dsmap()
NOLIGHT[0]=dsmap()
NOLIGHT[1]=dsmap()
NOLIGHT[2]=dsmap()
MODELS_LATE[0]=dsmap()
MODELS_LATE[1]=dsmap()
MODELS_LATE[2]=dsmap()

TEXTURES=dsmap()

global.minecart=load_g3z("minecart.g3z")
global.minecart_tex=load_tex("minecart.png")
global.ender=load_g3z("ender_chest.g3z")
global.ender_lid=load_g3z("ender_lid.g3z")
global.ender_tex=load_tex("ender.png")
global.book=load_g3z("book.g3z")
global.book_tex=load_tex("book.png")
global.bear=load_g3z("bear.g3z")
global.bear_tex=load_tex("polar_bear.png")
global.chicken=load_g3z("chicken.g3z")
global.chicken_tex=load_tex("chicken.png")
global.cow=load_g3z("cow.g3z")
global.cow_tex=load_tex("cow.png")
global.pig=load_g3z("pig.g3z")
global.pig_tex=load_tex("pig.png")
global.zombie=load_g3z("zombie.g3z")
global.zombie_la=load_g3z("zombie_left_arm.g3z")
global.zombie_ra=load_g3z("zombie_right_arm.g3z")
global.zombie_tex=load_tex("zombie.png")
global.renex=load_g3z("renex.g3z")
global.renex_h=load_g3z("renex_head.g3z")
global.renex_la=load_g3z("renex_left_arm.g3z")
global.renex_ra=load_g3z("renex_right_arm.g3z")
global.renex_tex=load_tex("omicron.png")
global.hero_tex=load_tex("herobrine.png")
global.lectern=load_g3z("lectern.g3z")
global.itemframe=load_g3z("itemframe.g3z")
global.itemframe_tex=load_tex("itemframe.png")
global.wool=load_g3z("wool.g3z")
global.wool_tex=load_tex("sheep_wool.png")
global.sheep=load_g3z("sheep.g3z")
global.sheep_tex=load_tex("sheep.png")
global.creeper=load_g3z("creeper.g3z")
global.creeper_tex=load_tex("creeper.png")

global.lavaframe=0
global.kelpframe=0
global.waterframe=0

global.lavatex=background_add("data\tex\lava_still.png",0,0)
global.lavaflowtex=background_add("data\tex\lava_flow.png",0,0)
global.watertex=background_add("data\tex\water_still.png",0,0)
global.waterflowtex=background_add("data\tex\water_flow.png",0,0)
global.portaltex=background_add("data\tex\portal.png",0,0)
global.seagrasstex=background_add("data\tex\seagrass.png",0,0)
global.seagrasstoptex=background_add("data\tex\seagrass_top.png",0,0)
global.seagrassbottex=background_add("data\tex\seagrass_bottom.png",0,0)
global.kelptex=background_add("data\tex\kelp_plant.png",0,0)
global.kelptoptex=background_add("data\tex\kelp_top.png",0,0)
global.red_dot_tex=background_add("data\tex\redstone_dust_dot_on.png",0,0)
global.red_line_tex=background_add("data\tex\redstone_dust_line0_on.png",0,0)

load_surf=surface_create(47,47)
surface_set_target(load_surf)
draw_clear(0)
surface_reset_target()
loading=0

x1=21 y1=26
x2=21 y2=26

count=0

draw_loader()

load_model_slot("data\world\top\",0)
//load_model_slot("data\world\mid\",1)
load_model_slot("data\world\bot\",2)

surface_free(load_surf)
