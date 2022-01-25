${HOME}/cctools-7.1.12-x86_64-centos7/bin/makeflow -T wq --jx-args data_list.json --jx hamr_PE.jx -a -r 10 -N hamrpipeline -M hamrpipeline -p 60214 -dall -o dall.log --disable-cache $@
${HOME}/cctools-7.1.12-x86_64-centos7/bin/makeflow -T wq --jx-args data_list.json --jx hamr_picard_step1.jx -a -r 10 -N hamrpipeline -M hamrpipeline -p 60214 -dall -o dall.log --disable-cache $@
${HOME}/cctools-7.1.12-x86_64-centos7/bin/makeflow -T wq --jx-args data_list.json --jx hamr_picard_step2.jx -a -r 10 -N hamrpipeline -M hamrpipeline -p 60214 -dall -o dall.log --disable-cache $@
${HOME}/cctools-7.1.12-x86_64-centos7/bin/makeflow -T wq --jx-args data_list.json --jx hamr_index_bam.jx -a -r 10 -N hamrpipeline -M hamrpipeline -p 60214 -dall -o dall.log --disable-cache $@
${HOME}/cctools-7.1.12-x86_64-centos7/bin/makeflow -T wq --jx-args data_list.json --jx hamr_gatk.jx -a -r 10 -N hamrpipeline -M hamrpipeline -p 60214 -dall -o dall.log --disable-cache $@
${HOME}/cctools-7.1.12-x86_64-centos7/bin/makeflow -T wq --jx-args data_list.json --jx hamr_laststep.jx -a -r 10 -N hamrpipeline -M hamrpipeline -p 60214 -dall -o dall.log --disable-cache $@
