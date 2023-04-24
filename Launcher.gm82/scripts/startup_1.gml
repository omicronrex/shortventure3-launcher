var i,j,t;

globalvar drive;drive="B:\"

globalvar WIDTH,HEIGHT,MAXED,TIME,DT,MUSIC;

globalvar REMAPLIST;

globalvar __gm82live_directory;__gm82live_directory=working_directory

if (!directory_exists(working_directory+"\data"))
    set_working_directory(directory_previous(working_directory))

execute("subst",'b: "'+working_directory+'\data"')

global.mylocation=working_directory

WIDTH=854
HEIGHT=480
MAXED=0
TIME=current_time mod 30000

fn=drive+"save.ini"
if (file_exists(fn)) {
    f=file_text_open_read(fn)
    global.savepath=file_text_read_real(f)
    global.savepos=file_text_read_real(f)
    global.savego=file_text_read_real(f)
    global.savespd=file_text_read_real(f)
    global.savedir=file_text_read_real(f)
    global.savedirz=file_text_read_real(f)

    global.savenx=file_text_read_real(f)
    global.saveny=file_text_read_real(f)
    global.savenz=file_text_read_real(f)
    global.savenxto=file_text_read_real(f)
    global.savenyto=file_text_read_real(f)
    global.savefalling=file_text_read_real(f)
    global.savezspeed=file_text_read_real(f)
    global.savefallto=file_text_read_real(f)

    global.creeper_dead=file_text_read_real(f)
    global.hero=file_text_read_real(f)
    global.v=file_text_read_real(f)

    i=0 repeat (game_count) {REMAPLIST[i]=file_text_read_real(f) i+=1}
    file_text_close(f)
} else {
    global.savepath=path1
    global.savepos=0
    global.savego=0
    global.savespd=0
    global.savedir=270
    global.savedirz=0

    global.savenx=0
    global.saveny=0
    global.savenz=0
    global.savenxto=0
    global.savenyto=0
    global.savefalling=0
    global.savezspeed=0
    global.savefallto=0

    global.creeper_dead=0
    global.hero=0
    global.v=0

    for (i=0;i<game_count;i+=1) REMAPLIST[i]=i
    for (i=game_count-1;i>0;i-=1) {
        j=irandom(i)
        t=REMAPLIST[i]
        REMAPLIST[i]=REMAPLIST[j]
        REMAPLIST[j]=t
    }
}

set_application_title(room_caption)

sound_add_directory_ext(drive+"music\",".ogg",1,1,"")
sound_add_directory_ext(drive+"sound\",".ogg",0,0,"")
sound_kind_volume(1,0.6)
sound_global_volume(0.5)

sound_play("06. Moog City")
