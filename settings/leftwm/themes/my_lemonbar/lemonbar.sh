while true; do
	# b=$(grep ^.*$ /sys/class/backlight/intel_backlight/brightness)
	# a=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/.$//')
	# printf "%%{r}[$a%%] [$b] $d\n"
	d=$(date)
	printf "%%{r}$d\n"
	sleep 1
done

