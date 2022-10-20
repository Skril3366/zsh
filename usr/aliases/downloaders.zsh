alias sdl="pbpaste | xargs -I {} spotdl download '{}'"
alias mdl="pbpaste | xargs -I {} yt-dlp --format bestaudio --audio-format mp3 --extract-audio --output '%(playlist_index)s. %(title)s.%(ext)s' '{}'"
alias vdl="pbpaste | xargs -I {} yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 '{}' -o '%(title)s.%(ext)s' "
