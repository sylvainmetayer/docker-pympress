# Docker Pympress

Docker image for [pympress](https://github.com/Cimbali/pympress)

## Build it 

Feel free to edit the `pympress` config file to fit your need which will be then copied to the image while building.

- `make build`

## Run it 

### X11

- `xhost +` This will allow docker to connect to the X11 socket. Otherwise, the docker daemon cannot connect and you'll get an error like the one below

    ```
    Unable to init server: Could not connect: Connection refused
    ```

- `docker run --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/main.pdf:/data/main.pdf sylvainmetayer/pympress` where `$(pwd)/main.pdf:/data/main.pdf` is the PDF you want to present. You can also map a folder

### Wayland

TODO
