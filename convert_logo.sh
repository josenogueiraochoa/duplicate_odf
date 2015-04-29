
for i in $(ls $1/*);
do
	convert -resize x136 -background white -gravity west -extent 760x136 $i $(dirname $i)/resize_$(basename $i)
done
