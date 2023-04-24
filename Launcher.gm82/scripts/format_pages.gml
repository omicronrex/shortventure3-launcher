///format_pages(text)

draw_set_font(fntSmall)
reviewpage=0
i=0

if (!readme) {
    text[0]="Review by "+global.judge[judge]
    i=1
}

repeat (string_token_start(argument0,"%PAGE%")) {
    wide[i]=0
    pats_links[i]=0
    str=string_replace_all(string_token_next(),"%MAKER%","Created by: "+get_game_data(game,gd_makers))
    if (string_pos("%WIDE%",str)) {
        wide[i]=1
        str=string_replace(str,"%WIDE%#","")
    }
    if (string_pos("%PATS_LINKS%",str)) {
        pats_links[i]=1
        str=string_replace(str,"%PATS_LINKS%#","")
    }
    if (!wide[i]) while (string_height_ext(str,-1,224)>256) {
        out=""
        j=1 repeat (string_length(str)) {
            out+=string_char_at(str,j)
            if (string_height_ext(out,-1,224)>256) {
                k=j do {k-=1 c=string_char_at(out,k)} until (c==" " || c=="#")
                text[i]=string_copy(out,1,k)
                str=string_delete(str,1,k)
                i+=1
                wide[i]=0
                pats_links[i]=0
                break
            }
        j+=1}
    }
    if (str!="#") {
        text[i]=str
        i+=1
    }
}

pages=i
