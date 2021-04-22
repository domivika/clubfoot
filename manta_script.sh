mkdir /work/manta
mkdir /work/manta/III20
mkdir /work/manta/III21
mkdir /work/manta/IV33
mkdir /work/manta/V14
configManta.py --bam /work/my_data/III20_proc/III20.sorted.deduplicated.recalibrated.bam --referenceFasta /work/reference/hg38/Homo_sapiens_assembly38.fasta --runDir /work/manta/III20
configManta.py --bam /work/my_data/III21_proc/III21.sorted.deduplicated.recalibrated.bam --referenceFasta /work/reference/hg38/Homo_sapiens_assembly38.fasta --runDir /work/manta/III21
configManta.py --bam /work/my_data/IV33_proc/IV33.sorted.deduplicated.recalibrated.bam --referenceFasta /work/reference/hg38/Homo_sapiens_assembly38.fasta --runDir /work/manta/IV33
configManta.py --bam /work/my_data/V14_proc/V14.sorted.deduplicated.recalibrated.bam --referenceFasta /work/reference/hg38/Homo_sapiens_assembly38.fasta --runDir /work/manta/V14

python /work/manta/III20/runWorkflow.py -m local
python /work/manta/III21/runWorkflow.py -m local
python /work/manta/IV33/runWorkflow.py -m local
python /work/manta/V14/runWorkflow.py -m local


#change directory name
mv ~/mounted_from_Second/GC086423_manta ~/mounted_from_Second/manta

#unzip file: diploidSV.vcf.gz -> diploidSV.vcf
gunzip /home/dominika_kresa/mounted_from_Second/manta/results/variants/diploidSV.vcf.gz

#PASS VCF
awk 'BEGIN{FS="\t"} $0 ~ /^#/ || $7 == "PASS"{print}' /home/dominika_kresa/mounted_from_Second/manta/results/variants/diploidSV.vcf > /home/dominika_kresa/mounted_from_Second/manta/results/variants/diploidSV_PASS.vcf
