#!/bin/sh
#$ -l s_vmem=100G
#$ -l mem_req=100G
#-pe def_slot 4

<<COMMENT
export PATH=/path/to/spaceranger-1.0.0:$PATH
spaceranger count --id=id_name \
									--transcriptome=/path/to/refdata/ \
									--fastqs=/path/to/fastq \
									--image=/path/to/.tif \
									--slide=slide_id \
									--area=area_id \
"""
COMMENT

export PATH=~/visium/tools/spaceranger-1.0.0:$PATH
spaceranger count --id=Mouse_Kidney_No4 \
									--transcriptome=~/visium/reference/refdata-cellranger-mm10-3.0.0/ \
									--fastqs=~/visium/data/fastq/200124_mouse_kidney/ \
									--image=~/visium/data/fig/20200124124703-4-1.tif \
									--slide=V19T12-008 \
									--area=D1
