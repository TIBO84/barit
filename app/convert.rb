

i=1

while (i <= 31) do
	`convert image_base/bar_#{i}.jpg -quality 30% -resize 25% image_compress/bar_#{i}.jpg`
	i += 1
	puts i
end