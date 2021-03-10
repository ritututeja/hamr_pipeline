#!/bin/bash

${HOME}/cctools-7.1.12-x86_64-centos7/bin/makeflow -T wq --jx run_hamr.jx -a -r 10 -N run_hamr -M run_hamr -p 60221 -dall -o dall.log --disable-cache $@
