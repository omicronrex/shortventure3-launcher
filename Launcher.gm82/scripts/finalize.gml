with (Ctrl) {
    f=file_text_open_write(drive+"save.ini")
    file_text_write_real(f,path)
    file_text_write_real(f,pathpos)
    file_text_write_real(f,go)
    file_text_write_real(f,spd)
    file_text_write_real(f,dir)
    file_text_write_real(f,dirz)
    file_text_write_real(f,nx)
    file_text_write_real(f,ny)
    file_text_write_real(f,nz)
    file_text_write_real(f,nxto)
    file_text_write_real(f,nyto)
    file_text_write_real(f,falling)
    file_text_write_real(f,zspeed)
    file_text_write_real(f,fallto)

    file_text_write_real(f,global.creeper_dead)
    file_text_write_real(f,global.hero)
    file_text_write_real(f,global.v)

    i=0 repeat (game_count) {file_text_write_real(f,REMAPLIST[i]) i+=1}
    file_text_close(f)
}

execute("subst",'b: /d')
