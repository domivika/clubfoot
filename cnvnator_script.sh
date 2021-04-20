### 4 bam files in: III20_proc; III21_proc; IV33_proc; V14_proc

## Docker
docker run -it -v /home/dominika_kresa/mounted_from_Second/nie_pacz:/work/my_data -v /home/dominika_kresa/reference/:/work/reference -v /home/dominika_kresa/mounted_from_Second/clubfoot_DK:/work cnvnator

## BAM -> VCF
# Extract read mapping 
cnvnator -root cnv_III20.root -tree /work/my_data/III20_proc/III20.sorted.deduplicated.recalibrated.bam -chrom $(seq 1 22) X Y
cnvnator -root cnv_III21.root -tree /work/my_data/III21_proc/III21.sorted.deduplicated.recalibrated.bam -chrom $(seq 1 22) X Y
cnvnator -root cnv_IV33.root -tree /work/my_data/IV33_proc/IV33.sorted.deduplicated.recalibrated.bam -chrom $(seq 1 22) X Y
cnvnator -root cnv_V14.root -tree /work/my_data/V14_proc/V14.sorted.deduplicated.recalibrated.bam -chrom $(seq 1 22) X Y

# Generate histogram
cnvnator -root cnv_III20.root -his 1000 -d /work/reference/hg38
cnvnator -root cnv_III21.root -his 1000 -d /work/reference/hg38
cnvnator -root cnv_IV33.root -his 1000 -d /work/reference/hg38
cnvnator -root cnv_V14.root -his 1000 -d /work/reference/hg38

# Calculate statistics
cnvnator -root cnv_III20.root -stat 1000
cnvnator -root cnv_III21.root -stat 1000
cnvnator -root cnv_IV33.root -stat 1000
cnvnator -root cnv_V14.root -stat 1000

# Partition
cnvnator -root cnv_III20.root -partition 1000
cnvnator -root cnv_III21.root -partition 1000
cnvnator -root cnv_IV33.root -partition 1000
cnvnator -root cnv_V14.root -partition 1000

# Call CNVs
cnvnator -root /work/cnv_III20.root -call 1000 > /work/III20_cnvnator.out
cnvnator -root /work/cnv_III21.root -call 1000 > /work/III21_cnvnator.out
cnvnator -root /work/cnv_IV33.root -call 1000 > /work/IV33_cnvnator.out
cnvnator -root /work/cnv_V14.root -call 1000 > /work/V14_cnvnator.out


#Exporting CNV calls as VCFs
cnvnator2VCF.pl -prefix III20_cnvnator -reference hg38 /work/III20_cnvnator.out /work/reference/hg38 > /work/III20_cnvnator.vcf
cnvnator2VCF.pl -prefix III21_cnvnator -reference hg38 /work/III20_cnvnator.out /work/reference/hg38 > /work/III21_cnvnator.vcf
cnvnator2VCF.pl -prefix IV33_cnvnator -reference hg38 /work/IV33_cnvnator.out /work/reference/hg38 > /work/IV33_cnvnator.vcf
cnvnator2VCF.pl -prefix V14_cnvnator -reference hg38 /work/V14_cnvnator.out /work/reference/hg38 > /work/V14_cnvnator.vcf


#PASS VCF
awk 'BEGIN{FS="\t"} $0 ~ /^#/ || $7 == "PASS"{print}' /home/dominika_kresa/mounted_from_Second/clubfoot_DK/cnvnator/III20_cnvnator.vcf > /home/dominika_kresa/mounted_from_Second/clubfoot_DK/cnvnator/III20_cnvnator_PASS.vcf
awk 'BEGIN{FS="\t"} $0 ~ /^#/ || $7 == "PASS"{print}' /home/dominika_kresa/mounted_from_Second/clubfoot_DK/cnvnator/III21_cnvnator.vcf > /home/dominika_kresa/mounted_from_Second/clubfoot_DK/cnvnator/III21_cnvnator_PASS.vcf
awk 'BEGIN{FS="\t"} $0 ~ /^#/ || $7 == "PASS"{print}' /home/dominika_kresa/mounted_from_Second/clubfoot_DK/cnvnator/IV33_cnvnator.vcf > /home/dominika_kresa/mounted_from_Second/clubfoot_DK/cnvnator/IV33_cnvnator_PASS.vcf
awk 'BEGIN{FS="\t"} $0 ~ /^#/ || $7 == "PASS"{print}' /home/dominika_kresa/mounted_from_Second/clubfoot_DK/cnvnator/V14_cnvnator.vcf > /home/dominika_kresa/mounted_from_Second/clubfoot_DK/cnvnator/V14_cnvnator_PASS.vcf
