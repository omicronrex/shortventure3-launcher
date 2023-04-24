play_sound_3d(x,y,16-(z*16),"button",1)
repeat (2) {
    i=instance_create(x+random_range(-1,1),y+random_range(-1,1),RedstoneParticle)
    i.z=-(z*16)+16+random_range(-1,1)
}
Ctrl.rail_state=70
