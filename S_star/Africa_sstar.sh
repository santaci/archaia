#!/bin/bash

# This file is Sstar

chr=$1
arc=neand # arc=den if running for denisovan
pop=Africa
popref=Ref
arc_vcf=/data/zool-archaia/scro2664/vernot_tutorial/filtered_vcfs_${arc}_mpi_minimal_filters/chr$chr.${arc}_filtered.vcf.gz
# run on length of chromosome
s=0
e=249250621
input_vcf=/data/zool-archaia/scro2664/SGDP_variants/phased/cteam_extended.v4.PS2_phase.public.chr$chr.vcf.gz
popfile=/data/zool-archaia/scro2664/SGDP_variants/allAfricanSamplesList.txt

python2.7  /data/zool-archaia/scro2664/vernot_tutorial/freezing-archer/bin/windowed_calculations.py \
    --s-star \
    --vcf-has-illumina-chrnums \
    -vcfz $input_vcf \
    -indf $popfile \
    -ptable /data/zool-archaia/scro2664/vernot_tutorial/archaic_match_table_files.${arc}_table.fields_8-10.12-.gz.db \
    -target-pops $pop \
    -ref-pops $popref \
    --archaic-vcf $arc_vcf \
    -p 10 \
    -ancbsg /data/zool-archaia/scro2664/vernot_tutorial/chimp.bsg \
    -winlen  50000 \
    -winstep 10000 \
    -table-query mh len mapped \
    -tag-ids bigpop -tags $pop \
    -range $s $e > sStar_$pop.chr$chr.txt \
    -r /data/zool-archaia/scro2664/SGDP_variants/x75_exclude_filtered.bed.bbg > sStar_$pop.chr$chr.txt 

   #-x /data/zool-archaia/scro2664/SGDP_variants/x75_exclude_filtered.bed.bbg > sStar_$pop.chr$chr.txt \
   #-ir intersect_callable_bases1.bbg intersect_callable_bases2.bbg \
