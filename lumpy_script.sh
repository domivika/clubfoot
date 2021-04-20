### 4 bam files in: III20_proc; III21_proc; IV33_proc; V14_proc

docker run -it -v /home/dominika_kresa/mounted_from_Second/nie_pacz:/work/my_data -v /home/dominika_kresa/reference/:/work/reference -v /home/dominika_kresa/mounted_from_Second/clubfoot_DK:/work smoove_ao

# III20
smoove call -x --name III20_lumpy --fasta /work/reference/hg38/Homo_sapiens_assembly38.fasta -p 8 \
--genotype /work/my_data/III20_proc/III20.sorted.deduplicated.recalibrated.bam \
--o /work/lumpy
# III21
smoove call -x --name III21_lumpy --fasta /work/reference/hg38/Homo_sapiens_assembly38.fasta -p 8 \
--genotype /work/my_data/III21_proc/III21.sorted.deduplicated.recalibrated.bam \
--o /work/lumpy
# IV33
smoove call -x --name IV33_lumpy --fasta /work/reference/hg38/Homo_sapiens_assembly38.fasta -p 8 \
--genotype /work/my_data/IV33_proc/IV33.sorted.deduplicated.recalibrated.bam \
--o /work/lumpy
# V14
smoove call -x --name V14_lumpy --fasta /work/reference/hg38/Homo_sapiens_assembly38.fasta -p 8 \
--genotype /work/my_data/V14_proc/V14.sorted.deduplicated.recalibrated.bam \
--o /work/lumpy


#docker -> server
docker cp smoove_ao:/work/lumpy/GC086423_lumpy-smoove.genotyped.vcf.gz /home/dominika_kresa/mounted_from_Second/lumpy

#unzip file: GC086423_lumpy-smoove.genotyped.vcf.gz -> GC086423_lumpy-smoove.genotyped.vcf
gunzip /home/dominika_kresa/mounted_from_Second/lumpy/GC086423_lumpy-smoove.genotyped.vcf.gz

#vcf -> bed
awk '
BEGIN{FS="\t"; OFS="\t";
print "contig\tstart\tend\tstrand\ttype"} $0~/^#/ {next};\
{split($8,a,";"); split (a[1],b,"="); split (a[2],c,"=")}
{match($8,/END\=([0-9]*);/, E); match($8,/SVTYPE\=([A-Z]{3});/, SVT)}
{print $1"\t"$2"\t"E[1]"\t"".""\t"SVT[1]}' /home/dominika_kresa/mounted_from_Second/lumpy/GC086423_lumpy-smoove.genotyped.vcf > /home/dominika_kresa/mounted_from_Second/lumpy/GC086423_lumpy-smoove.genotyped.bed

#remove lines with empty fields
awk  '$3!="."' /home/dominika_kresa/mounted_from_Second/lumpy/GC086423_lumpy-smoove.genotyped.bed > /home/dominika_kresa/mounted_from_Second/GC086423_lumpy.bed
