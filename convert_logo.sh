
for i in $(ls $1/*);
do
	convert -resize x136 -background white -gravity west -extent 940x136 $i $i.new
done
