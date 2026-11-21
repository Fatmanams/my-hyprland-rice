function phonecam
    scrcpy --video-source=camera --camera-id=0 --camera-size=1920x1080 \
                   --camera-fps=30 --v4l2-sink=/dev/video10 --no-playback --no-audio $argv
end
