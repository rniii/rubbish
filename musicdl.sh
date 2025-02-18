#!/bin/sh
yt-dlp \
    --progress \
    --extract-audio \
    --output "%(album,playlist_title,track,title)s/%(track_number,playlist_index|01)02d.%(track,title)s.%(ext)s" \
    --embed-metadata \
    --parse-metadata "%(album,playlist_title,track,title)s:%(meta_album)s" \
    --parse-metadata "%(track_number,playlist_index)s:%(meta_track)s" \
    --parse-metadata "description:Released on: (?P<meta_date>\d+(?=-)\d+(?=-)\d+)" \
    --parse-metadata ":(?P<meta_description>)" \
    --parse-metadata ":(?P<meta_synopsis>)" \
    --parse-metadata ":(?P<meta_comment>)" \
    --parse-metadata ":(?P<meta_purl>)" \
    -- "$@"

rsgain easy -S -p ~/rsgain.ini .
