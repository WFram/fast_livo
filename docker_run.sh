WS=$1
docker run \
    --rm \
    --name fast_livo \
    -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e HOME=$WS \
    --net=host \
    -e DISPLAY=$DISPLAY \
    -w $WS \
    -v $HOME:$HOME \
    -v /media:/media \
    --device=/dev/dri:/dev/dri \
    -it \
    fast_livo:main \
    bash