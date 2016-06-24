# ccast precode

```
#!/usr/bin/fish

for file in *.avi
  ffmpeg -i $file -threads 0 -map 0:v -map 0:a \
    -c:v:0 libx264 -c:a:0 libvorbis -c:a:1 libvorbis -profile:v high -level 4.1 -tune -film \
    -metadata:s:a:0 language=ger -metadata:s:a:1 language=eng -movflags +faststart \
    (echo {$file} | sed "s/\.avi$/\.mkv/g")
end
```

```
#!/bin/bash

for file in *.avi; do
  ffmpeg -i $file -threads 0 -map 0:v -map 0:a \
    -c:v libx264 -tune -film -c:a:0 libfdk_aac -c:a:1 libfdk_aac -b:a 384k \
    -metadata:s:a:0 language=ger -metadata:s:a:1 language=eng -movflags +faststart \
    `basename "$file" .avi`.mkv
done
```
