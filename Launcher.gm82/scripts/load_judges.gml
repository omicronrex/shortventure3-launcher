var i;

global.judge[0]="Arzztt"
global.judge[1]="Canus"
global.judge[2]="Cosmoing"
global.judge[3]="Jopagu"
global.judge[4]="Kiyoshi"
global.judge[5]="Natsu"

global.review=0 //[game,judge]
global.scoresO=0 //[game,quesite]
global.scoresI=0 //etc
global.scoresG=0
global.scoresA=0
global.scoresT=0

i=0 repeat (6) {
    load_reviews(i,drive+"judges\"+string_lower(global.judge[i])+".txt")
i+=1}
