#!/bin/sh

# curses.h

# TODO: trap SIGWINCH?
read -r ROWS COLS <<EOF
$(stty size)
EOF

# sl.h

D51HEIGHT=10
D51FUNNEL=7
D51LENGTH=83
D51PATTERNS=6

D51STR1='      ====        ________                ___________ '
D51STR2='  _D _|  |_______/        \__I_I_____===__|_________| '
D51STR3='   |(_)---  |   H\________/ |   |        =|___ ___|   '
D51STR4='   /     |  |   H  |  |     |   |         ||_| |_||   '
D51STR5='  |      |  |   H  |__--------------------| [___] |   '
D51STR6='  | ________|___H__/__|_____/[][]~\_______|       |   '
D51STR7='  |/ |   |-----------I_____I [][] []  D   |=======|__ '

D51WHL11='__/ =| o |=-~~\  /~~\  /~~\  /~~\ ____Y___________|__ '
D51WHL12=' |/-=|___|=    ||    ||    ||    |_____/~\___/        '
D51WHL13='  \_/      \O=====O=====O=====O_/      \_/            '

D51WHL21='__/ =| o |=-~~\  /~~\  /~~\  /~~\ ____Y___________|__ '
D51WHL22=' |/-=|___|=O=====O=====O=====O   |_____/~\___/        '
D51WHL23='  \_/      \__/  \__/  \__/  \__/      \_/            '

D51WHL31='__/ =| o |=-O=====O=====O=====O \ ____Y___________|__ '
D51WHL32=' |/-=|___|=    ||    ||    ||    |_____/~\___/        '
D51WHL33='  \_/      \__/  \__/  \__/  \__/      \_/            '

D51WHL41='__/ =| o |=-~O=====O=====O=====O\ ____Y___________|__ '
D51WHL42=' |/-=|___|=    ||    ||    ||    |_____/~\___/        '
D51WHL43='  \_/      \__/  \__/  \__/  \__/      \_/            '

D51WHL51='__/ =| o |=-~~\  /~~\  /~~\  /~~\ ____Y___________|__ '
D51WHL52=' |/-=|___|=   O=====O=====O=====O|_____/~\___/        '
D51WHL53='  \_/      \__/  \__/  \__/  \__/      \_/            '

D51WHL61='__/ =| o |=-~~\  /~~\  /~~\  /~~\ ____Y___________|__ '
D51WHL62=' |/-=|___|=    ||    ||    ||    |_____/~\___/        '
D51WHL63='  \_/      \_O=====O=====O=====O/      \_/            '

D51WHL1="$D51WHL11$D51WHL12$D51WHL13"

D51WHL2="$D51WHL21$D51WHL22$D51WHL23"

D51WHL3="$D51WHL31$D51WHL32$D51WHL33"

D51WHL4="$D51WHL41$D51WHL42$D51WHL43"

D51WHL5="$D51WHL51$D51WHL52$D51WHL53"

D51WHL6="$D51WHL61$D51WHL62$D51WHL63"

D51_TOP="$D51STR1$D51STR2$D51STR3$D51STR4$D51STR5$D51STR6$D51STR7"

d51="$D51_TOP$D51WHL1$D51_TOP$D51WHL2$D51_TOP$D51WHL3$D51_TOP$D51WHL4$D51_TOP$D51WHL5$D51_TOP$D51WHL6"

D51_WIDTH=54
D51_PAGE_SIZE=540

D51DEL="                                                      "

COAL01='                              '
COAL02='                              '
COAL03='    _________________         '
COAL04='   _|                \_____A  '
COAL05=' =|                        |  '
COAL06=' -|                        |  '
COAL07='__|________________________|_ '
COAL08='|__________________________|_ '
COAL09='   |_D__D__D_|  |_D__D__D_|   '
COAL10='    \_/   \_/    \_/   \_/    '

COAL="$COAL01$COAL02$COAL03$COAL04$COAL05$COAL06$COAL07$COAL08$COAL09$COAL10"

COALDEL="                              "

COAL_WIDTH=30

LOGOHEIGHT=6
LOGOFUNNEL=4
LOGOLENGTH=84
LOGOPATTERNS=6

LOGO1='     ++      +------ '
LOGO2='     ||      |+-+ |  '
LOGO3='   /---------|| | |  '
LOGO4='  + ========  +-+ |  '

LWHL11=' _|--O========O~\-+  '
LWHL12='//// \_/      \_/    '

LWHL21=' _|--/O========O\-+  '
LWHL22='//// \_/      \_/    '

LWHL31=' _|--/~O========O-+  '
LWHL32='//// \_/      \_/    '

LWHL41=' _|--/~\------/~\-+  '
LWHL42='//// \_O========O    '

LWHL51=' _|--/~\------/~\-+  '
LWHL52='//// \O========O/    '

LWHL61=' _|--/~\------/~\-+  '
LWHL62='//// O========O_/    '

LCOAL1='____                 '
LCOAL2='|   \@@@@@@@@@@@     '
LCOAL3='|    \@@@@@@@@@@@@@_ '
LCOAL4='|                  | '
LCOAL5='|__________________| '
LCOAL6='   (O)       (O)     '

LCAR1='____________________ '
LCAR2='|  ___ ___ ___ ___ | '
LCAR3='|  |_| |_| |_| |_| | '
LCAR4='|__________________| '
LCAR5='|__________________| '
LCAR6='   (O)        (O)    '

DELLN="                     "

C51HEIGHT=11
C51FUNNEL=7
C51LENGTH=87
C51PATTERNS=6

C51DEL='                                                       '

C51STR1='        ___                                            '
C51STR2='       _|_|_  _     __       __             ___________'
C51STR3='    D__/   \_(_)___|  |__H__|  |_____I_Ii_()|_________|'
C51STR4="     | \`---'   |:: \`--'  H  \`--'         |  |___ ___|  "
C51STR5='    +|~~~~~~~~++::~~~~~~~H~~+=====+~~~~~~|~~||_| |_||  '
C51STR6='    ||        | ::       H  +=====+      |  |::  ...|  '
C51STR7='|    | _______|_::-----------------[][]-----|       |  '

C51WH61='| /~~ ||   |-----/~~~~\  /[I_____I][][] --|||_______|__'
C51WH62="------'|oOo|==[]=-     ||      ||      |  ||=======_|__"
C51WH63='/~\____|___|/~\_|   O=======O=======O  |__|+-/~\_|     '
C51WH64='\_/         \_/  \____/  \____/  \____/      \_/       '

C51WH51="| /~~ ||   |-----/~~~~\  /[I_____I][][] --|||_______|__"
C51WH52="------'|oOo|===[]=-    ||      ||      |  ||=======_|__"
C51WH53='/~\____|___|/~\_|    O=======O=======O |__|+-/~\_|     '
C51WH54='\_/         \_/  \____/  \____/  \____/      \_/       '

C51WH41='| /~~ ||   |-----/~~~~\  /[I_____I][][] --|||_______|__'
C51WH42="------'|oOo|===[]=- O=======O=======O  |  ||=======_|__"
C51WH43='/~\____|___|/~\_|      ||      ||      |__|+-/~\_|     '
C51WH44='\_/         \_/  \____/  \____/  \____/      \_/       '

C51WH31='| /~~ ||   |-----/~~~~\  /[I_____I][][] --|||_______|__'
C51WH32="------'|oOo|==[]=- O=======O=======O   |  ||=======_|__"
C51WH33='/~\____|___|/~\_|      ||      ||      |__|+-/~\_|     '
C51WH34='\_/         \_/  \____/  \____/  \____/      \_/       '

C51WH21='| /~~ ||   |-----/~~~~\  /[I_____I][][] --|||_______|__'
C51WH22="------'|oOo|=[]=- O=======O=======O    |  ||=======_|__"
C51WH23='/~\____|___|/~\_|      ||      ||      |__|+-/~\_|     '
C51WH24='\_/         \_/  \____/  \____/  \____/      \_/       '

C51WH11='| /~~ ||   |-----/~~~~\  /[I_____I][][] --|||_______|__'
C51WH12="------'|oOo|=[]=-      ||      ||      |  ||=======_|__"
C51WH13='/~\____|___|/~\_|  O=======O=======O   |__|+-/~\_|     '
C51WH14='\_/         \_/  \____/  \____/  \____/      \_/       '

# utils

slice() (
    string="${1?}"
    start="${2:?}"
    end="${2?}"

    # TODO: Remove.
    [ "$end" -gt "${#string}" ] && printf '%s\n' "Index out of bounds: $*"

    printf '%s' "$string" | cut -c"$((start + 1))-$end"
)

slice_with_length() (
    string="${1?}"
    start="${2:?}"
    length="${2:?}"

    slice "$string" "$start" $((start + length))
)

# sl.c

ACCIDENT=0
LOGO=0
FLY=0
C51=0

my_mvaddstr() (
    # int y, int x, char *str

    # for ( ; x < 0; ++x, ++str)
    #     if (*str == '\0')  return ERR;
    # for ( ; *str != '\0'; ++str, ++x)
    #     if (mvaddch(y, x, *str) == ERR)  return ERR;
    # return OK;
    :
)

option() {
    # char *str

    # extern int ACCIDENT, LOGO, FLY, C51;

    # while (*str != '\0') {
    #     switch (*str++) {
    #         case 'a': ACCIDENT = 1; break;
    #         case 'F': FLY      = 1; break;
    #         case 'l': LOGO     = 1; break;
    #         case 'c': C51      = 1; break;
    #         default:                break;
    #     }
    # }
    :
}

main() {
    # int x, i;

    tput init
    tput civis
    tput smcup

    # trap '' INT

    stty -echo
    stty -icanon min 0 time 0

    x=$((COLS - 1))

    while true; do
        if [ -n "$LOGO" ]; then
            add_sl "$x" || break
        elif [ -n "$C51" ]; then
            add_C51 "$x" || break
        else
            add_D51 "$x" || break
        fi

        # TODO: Make this portable.
        sleep 0.04

        x=$((x - 1))
    done

    tput cnorm
    tput rmcup

    return 0
}

add_sl() (
    # int x

    # static char *sl[LOGOPATTERNS][LOGOHEIGHT + 1]
    #     = {{LOGO1, LOGO2, LOGO3, LOGO4, LWHL11, LWHL12, DELLN},
    #     {LOGO1, LOGO2, LOGO3, LOGO4, LWHL21, LWHL22, DELLN},
    #     {LOGO1, LOGO2, LOGO3, LOGO4, LWHL31, LWHL32, DELLN},
    #     {LOGO1, LOGO2, LOGO3, LOGO4, LWHL41, LWHL42, DELLN},
    #     {LOGO1, LOGO2, LOGO3, LOGO4, LWHL51, LWHL52, DELLN},
    #     {LOGO1, LOGO2, LOGO3, LOGO4, LWHL61, LWHL62, DELLN}};

    # static char *coal[LOGOHEIGHT + 1]
    #     = {LCOAL1, LCOAL2, LCOAL3, LCOAL4, LCOAL5, LCOAL6, DELLN};

    # static char *car[LOGOHEIGHT + 1]
    #     = {LCAR1, LCAR2, LCAR3, LCAR4, LCAR5, LCAR6, DELLN};

    # int i, y, py1 = 0, py2 = 0, py3 = 0;

    # if (x < - LOGOLENGTH)  return ERR;
    # y = LINES / 2 - 3;

    # if (FLY == 1) {
    #     y = (x / 6) + LINES - (COLS / 6) - LOGOHEIGHT;
    #     py1 = 2;  py2 = 4;  py3 = 6;
    # }
    # for (i = 0; i <= LOGOHEIGHT; ++i) {
    #     my_mvaddstr(y + i, x, sl[(LOGOLENGTH + x) / 3 % LOGOPATTERNS][i]);
    #     my_mvaddstr(y + i + py1, x + 21, coal[i]);
    #     my_mvaddstr(y + i + py2, x + 42, car[i]);
    #     my_mvaddstr(y + i + py3, x + 63, car[i]);
    # }
    # if (ACCIDENT == 1) {
    #     add_man(y + 1, x + 14);
    #     add_man(y + 1 + py2, x + 45);  add_man(y + 1 + py2, x + 53);
    #     add_man(y + 1 + py3, x + 66);  add_man(y + 1 + py3, x + 74);
    # }
    # add_smoke(y - 1, x + LOGOFUNNEL);
    # return OK;
    :
)

add_D51() (
    x="$1"

    if [ "$x" -lt "-$D51LENGTH" ]; then
        return 1
    fi

    y=$((LINES / 2 - 5))
    dy=0

    if [ "$FLY" = 1 ]; then
        y=$(((x / 7) + LINES - (COLS / 7) - D51HEIGHT))
        dy=1
    fi

    i=0
    while [ "$i" -lt "$D51HEIGHT" ]; do
        page_index=$(((D51LENGTH + x) % D51PATTERNS))
        line_index=$((page_index * D51_PAGE_SIZE + i * D51_WIDTH))

        my_mvaddstr \
            $((y + i)) \
            "$x" \
            "$(slice_with_length "$d51" "$line_index" "$D51_WIDTH")"
        my_mvaddstr \
            $((y + i + dy)) \
            $((x + 53)) \
            "$(slice_with_length "$COAL" $((i * COAL_WIDTH)) "$COAL_WIDTH")"
        i=$((i + 1))
    done

    if [ "$ACCIDENT" = 1 ]; then
        add_man $((y + 2)) $((x + 43))
        add_man $((y + 2)) $((x + 47))
    fi
    add_smoke $((y - 1)) $((x + D51FUNNEL))

    return 0
)

add_C51() (
    # int x

    # static char *c51[C51PATTERNS][C51HEIGHT + 1]
    #     = {{C51STR1, C51STR2, C51STR3, C51STR4, C51STR5, C51STR6, C51STR7,
    #         C51WH11, C51WH12, C51WH13, C51WH14, C51DEL},
    #     {C51STR1, C51STR2, C51STR3, C51STR4, C51STR5, C51STR6, C51STR7,
    #         C51WH21, C51WH22, C51WH23, C51WH24, C51DEL},
    #     {C51STR1, C51STR2, C51STR3, C51STR4, C51STR5, C51STR6, C51STR7,
    #         C51WH31, C51WH32, C51WH33, C51WH34, C51DEL},
    #     {C51STR1, C51STR2, C51STR3, C51STR4, C51STR5, C51STR6, C51STR7,
    #         C51WH41, C51WH42, C51WH43, C51WH44, C51DEL},
    #     {C51STR1, C51STR2, C51STR3, C51STR4, C51STR5, C51STR6, C51STR7,
    #         C51WH51, C51WH52, C51WH53, C51WH54, C51DEL},
    #     {C51STR1, C51STR2, C51STR3, C51STR4, C51STR5, C51STR6, C51STR7,
    #         C51WH61, C51WH62, C51WH63, C51WH64, C51DEL}};
    # static char *coal[C51HEIGHT + 1]
    #     = {COALDEL, COAL01, COAL02, COAL03, COAL04, COAL05,
    #     COAL06, COAL07, COAL08, COAL09, COAL10, COALDEL};

    # int y, i, dy = 0;

    # if (x < - C51LENGTH)  return ERR;
    # y = LINES / 2 - 5;

    # if (FLY == 1) {
    #     y = (x / 7) + LINES - (COLS / 7) - C51HEIGHT;
    #     dy = 1;
    # }
    # for (i = 0; i <= C51HEIGHT; ++i) {
    #     my_mvaddstr(y + i, x, c51[(C51LENGTH + x) % C51PATTERNS][i]);
    #     my_mvaddstr(y + i + dy, x + 55, coal[i]);
    # }
    # if (ACCIDENT == 1) {
    #     add_man(y + 3, x + 45);
    #     add_man(y + 3, x + 49);
    # }
    # add_smoke(y - 1, x + C51FUNNEL);
    # return OK;
    :
)

add_man() (
    # int y, int x

    # static char *man[2][2] = {{"", "(O)"}, {"Help!", "\\O/"}};
    # int i;

    # for (i = 0; i < 2; ++i) {
    #     my_mvaddstr(y + i, x, man[(LOGOLENGTH + x) / 12 % 2][i]);
    # }
    :
)

SMOKEPTNS=16

add_smoke() (
    # int y, int x

    # static struct smokes {
    #     int y, x;
    #     int ptrn, kind;
    # } S[1000];
    # static int sum = 0;
    # static char *Smoke[2][SMOKEPTNS]
    #     = {{"(   )", "(    )", "(    )", "(   )", "(  )",
    #         "(  )" , "( )"   , "( )"   , "()"   , "()"  ,
    #         "O"    , "O"     , "O"     , "O"    , "O"   ,
    #         " "                                          },
    #     {"(@@@)", "(@@@@)", "(@@@@)", "(@@@)", "(@@)",
    #         "(@@)" , "(@)"   , "(@)"   , "@@"   , "@@"  ,
    #         "@"    , "@"     , "@"     , "@"    , "@"   ,
    #         " "                                          }};
    # static char *Eraser[SMOKEPTNS]
    #     =  {"     ", "      ", "      ", "     ", "    ",
    #         "    " , "   "   , "   "   , "  "   , "  "  ,
    #         " "    , " "     , " "     , " "    , " "   ,
    #         " "                                          };
    # static int dy[SMOKEPTNS] = { 2,  1, 1, 1, 0, 0, 0, 0, 0, 0,
    #                             0,  0, 0, 0, 0, 0             };
    # static int dx[SMOKEPTNS] = {-2, -1, 0, 1, 1, 1, 1, 1, 2, 2,
    #                             2,  2, 2, 3, 3, 3             };
    # int i;

    # if (x % 4 == 0) {
    #     for (i = 0; i < sum; ++i) {
    #         my_mvaddstr(S[i].y, S[i].x, Eraser[S[i].ptrn]);
    #         S[i].y    -= dy[S[i].ptrn];
    #         S[i].x    += dx[S[i].ptrn];
    #         S[i].ptrn += (S[i].ptrn < SMOKEPTNS - 1) ? 1 : 0;
    #         my_mvaddstr(S[i].y, S[i].x, Smoke[S[i].kind][S[i].ptrn]);
    #     }
    #     my_mvaddstr(y, x, Smoke[sum % 2][0]);
    #     S[sum].y = y;    S[sum].x = x;
    #     S[sum].ptrn = 0; S[sum].kind = sum % 2;
    #     sum ++;
    # }
    :
)

main "$@"
