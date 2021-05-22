if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
fi

if ! [ -f "$1" ]; then
	echo "File not found"
	exit 1
fi

filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# ffmpeg -i in.mp4 out.gif

# Dotting pattern
# ffmpeg \
#   -i opengl-rotating-triangle.mp4 \
#   -r 15 \
#   -vf scale=512:-1 \
#   -ss 00:00:03 -to 00:00:06 \
#   opengl-rotating-triangle.gif

#-r 15 is fine for gifs i think...

#-vf "scale=512:-1,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
ffmpeg \
  -i "${filename}.mp4" \
  -vf "split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
  "${filename}.gif"