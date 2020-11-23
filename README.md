# HAMR HPC Pipeline

## STEP 1
**tophat2** <br/>
Singularity pull docker://quay.io/biocontainers/tophat:2.1.1--py27_3 <br/>
**tophat2 mapping**<br/>
a) hisat2_2.1.1.sif -p 8 -x tair_index/tair --sra-acc SRR3581731 -S SRR3581731.sam

## STEP 2
**Get unique mapping reads**<br/>
a) Filtered reads with NH tag<br/>
grep -P "^\@|NH:i:1$" SRR3581731.sam | singularity run --cleanenv samtools_1.10.sif samtools view  -bS - | singularity run --cleanenv samtools_1.10.sif samtools sort > SRR3581731.unique.sorted.bam

## STEP 3
**Resolve Spliced Alignments**<br/>
a) SplitNCigarReads<br/>
singularity run --cleanenv gatk_4.1.8.1.sif gatk SplitNCigarReads -R TAIR10_allchr.fasta -I SRR3581731.unique.sorted.bam -O SRR3581731.cigar.bam<br/>
-ALLOW_N_CIGAR_READS is no longer available in new GATK version<br/>
b) Sort<br/>
singularity run --cleanenv gatk_4.1.8.1.sif gatk SortSam -I  SRR3581731.cigar.bam -O SRR3581731.cigar.sorted.bam -SO coordinate<br/>

## STEP 4
**Run HAMR**<br/>
singularity run --cleanenv hamr_1.0.sif -i SRR3581731.cigar.sorted.bam -g TAIR10_allchr.fasta -m hamr/models/euk_trna_mods.Rdata -o hamr_SRR3581731 -a SRR3581731 -q 30 -c 10 -e 0.05 -k H4 -p 0.01 -f 0.05 -j 0.05<br/>

-q min_read_qual<br/>
-c min_read_coverage<br/>
-e seq_error_rate<br/>
-k hypothesis<br/>
-p max_p<br/>
-f max_fdr<br/>
-j min_ref_percent<br/>
