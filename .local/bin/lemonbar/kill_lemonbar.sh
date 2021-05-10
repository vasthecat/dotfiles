pids=$(pgrep -f "sh .*run_lemonbar")
for pid in $pids ; do
    kill $pid
done
pid=$(pgrep "lemonbar")
kill $pid
