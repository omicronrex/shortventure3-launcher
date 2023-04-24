if (pats_links[page]) {
    i=instance_create(x+32,y+145,Link) i.str="https://github.com/pieceofcheese87/studi..." i.link="https://github.com/pieceofcheese87/studiofusionengine"
    i=instance_create(x+32,y+175,Link) i.str="http://osabisi.sakura.ne.jp/m2/" i.link="http://osabisi.sakura.ne.jp/m2/"
    i=instance_create(x+32,y+220,Link) i.str="https://keygenjukebox.net/" i.link="https://keygenjukebox.net/"
    i=instance_create(x+32,y+250,Link) i.str="https://www.newgrounds.com/audio/listen/..." i.link="https://www.newgrounds.com/audio/listen/853068"
    i=instance_create(x+32,y+280,Link) i.str="https://keygenjukebox.net/" i.link="https://keygenjukebox.net/"
    with (Link) event_user(0)
} else instance_destroy_id(Link)
