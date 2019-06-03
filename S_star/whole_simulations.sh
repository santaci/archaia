#!/bin/bash

# This file is Sstar

#SBATCH --time=120:00:00
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=macs
#SBATCH --mail-type=ALL
#SBATCH --mail-user=cindy.santander@stx.ox.ac.uk

#i=$SLURM_ARRAY_TASK_ID
#window="$(cat 50000.only.bed.recomb | grep -w chr$i)"

chr1=249250621
chr2=243199373
chr3=198022430
chr4=191154276
chr5=180915260
chr6=171115067
chr7=159138663
chrX=155270560
chr8=146364022
chr9=141213431
chr10=135534747
chr11=135006516
chr12=133851895
chr13=115169878
chr14=107349540
chr15=102531392
chr16=90354753
chr17=81195210
chr18=78077248
chr20=63025520
chrY=59373566
chr19=59128983
chr22=51304566
chr21=48129895


#for ((i=1;i<=6;i++)); do
i=$1
chr="chr$i"
size=${!chr}

#echo $size $chr

#Recent simulations with Structure

#Structure - Admixture 2% - variable - 1MYA split - 35Kya admixture
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix2/100M_35k/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 -n 1 0.0058 -n 2 0.0119 -m 1 2 36.4 -m 2 1 360 -eM 0.00052775 0 -es 0.0004375 1 0.98 -en 0.00043751 3 0.0067 -en 0.001671 1 0.0205 -en 0.00238125 1 0.0067 -en 0.008751 1 0.0067 -ej 0.00167 2 1 -ej 0.0125 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix2/100M_35k/
#mv **/sStar* .
#head -1 sStar_simulation_wgs_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > struc_100M_35k.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "struc_100M_35k", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> struc_100M_35k.txt

#Structure - Admixture 2% - variable - 1MYA split - 100Kya admixture
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix2/100M_100k/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 -n 1 0.0058 -n 2 0.0119 -m 1 2 36.4 -m 2 1 360 -eM 0.00052775 0 -es 0.00125 1 0.98 -en 0.001251 3 0.0067 -en 0.001671 1 0.0205 -en 0.00238125 1 0.0067 -en 0.008751 1 0.0067 -ej 0.00167 2 1 -ej 0.0125 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix2/100M_100k/
#mv **/sStar* .
#head -1 sStar_simulation_wgs_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > struc_100M_100k.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "struc_100M_100k", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> struc_100M_100k.txt

#Structure - Admixture 40% - variable - 350KYA split - 35Kya admixture
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix40/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 -n 1 0.0058 -n 2 0.0119 -m 1 2 36.4 -m 2 1 360 -eM 0.00052775 0 -es 0.0004375 1 0.60 -en 0.00043751 3 0.0067 -en 0.001671 1 0.0205 -en 0.00238125 1 0.0067 -en 0.008751 1 0.0067 -ej 0.00167 2 1 -ej 0.004375 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix40/
#mv **/sStar* .
#head -1 sStar_simulation_wgs_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > struc_350k_35k.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "struc_350K_35k", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> struc_350k_35k.txt

#Recent simulations with Growth

#Growth - Admixture 4% - variable - date of Inter-human split pushed back to 350,000 years - 50 KYA admixture - 1 MYA split
#cd $DATA/ancient/chapter4/simulations/growth/variable/old_hu_split/second/${chr}
#cd $DATA/ancient/chapter4/simulations/growth/variable/old_hu_split/noadmix/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.000625 1 0.96 -en 0.001251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.004375 2 1 -ej 0.0125 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 -m 1 2 36.4 -m 2 1 360 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.000625 1 0.96 -en 0.001251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.004375 2 1 -ej 0.0125 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#/data/cindy/Tools/macs/macs 29 ${size} -t 0.03764 -r 0.07528 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 3 14 14 1 -m 1 2 160 -m 2 1 160 -g 1 4951.7 -g 2 41228 -eg 0.00107 1 0. -eg 0.0001117 2 0. -en 0.000775 2 9.1e-05 -en 0.000785 2 0.01 -ej 0.004375 2 1 -ej 0.0125 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 3 14 14 1 --ms-num-diploid-inds 14 -msarc 2 -msarcjt 0.0125 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_noadmix.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix4.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/old_hu_split/noadmix/
#mv **/sStar_* .
#head -1 sStar_simulation_chr1_noadmix.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > sStar_50k_350k_1M_noad.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "1M_350k_50k", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' -  >> sStar_50k_350k_1M_noad.txt



#Double growth - no Admixture - variable - 350kya split
#cd $DATA/ancient/chapter4/simulations/growth/variable/noadmixGROWTH/${chr}
#/data/cindy/Tools/macs/macs 29 ${size} -t 0.03764 -r 0.07528 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 3 14 14 1 -m 1 2 160 -m 2 1 160 -g 1 4951.7 -g 2 41228 -eg 0.00107 1 0. -eg 0.0001117 2 0. -en 0.000775 2 9.1e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.004375 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 3 14 14 1 --ms-num-diploid-inds 14 -msarc 2 -msarcjt 0.004375 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_GROWTH.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/noadmixGROWTH/
#mv **/sStar_*
#head -1 sStar_simulation_chr1_GROWTH.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > sStar_noadmix_GROWTH.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "noadmix_GROWTH", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' -  >> sStar_noadmix_GROWTH.txt


#Growth - Admixture 40% - variable - 35kya admixture - 350kya split
#cd $DATA/ancient/chapter4/simulations/growth/variable/35K_admix/admix40/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.0004375 1 0.96 -en 0.001251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.004375 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix40.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/35K_admix/admix40/
#mv **/sStar_* .
#head -1 sStar_simulation_chr1_admix40.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > sStar_35k_admix40.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "350sp_35k_admix40", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' -  >> sStar_35k_admix40.txt

#Growth - European - No admixture - variable - split 700KYA - migration - bottleneck
#cd $DATA/ancient/chapter4/simulations/growth/variable/european/noadmix/${chr}
#/data/cindy/Tools/macs/macs 29 ${size} -t 0.03764 -r 0.07528 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt  -I 3 14 14 1 -m 1 2 160 -m 2 1 160 -g 1 4303.9 -g 2 41228 -eg 0.00107 1 0. -eg 0.0001117 2 0. -en 0.000775 2 9.1e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 1 -ref-pops 0 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 3 14 14 1 --ms-num-diploid-inds 14 -msarc 2 -msarcjt 0.00875 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/european/noadmix/
#mv **/sStar* .
#head -1 sStar_simulation_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > european_sStar_noadmix.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^1/, "european_noadmix", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> european_sStar_noadmix.txt

#Growth - European - Admixture 2% - variable - 50 Kya admixture - split 700KYA - migration - bottleneck
#cd $DATA/ancient/chapter4/simulations/growth/variable/european/admix2/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.000625 2 0.98 -en 0.0006251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 1 -ref-pops 0 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/european/admix2/
#mv **/sStar* .
#head -1 sStar_simulation_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > european_sStar_admix2.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^1/, "european_admix2", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> european_sStar_admix2.txt

#Growth - Papuan  - No admixture - variable - split 700KYA - migration - bottleneck
#cd $DATA/ancient/chapter4/simulations/growth/variable/papuan/noadmix/${chr}
#/data/cindy/Tools/macs/macs 43 ${size} -t 0.03764 -r 0.07528 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 4 14 14 14 1 -m 1 2 160 -m 2 1 160 -g 1 4303.9 -g 2 41228 -g 3 32189 -n 3 0.25 -eg 0.00107 1 0. -eg 0.0001117 2 0. -eg 0.0001 3 0. -en 0.000775 2 9.1e-05 -en 0.000785 2 0.01 -en 0.0005515 3 9.1e-05 -en 0.0005525 3 0.01 -ej 0.0005625 3 2 -ej 0.0016 2 1 -ej 0.00875 4 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 2 -ref-pops 0 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 4 14 14 14 1 --ms-num-diploid-inds 21 -msarc 3 -msarcjt 0.00875 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/papuan/noadmix/
#mv **/sStar* .
#head -1 sStar_simulation_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > papuan_sStar_noadmix.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^2/, "papuan_noadmix", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> papuan_sStar_noadmix.txt

#Growth - Papuan - Admixture 6% - variable - 50 Kya admixture - split 700KYA - migration - bottleneck
#cd $DATA/ancient/chapter4/simulations/growth/variable/papuan/admix6/${chr}
#/data/cindy/Tools/macs/macs 42 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 3 14 14 14 -m 1 2 160 -m 2 1 160 -g 1 3704.88 -g 2 71464.5 -g 3 53647 -n 3 0.25 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -eg 6e-05 3 0 -es 0.0005 3 0.94 -en 0.00051 4 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -en 0.0005515 3 7.14286e-05 -en 0.0005525 3 0.01 -ej 0.0005625 3 2 -ej 0.0016 2 1 -ej 0.00875 4 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 2 -ref-pops 0 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 3 14 14 14 --ms-num-diploid-inds 21 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/papuan/admix6/
#mv **/sStar* .
#head -1 sStar_simulation_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > papuan_sStar_admix6.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^2/, "papuan_admix6", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> papuan_sStar_admix6.txt

#Growth - Admixture 4% - variable - 35Kya admixture - African farmers as europeans, split 700KYA - no migration, no bottleneck
#cd $DATA/ancient/chapter4/simulations/growth/variable/euroFarm/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.0004375 1 0.96 -en 0.00043751 3 0.01 -ej 0.0016 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 1 -ref-pops 0 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix4.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/euroFarm/
#mv **/sStar* .
#head -1 sStar_simulation_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > euroFarm_sStar_admix4.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "euroFarmer_admix4", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> euroFarm_sStar_admix4.txt

#Growth - Admixture 2% - variable - 35kya admixture - 1Mya split
#cd $DATA/ancient/chapter4/simulations/growth/variable/1Mya/35admix/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.0004375 1 0.98 -en 0.001251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.0125 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix2.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/1Mya/35admix/
#mv **/sStar_* .
#head -1 sStar_simulation_chr1_admix2.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > sStar_35k_1M.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "1M_35k_admix2", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' -  >> sStar_35k_1M.txt

#Growth - Admixture 2% - variable - 100kya admixture - 1Mya split
#cd $DATA/ancient/chapter4/simulations/growth/variable/1Mya/100admix/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.00125 1 0.98 -en 0.001251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.0125 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix2.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/1Mya/100admix/
#mv **/sStar_* .
#head -1 sStar_simulation_chr1_admix2.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > sStar_100k_1M.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "1M_100k_admix2", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' -  >> sStar_100k_1M.txt

#Growth - Admixture 2% - variable - 35kya admixture - 350kya split
#cd $DATA/ancient/chapter4/simulations/growth/variable/35K_admix/admix2/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.0004375 1 0.98 -en 0.001251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.004375 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix2.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/35K_admix/admix2/
#mv **/sStar_* .
#head -1 sStar_simulation_chr1_admix2.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > sStar_35k_admix2.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "350sp_35k_admix2", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' -  >> sStar_35k_admix2.txt

#Growth - Admixture 4% - variable - 35kya admixture - 350kya split
#cd $DATA/ancient/chapter4/simulations/growth/variable/35K_admix/admix4/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.0004375 1 0.96 -en 0.001251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.004375 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix2.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/35K_admix/admix4/
#mv **/sStar_* .
#head -1 sStar_simulation_chr1_admix2.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > sStar_35k_admix4.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "350sp_35k_admix4", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' -  >> sStar_35k_admix4.txt

#Growth - Admixture 2% - variable - 100kya admixture - 350kya split
#cd $DATA/ancient/chapter4/simulations/growth/variable/350_split/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.00125 1 0.98 -en 0.001251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.004375 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix2.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/350_split/
#mv **/sStar_* .
#head -1 sStar_simulation_chr1_admix2.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > 350split_sStar_100k.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "350split_100k_admix", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' -  >> 350split_sStar_100k.txt

#Growth - Admixture 2% - variable - 100kya admixture - 700KYA split
#cd $DATA/ancient/chapter4/simulations/growth/variable/older/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.00125 1 0.98 -en 0.001251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix2.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/older/
#mv **/ms_* .
#head -1 sStar_simulation_chr1_admix2.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > var_sStar_admix2.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "older_var_admix2", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' -  >> var_sStar_admix2.txt



#Original Simulations for Poster
#No admixture - MaCS wgs - constant - Growth
#cd $DATA/ancient/chapter4/simulations/growth/constant/wgs/${chr}
#/data/cindy/Tools/macs/macs 29 ${size} -t 0.03764 -r 0.07528 -I 3 14 14 1 -m 1 2 160 -m 2 1 160 -g 1 4303.9 -g 2 41228 -eg 0.00107 1 0. -eg 0.0001117 2 0. -en 0.000775 2 9.1e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/To$
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 3 14 14 1 --ms-num-diploid-inds 14 -msarc 2 -msarcjt 0.00875 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt



#No admixture - MaCS wgs - variable - Growth
cd $DATA/ancient/chapter4/simulations/growth/variable/no_admix/
#/data/cindy/Tools/macs/macs 29 ${size} -t 0.03764 -r 0.07528 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt  -I 3 14 14 1 -m 1 2 160 -m 2 1 160 -g 1 4303.9 -g 2 41228 -eg 0.00107 1 0. -eg 0.0001117 2 0. -en 0.000775 2 9.1e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 3 14 14 1 --ms-num-diploid-inds 14 -msarc 2 -msarcjt 0.00875 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt

#Growth - Admixture 2% - variable
#cd $DATA/ancient/chapter4/simulations/growth/variable/older/${chr}
#ADMIXTURE 2% - Growth, archaic, split 700KYA
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.0004025 1 0.98 -en 0.00040251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix2.txt
#cd $DATA/ancient/chapter4/simulations/growth/variable/older/
#mv **/ms_* .
#head -1 sStar_simulation_chr1_admix2.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > var_sStar_admix2.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "subset_admix2", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' -  >> var_sStar_admix2.txt

#Growth - Admixture 4% - variable
#cd $DATA/ancient/chapter4/simulations/growth/variable/admix4/${chr}
#ADMIXTURE 4% - Growth, archaic, split 700KYA
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 160 -g 1 3704.88 -g 2 71464.5 -eg 0.001243 1 0 -eg 6.444e-05 2 0 -es 0.0004025 1 0.96 -en 0.00040251 3 0.01 -en 0.000775 2 7.14286e-05 -en 0.000785 2 0.01 -ej 0.0016 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_${chr}_admix4.txt
#head -1 sStar_simulation_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > var_sStar_admix4.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "subset_admix4", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> var_sStar_admix4.txt

#Structure - No admixture - constant
#cd $DATA/ancient/chapter4/simulations/structure/constant/no_admix/${chr}
#/data/cindy/Tools/macs/macs 29 ${size} -t 0.03764 -r 0.07528 -I 3 14 14 1 -n 1 0.0058 -n 2 0.0119 -n 3 0.0067 -m 1 2 36.4 -m 2 1 360 -eM 0.00052775 0 -en 0.001671 1 0.0205 -en 0.00238125 1 0.0067 -en 0.008751 1 0.0067 -ej 0.00167 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 3 14 14 1 --ms-num-diploid-inds 14 -msarc 2 -msarcjt 0.00875 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt

#Structure - Admixture 2% - constant
#cd $DATA/ancient/chapter4/simulations/structure/constant/admix2/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -I 2 14 14 -n 1 0.0058 -n 2 0.0119 -m 1 2 36.4 -m 2 1 360 -eM 0.00052775 0 -es 0.0004025 1 0.98 -en 0.00040251 3 0.0067 -en 0.001671 1 0.0205 -en 0.00238125 1 0.0067 -en 0.008751 1 0.0067 -ej 0.00167 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/structure/constant/admix2/
#mv **/sStar* .
#head -1 sStar_simulation_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > struc_con_admix2.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "struc_con_admix2", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> struc_con_admix2.txt

#Structure - Admixture 4% - constant
#cd $DATA/ancient/chapter4/simulations/structure/constant/admix4/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -I 2 14 14 -n 1 0.0058 -n 2 0.0119 -m 1 2 36.4 -m 2 1 360 -eM 0.00052775 0 -es 0.0004025 1 0.96 -en 0.00040251 3 0.0067 -en 0.001671 1 0.0205 -en 0.00238125 1 0.0067 -en 0.008751 1 0.0067 -ej 0.00167 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/structure/constant/admix4/
#mv **/sStar* .
#head -1 sStar_simulation_wgs_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > struc_con_admix4.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "struc_con_admix4", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> struc_con_admix4.txt

#Structure - No admixture - variable
#cd $DATA/ancient/chapter4/simulations/structure/variable/no_admix/${chr}
#/data/cindy/Tools/macs/macs 29 ${size} -t 0.03764 -r 0.07528 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 3 14 14 1 -n 1 0.0058 -n 2 0.0119 -n 3 0.0067 -m 1 2 36.4 -m 2 1 360 -eM 0.00052775 0 -en 0.001671 1 0.0205 -en 0.00238125 1 0.0067 -en 0.008751 1 0.0067 -ej 0.00167 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 3 14 14 1 --ms-num-diploid-inds 14 -msarc 2 -msarcjt 0.00875 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/structure/variable/no_admix/
#mv **/sStar* .
#head -1 sStar_simulation_wgs_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > struc_var_noadmix.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "struc_var_noadmix", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> struc_var_noadmix.txt

#Structure - Admixture 2% - variable
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix2/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 -n 1 0.0058 -n 2 0.0119 -m 1 2 36.4 -m 2 1 360 -eM 0.00052775 0 -es 0.0004025 1 0.98 -en 0.00040251 3 0.0067 -en 0.001671 1 0.0205 -en 0.00238125 1 0.0067 -en 0.008751 1 0.0067 -ej 0.00167 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix2/
#mv **/sStar* .
#head -1 sStar_simulation_wgs_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > struc_var_admix2.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "struc_var_admix2", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> struc_var_admix2.txt

#Structure - Admixture 4% - variable
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix4/${chr}
#/data/cindy/Tools/macs/macs 28 ${size} -t 0.03584 -r 0.07168 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 14 14 -n 1 0.0058 -n 2 0.0119 -m 1 2 36.4 -m 2 1 360 -eM 0.00052775 0 -es 0.0004025 1 0.96 -en 0.00040251 3 0.0067 -en 0.001671 1 0.0205 -en 0.00238125 1 0.0067 -en 0.008751 1 0.0067 -ej 0.00167 2 1 -ej 0.00875 3 1 2>trees_${chr}.txt | /data/cindy/Tools/macs/msformatter > ms_${chr}_wgs.txt
#cat ms_${chr}_wgs.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 14 14 --ms-num-diploid-inds 14 --ms-simulated-region-length ${size} -o sStar_simulation_wgs_${chr}.txt
#cd $DATA/ancient/chapter4/simulations/structure/variable/admix4/
#mv **/sStar* .
#head -1 sStar_simulation_wgs_chr1.txt | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - > struc_var_admix4.txt
#tail -n +2 -q sStar* | awk '$9 > 0 {print $0}' - | awk -F'\t' -v OFS='\t' 'NR>=1{sub(/^0/, "struc_var_admix4", $8)} 1' - | awk '{print $1"\t"$2"\t"$3"\t"$8"\t"$9}' - >> struc_var_admix4.txt



#cd $DATA/ancient/chapter4/simulations/wgs/${chr}

#$DATA/Tools/macs/macs 172 ${size} -t 0.00094 -r 0.0004 -R $DATA/ancient/chapter4/simulations/${chr}_test.txt -I 2 88 84 -m 1 2 149.2537 -m 2 1 200 -g 1 37.0488 -g 2 71.4645 -eg 0.09944 1 0 -en 0.09945 1 0.67 -eg 5.1552e-03 2 0 -es 0.0075 1 0.98 -en 0.00751 3 0.67 -em 0.195 3 1 2.99 -em 0.1945 3 1 0 -en 0.062 2 7.14286e-05 -en 0.0628 2 0.01 -ej 0.128 2 1 -ej 0.70 3 1 2>tree_${chr}_w.txt | $DATA/Tools/macs/msformatter > ms_${chr}.txt

#cat ms_${chr}.txt | python $DATA/ancient/chapter4/freezing-archer/bin/windowed_calculations.py -vcf - -ms -target-pops 0 -ref-pops 1 -p 10 -s-star -winlen 50000 -winstep 10000 --ms-pop-sizes 2 88 84 --ms-num-diploid-inds 86 --ms-simulated-region-length ${size} >> sStar_simulation_${chr}.txt

#$DATA/Tools/macs/macs 172 1000 -t 0.00094 -r 0.0004 -I 2 88 84 -m 1 2 149.2537 -m 2 1 200 -g 1 37.0488 -g 2 71.4645 -eg 0.09944 1 0 -en 0.09945 1 0.67 -eg 5.1552e-03 2 0 -es 0.0075 1 0.98 -en 0.00751 3 0.67 -em 0.195 3 1 2.99 -em 0.1945 3 1 0 -en 0.062 2 7.14286e-05 -en 0.0628 2 0.01 -ej 0.128 2 1 -ej 0.70 3 1 2>tree_${chr}.txt 1>macs_${chr}.txt

#done

#wait

