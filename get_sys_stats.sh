remount, rw /; mkdir /usr/share/terminfo/d; cp /usr/share/terminfo/v/vt100 /usr/share/terminfo/d/dumb

mkdir archived
mv *.log archived
df -h
iostat -t -m -x sda1 30 1000 > iostat.log &
vmstat -t -S m 30 1000 > vmstat.log &
top -H -p `pidof dvr_client`, `pidof iptv_transmuxer`, `pidof ntf_server` -b -n 20 > top.log &
mpstat -P ALL 30 1000 > mpstat.log &
#for i in `seq 1 250`; do timeout 120 strace -p `pidof dvr_client` -p `pidof iptv_transmuxer` -p `pidof ntf_server` -f -r -c -o strace_dvr.$i; done 
df -h
