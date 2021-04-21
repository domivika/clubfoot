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

#unzip files
gunzip /home/dominika_kresa/mounted_from_Second/clubfoot_DK/lumpy/III20_lumpy-smoove.genotyped.vcf.gz
gunzip /home/dominika_kresa/mounted_from_Second/clubfoot_DK/lumpy/lumpy/III21_lumpy-smoove.genotyped.vcf.gz
gunzip /home/dominika_kresa/mounted_from_Second/clubfoot_DK/lumpy/IV33_lumpy-smoove.genotyped.vcf.gz
gunzip /home/dominika_kresa/mounted_from_Second/clubfoot_DK/lumpy/V14_lumpy-smoove.genotyped.vcf.gz
