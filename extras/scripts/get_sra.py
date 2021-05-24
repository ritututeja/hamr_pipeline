import subprocess
import argparse as agp

def gse_to_sra(GSE=None):


	sra_list = open('sra_list_'+GSE+'.txt','w')

	cmd_get_srx='esearch -db gds -query "'+GSE+'[ACCN] AND GSM[ETYP]" | efetch -format docsum | xtract -pattern ExtRelation -element TargetObject'
	print('cmd_get_srx= ',cmd_get_srx)
	srx_str_raw= list(subprocess.check_output(cmd_get_srx, shell=True).decode("utf-8").split('\n'))
	srx_str= list(filter(None, srx_str_raw))

	srr_str_raw=list()
	for i in srx_str:
		cmd_get_srr='esearch -db sra -query '+i+' |efetch -format docsum|\
			xtract -pattern Runs -ACC @acc  -element "&ACC"'
		srr_str_raw.append(subprocess.check_output(cmd_get_srr, shell=True).decode("utf-8").split('\n'))

	for sublist in srr_str_raw:
		for item in sublist:
			if item:
				sra_list.write(item.strip())
				sra_list.write('\n')

if __name__ == "__main__":

	parser = agp.ArgumentParser()
	parser.add_argument('--inputGSE', help='Input file for GSE', required=False)
	args = parser.parse_args()

	for val in open(args.inputGSE, "r"):
		print('val= ',val)
		gse_to_sra(val.strip())

