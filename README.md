# Docker FME
Dockerfile to run old versions of FME in an old OS.  
Download FME installer deb file to same directory as Dockerfile.

Build with:
`docker buildx build -t fme-desktop .`

Setup with:
```
mkdir fme_runtime
chmod a+rwx fme_runtime/
```

Execute with:
`./fmeworkbench`

The `fme_runtime` directory is used to store licenses and config outside of the container.
It can also be used to hold data and save `.fmw` files.
