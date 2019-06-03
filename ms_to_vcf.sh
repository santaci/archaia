for ((a=1;a<=22;a++)); do
#a=22


chr1=4985
chr2=4864
chr3=3960
chr4=3823
chr5=3618
chr6=3422
chr7=3183
chr8=2927
chr9=2824
chr10=2711
chr11=2700
chr12=2677
chr13=2303
chr14=2147
chr15=2051
chr16=1807
chr17=1624
chr18=1562
chr19=1183
chr20=1261
chr21=963
chr22=1026

chr="chr$a"
block=${!chr}

echo $chr
echo $block

#cd $DATA/ancient/chapter4/simulations/growth/variable/noadmixGROWTH/${chr}
#cd $DATA/ancient/chapter4/simulations/growth/variable/35K_admix/admix4/${chr}

#cd $DATA/ancient/chapter4/simulations/structure/variable/no_admix/${chr}
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix4/${chr}

#cd $DATA/ancient/chapter4/simulations/growth/variable/no_admix/
#cd $DATA/ancient/chapter4/simulations/growth/variable/admix4/${chr}

#cd $DATA/ancient/chapter4/simulations/growth/variable/papuan/noadmix/${chr}
#cd $DATA/ancient/chapter4/simulations/growth/variable/papuan/admix6/${chr}
#cd $DATA/ancient/chapter4/simulations/growth/variable/european/noadmix/${chr}
cd $DATA/ancient/chapter4/simulations/growth/variable/european/admix2/${chr}


#Positions in a column
tail -n +6 ms_chr${a}_wgs.txt | head -1 | awk '$1=$1' FS=" " OFS="\n" | tail -n +2 | awk -v block="$block" '{printf "%d\n",$1*block*50000}' - > chr${a}.out

#Number of samples
for ((i=7; i<=35; i++)); do
#for ((i=7; i<=49; i++)); do

#Segsites in a column
tail -n +${i} -q ms_chr${a}_wgs.txt | head -1 | sed 's/\(.\{1\}\)/\1 /g' | tr ' ' '\n' | paste chr${a}.out - > tmp2
mv tmp2 chr${a}.out

done

#Full Simulation
#awk '{print $1"\t"$2"|"$3"\t"$4"|"$5"\t"$6"|"$7"\t"$8"|"$9"\t"$10"|"$11"\t"$12"|"$13"\t"$14"|"$15"\t"$16"|"$17"\t"$18"|"$19"\t"$20"|"$21"\t"$22"|"$23"\t"$24"|"$25"\t"$26"|"$27"\t"$28"|"$29}' chr${a}.out > tmp2

#Target Pop Only - African sims
#awk '{print $1"\t"$2"|"$3"\t"$4"|"$5"\t"$6"|"$7"\t"$8"|"$9"\t"$10"|"$11"\t"$12"|"$13"\t"$14"|"$15}' chr${a}.out > tmp2

#Target Pop Only - Papuan sims
#awk '{print $1"\t"$30"|"$31"\t"$32"|"$33"\t"$34"|"$35"\t"$36"|"$37"\t"$38"|"$39"\t"$40"|"$41"\t"$42"|"$43}' chr${a}.out > tmp2

#Target Pop Only - European sims
awk '{print $1"\t"$16"|"$17"\t"$18"|"$19"\t"$20"|"$21"\t"$22"|"$23"\t"$24"|"$25"\t"$26"|"$27"\t"$28"|"$29}' chr${a}.out > tmp2


awk -v a="$a" '{print a"\t"$1"\t.\t.\t.\t.\tPASS\t.\tGT"}' tmp2 > chr${a}.out

head -1 /data/cindy/ancient/chapter4/simulations/example_blarg.out > tmp.vcf
cut -f 2- tmp2 | paste chr${a}.out - >> tmp.vcf

sed '$d' tmp.vcf | cut -f 1-16 - > sim_${a}.vcf

rm tmp.vcf
rm tmp2
rm chr${a}.out


done
