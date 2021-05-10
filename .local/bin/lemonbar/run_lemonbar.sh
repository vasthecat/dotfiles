basedir=$(dirname $0)
cd $basedir

fontsize="16"
font="DejaVu Sans Mono:style=Bold,size=${fontsize}"
# powerline-fonts-git aur package
iconsfont="xos4 Terminess Powerline:size=${fontsize}"

rm -rf /tmp/lemonbar
mkdir /tmp/lemonbar
while :; do
    printf "%s\n" "$(python3 bargen.py)"
    sleep 0.5
done | lemonbar -f "${font}" -f "${iconsfont}" -p

wait
