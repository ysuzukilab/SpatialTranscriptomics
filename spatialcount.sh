#!/bin/sh
#$ -S /bin/sh
#$ -l s_vmem=100G
#$ -l mem_req=100G
#-pe def_slot 4

<<COMMENT
usage:
      qsub -l os7 -cwd spatialcount.sh -i ID_NAME -r REFERENCE \
      -f FASTQS -t TIF -s SLIDE_ID -a AREAD_ID

options:
      -i ... id name
      -r ... reference (GRCh38 or mm10)
      -f ... path to fastqs
      -t ... path to tif
      -s ... slide id
      -a ... aread id

description:
      analysis of fastqs by spaceranger
COMMENT

while getopts i:r:f:t:s:a: OPT;do
  case $OPT in
    i )ID=$OPTARG #id name
      ;;
    r )REF=$OPTARG #path to reference
      ;;
    f )FASTQS=$OPTARG #path to fastqs
      ;;
    t )TIF=$OPTARG #path to tif
      ;;
    s )SLIDE=$OPTARG #slide id
      ;;
    a )AREA=$OPTARG #area id
      ;;
    *?)usage
      ;;
	esac
done

export PATH=~/visium/tools/spaceranger-1.0.0:$PATH
spaceranger count --id=${ID} \
                  --transcriptome=${REF} \
                  --fastqs=${FASTQS} \
                  --image=${TIF} \
                  --slide=${SLIDE} \
                  --area=${AREA}

mv ${ID} ~/visium/output/

