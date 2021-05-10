fontsize="16"
font="DejaVu Sans Mono:style=Bold,size=${fontsize}"
iconsfont="xos4 Terminess Powerline:size=${fontsize}"

rm -rf /tmp/lemonbar
mkdir /tmp/lemonbar
while :; do
    printf "%s\n" "$(python3 bargen.py)"
    sleep 0.5
done | lemonbar -f "${font}" -f "${iconsfont}" -p
