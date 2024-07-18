# Docker FME
Dockerfile to run old versions of FME in an old OS.  

Build with:
`docker buildx build -t fme-desktop .`

Setup with:
```
mkdir <fme work directory>
chmod a+rwx <fme work directory>
```

Add an alias to your `.bashrc`:
```
alias fmeworkbench="xhost +local:docker \
    && docker run \
        --rm \
        --detach \
        --user ufme \
        --env DISPLAY \
        --device /dev/dri \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --volume /dev/shm:/dev/shm \
        --volume <full path to fme directory>:/home/ufme \
        fme-desktop"
```

Execute with:
`fmeworkbench`

The `<fme workdirectory>` is used to store licenses and config outside of the container.
It can also be used to hold data and save `.fmw` files.
