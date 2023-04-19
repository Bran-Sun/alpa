RESULT_DIR="gpt_result"

if [ ! -d $RESULT_DIR ]; then
  mkdir $RESULT_DIR
fi

num=8
hostnum=$(expr $num / 8)

python3 benchmark.py --suite gpt.grid_search_auto --num-hosts $hostnum --num-devices-per-host 8 | tee ${RESULT_DIR}/result_${num}.txt
python3 benchmark.py --suite gpt.grid_search_auto --num-hosts $hostnum --num-devices-per-host 8 --use-remat | tee ${RESULT_DIR}/result_${num}_remat.txt

RESULT_DIR="wresnet_result"

if [ ! -d $RESULT_DIR ]; then
  mkdir $RESULT_DIR
fi

python3 benchmark.py --suite wresnet.grid_search_auto --num-hosts $hostnum --num-devices-per-host 8 | tee ${RESULT_DIR}/result_${num}.txt
python3 benchmark.py --suite wresnet.grid_search_auto --num-hosts $hostnum --num-devices-per-host 8 --use-remat | tee ${RESULT_DIR}/result_${num}_remat.txt
