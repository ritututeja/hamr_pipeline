#!/bin/bash
${HOME}/cctools-7.1.12-x86_64-centos7/bin/makeflow -T wq --jx-args SraAccList.json --jx run_fastq_PE.jx -a -r 10 -N hamrpipeline -M hamrpipeline -p 60219 -dall -o dall.log --disable-cache $@

${HOME}/cctools-7.1.12-x86_64-centos7/bin/makeflow -T wq --jx-args SraAccList.json --jx hamr_PE.jx -a -r 10 -N hamrpipeline -M hamrpipeline -p 60219 -dall -o dall.log --disable-cache $@
