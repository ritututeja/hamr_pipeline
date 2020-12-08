#from pybedtools import BedTool
import pybedtools
import pandas as pd
mods = pybedtools.BedTool('common_mods_silique.bed')  # [1]
genes = pybedtools.BedTool('../Araport11_GFF3_genes_transposons.201606.gff')

#for feature in BedTool(mods).annotate(genes):
#    print(feature)
#genes.intersect(mods).saveas('mods_features.bed', trackline="track name='features' color=128,0,0")

g = pybedtools.BedTool(genes).remove_invalid().saveas('features.bed')
featuretypes = ['CDS','five_prime_UTR','three_prime_UTR']
#cds, fiveprime, threeprime = pool.map(subset_featuretypes, featuretypes)

#pybedtools.BedTool(mods).intersect('',s=stranded,bed=True,stream=True,)).count()

g_introns= genes.introns(gene= 'gene', exon='exon').remove_invalid().saveas('intron.bed')

cds_fn= g.filter(lambda b: b[2] == 'CDS')
fprime_fn= g.filter(lambda b: b[2] == 'five_prime_UTR')
tprime_fn= g.filter(lambda b: b[2] == 'three_prime_UTR')
tprime_fn= g.filter(lambda b: b[2] == 'three_prime_UTR')
introns_fn= g_introns.filter(lambda b: b[4] == 'intron')

cds_fn.intersect(mods,bed=True).saveas('silique/cds_mods_features.bed', trackline="track name='cds' color=128,0,0")
fprime_fn.intersect(mods,bed=True).saveas('silique/fprime_mods_features.bed', trackline="track name='fprime' color=128,0,0")
tprime_fn.intersect(mods,bed=True).saveas('silique/tprime_mods_features.bed', trackline="track name='tprime' color=128,0,0")
introns_fn.intersect(mods,bed=True).saveas('silique/intron_mods_features.bed', trackline="track name='introns' color=128,0,0")

#cds_mods= pybedtools.BedTool(mods).intersect(cds_fn,bed=True,stream=True).count()
#fprime_mods= pybedtools.BedTool(mods).intersect(fprime_fn,bed=True,stream=True).count()
#tprime_mods= pybedtools.BedTool(mods).intersect(tprime_fn,bed=True,stream=True).count()
#print('cds_mods= ',cds_mods,'five_prime_UTR_mods= ',fprime_mods,'three_prime_UTR= ',tprime_mods)

# cut -f1,4 cds_mods_features.bed|sort|uniq|wc -l