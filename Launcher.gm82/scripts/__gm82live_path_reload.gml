var dir;
dir=__gm82live_directory+"\paths\"

f=file_text_open_read(dir+"index.yyd")
do {
    str=file_text_read_string(f)
    file_text_readln(f)
    if (str!="") {
        path=execute_string("return "+str)
        path_clear_points(path)
        f2=file_text_open_read(dir+str+"\points.txt")
        do {
            string_token_start(file_text_read_string(f2),",")
            file_text_readln(f2)
            path_add_point(path,real(string_token_next()),real(string_token_next()),real(string_token_next()))
        } until file_text_eof(f2)
        file_text_close(f2)
    }
} until file_text_eof(f)
file_text_close(f)
