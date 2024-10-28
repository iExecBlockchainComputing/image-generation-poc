#### Running locally 

1. CD into Image-Generation and build docker build
```console
docker build --tag ig .
```

2. Run the image with the example prompt located in the src/iexec_in folder. You have to update the path
```console
docker run --rm \
    -v ~/Documents/ai_usecases/Image-Generation/src/iexec_in:/iexec_in \
    -v ~/Documents/ai_usecases/Image-Generation/src/iexec_out:/iexec_out \
    -e IEXEC_IN=/iexec_in \
    -e IEXEC_OUT=/iexec_out \
    ig
```