///load_reviews(judge id, filename)
var f,mode,judge;

judge=argument0

f=file_text_open_read(argument1)
mode=0
do {
    str=file_text_read_string(f) file_text_readln(f)
    if (string_char_at(str,1)=="%") {
        if (mode==2) global.review[game,judge]=text
        mode=1
        game=ds_grid_value_x(global.gamedata,0,0,game_count,0,string_replace_all(str,"%",""))
        text=""
    } else if (mode==1) {
        if (str="") mode=2
        else {
            c=string_char_at(str,1)
            if (c=="O") global.scoresO[game,judge]=real(string_delete(str,1,2))
            if (c=="I") global.scoresI[game,judge]=real(string_delete(str,1,2))
            if (c=="G") global.scoresG[game,judge]=real(string_delete(str,1,2))
            if (c=="A") global.scoresA[game,judge]=real(string_delete(str,1,2))
            if (c=="T") global.scoresT[game,judge]=real(string_delete(str,1,2))
        }
    } else if (mode==2) {
        text+=str+"#"
    }
} until (file_text_eof(f))

if (mode==2) global.review[game,judge]=text

file_text_close(f)
