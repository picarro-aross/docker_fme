# Docker FME
Dockerfile to run old versions of FME in a old OS.  Ensure FME deb files have been previously downloaded.

Build with:
`docker buildx build -t fme-desktop .`

Setup with:
```
mkdir fme_runtime
chmod a+rwx fme_runtime/
```

Execute with:
`./runme`
