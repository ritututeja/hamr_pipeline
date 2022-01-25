{
        "define" : {
                "MODELS": "/xdisk/dukepauli/reetututeja/old_ericdisk_backup/hamr_models",
		"DATA_DIR": ".",
                "DATA_DIR_ABS": "/xdisk/dukepauli/reetututeja/ath_bioprojects",
                "GENOME_IND": "/xdisk/dukepauli/reetututeja/old_ericdisk_backup/genome_indexes",
                "SING_CONT": "singularity run --cleanenv /xdisk/dukepauli/reetututeja/old_ericdisk_backup/hamr_pipeline", #Sing containers
        },
    "categories" : {
        "mapping" : {
                        "resources" : {"cores": 1, "memory" : 12288, "disk" : 1024  }
        }
    },

    "rules": [
      # Resolve splice alignments
       {
       "command" : template("{SING_CONT}/gatk3_3.5-0.sif java -Xmx8g -jar /usr/GenomeAnalysisTK.jar -T SplitNCigarReads -R {DATA_DIR_ABS}/Sbicolor_454_v3.0.1.fasta -I {DATA_DIR_ABS}/{INDEXBAM}.RGO.bam -o {DATA_DIR_ABS}/{INDEXBAM}.resolvedalig.bam -U ALLOW_N_CIGAR_READS"),
     } for INDEXBAM in andrew_data,
]
}
