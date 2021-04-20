### 4 bam files in: III20_proc; III21_proc; IV33_proc; V14_proc

### CNVnator
# Docker
docker run -it -v /home/dominika_kresa/mounted_from_Second/nie_pacz:/work/my_data -v /home/dominika_kresa/reference/:/work/reference -v /home/dominika_kresa/mounted_from_Second/clubfoot_DK:/work cnvnator
bash cnvnator_script.sh

### Lumpy
# Docker
docker run -it -v /home/dominika_kresa/mounted_from_Second/nie_pacz:/work/my_data -v /home/dominika_kresa/reference/:/work/reference -v /home/dominika_kresa/mounted_from_Second/clubfoot_DK:/work smoove_ao
bash lumpy_script.sh

### Manta
# Docker
docker run -it -v /home/dominika_kresa/mounted_from_Second/nie_pacz:/work/my_data -v /home/dominika_kresa/reference/:/work/reference -v /home/dominika_kresa/mounted_from_Second/clubfoot_DK:/work smoove_ao
bash manta_script.sh
