#### Running locally 

(CURRENTLY NOT COMPATIBLE WITH Scone but compatible with TDX)

1. CD into Image-Generation and run docker build
```console
docker build --tag ig .
```

2. Run the image with the example prompt located in the src/iexec_in folder. You have to update the path
```console
docker run --rm \
    -v ./src/iexec_in:/iexec_in \
    -v ./src/iexec_out:/iexec_out \
    -e IEXEC_IN=/iexec_in \
    -e IEXEC_OUT=/iexec_out \
    -e IEXEC_DATASET_FILENAME=prompt.txt \
    ig
```
