RESULT_DIR="mp_dp_gpt_result"

if [ ! -d $RESULT_DIR ]; then
  mkdir $RESULT_DIR
fi

num=2

python3 benchmark.py --suite gpt.intra_search_auto --num-hosts 1 --num-devices-per-host ${num} --shard-only | tee ${RESULT_DIR}/result_${num}.txt
python3 benchmark.py --suite gpt.intra_search_auto --num-hosts 1 --num-devices-per-host ${num} --use-remat --shard-only | tee ${RESULT_DIR}/result_${num}_remat.txt

RESULT_DIR="mp_dp_wresnet_result"

if [ ! -d $RESULT_DIR ]; then
  mkdir $RESULT_DIR
fi

python3 benchmark.py --suite wresnet.intra_search_auto --num-hosts 1 --num-devices-per-host ${num} --shard-only | tee ${RESULT_DIR}/result_${num}.txt
python3 benchmark.py --suite wresnet.intra_search_auto --num-hosts 1 --num-devices-per-host ${num} --use-remat --shard-only | tee ${RESULT_DIR}/result_${num}_remat.txt
