# HAMR Pipeline

## STEP 1
HISAT2 mapping- 
a) hisat2_2.1.1.sif -p 8 -x tair_index/tair --sra-acc SRR3581731 -S SRR3581731.sam
* HISAT2 was run using different mismatch criterias.

## STEP 2
Get unique mapping reads
a) Filtered reads with NH tag
grep -P "^\@|NH:i:1$" SRR3581731.sam | singularity run --cleanenv samtools_1.10.sif samtools view  -bS - | singularity run --cleanenv samtools_1.10.sif samtools sort > SRR3581731.unique.sorted.bam

## STEP 3
Resolve Spliced Alignments
a) SplitNCigarReads
singularity run --cleanenv gatk_4.1.8.1.sif gatk SplitNCigarReads -R TAIR10_allchr.fasta -I SRR3581731.unique.sorted.bam -O SRR3581731.cigar.bam
* ALLOW_N_CIGAR_READS is no longer available in new GATK version
b) Sort
singularity run --cleanenv gatk_4.1.8.1.sif gatk SortSam -I  SRR3581731.cigar.bam -O SRR3581731.cigar.sorted.bam -SO coordinate

## STEP 4
Run HAMR
singularity run --cleanenv hamr_1.0.sif -i SRR3581731.cigar.sorted.bam -g TAIR10_allchr.fasta -m hamr/models/euk_trna_mods.Rdata -o hamr_SRR3581731 -a SRR3581731 -q 30 -c 10 -e 0.05 -k H4 -p 0.01 -f 0.05 -j 0.05

-q min_read_qual
-c min_read_coverage
-e seq_error_rate
-k hypothesis
-p max_p
-f max_fdr
-j min_ref_percent
