function ccast_precode -d "precode video files for chromecast"
	for file in $argv
		ffmpeg -i $file -threads 0 -map 0:v -map 0:a \
			-c:v:0 libx264 -c:a:0 libvorbis -c:a:1 libvorbis -profile:v high -level 4.1 -tune -film \
			-metadata:s:a:0 language=ger -metadata:s:a:1 language=eng -movflags +faststart \
			(echo "$file" | sed -e "s/\\.[a-z]\{3\}\$/.mkv/")
	end
end
