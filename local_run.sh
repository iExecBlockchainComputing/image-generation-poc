#! /usr/bin/env bash

docker run --rm \
    -v $PWD/src/iexec_in:/iexec_in \
	 -v $PWD/src/iexec_out:/iexec_out \
	 -e IEXEC_IN=/iexec_in \
	 -e IEXEC_OUT=/iexec_out \
	 ig
