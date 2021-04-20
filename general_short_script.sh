### CNVnator
# Docker
docker run -it -v /home/dominika_kresa/mounted_from_Second/nie_pacz:/work/my_data -v /home/dominika_kresa/reference/:/work/reference -v /home/dominika_kresa/mounted_from_Second/clubfoot_DK:/work cnvnator
bash cnvnator_script.sh

### Lumpy
# Docker
docker run -it -v /home/dominika_kresa/mounted_from_Second/nie_pacz:/work/my_data -v /home/dominika_kresa/reference/:/work/reference -v /home/dominika_kresa/mounted_from_Second/clubfoot_DK:/work smoove_ao
bash lumpy_script.sh
