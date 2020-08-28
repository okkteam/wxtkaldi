
data=/home/oshindo/kaldi/egs/aishell/s5
data_url=www.openslr.org/resources/33

. ./cmd.sh
. ./path.sh
#local/download_and_untar.sh $data $data_url data_aishell || exit 1;
#local/download_and_untar.sh $data $data_url resource_aishell || exit 1;

# Lexicon Preparation,
#local/aishell_prepare_dict.sh $data/resource_aishell || exit 1;

# Data Preparation,
#local/aishell_data_prep.sh $data/data_aishell/wav $data/data_aishell/transcript || exit 1;

# Phone Sets, questions, L compilation
#utils/prepare_lang.sh --position-dependent-phones false data/local/dict \
#    "<SPOKEN_NOISE>" data/local/lang data/lang || exit 1;

# LM training
#local/aishell_train_lms.sh || exit 1;

# G compilation, check LG composition
#utils/format_lm.sh data/lang data/local/lm/3gram-mincount/lm_unpruned.gz \
 #   data/local/dict/lexicon.txt data/lang_test || exit 1;

# Now make MFCC plus pitch features.
# mfccdir should be some place with a largish disk where you
# want to store MFCC features.
mfccdir=mfcc
for x in train dev test; do
  steps/make_mfcc_pitch.sh --cmd "$train_cmd" --nj 3 data/$x exp/make_mfcc/$x $mfccdir || exit 1;
  steps/compute_cmvn_stats.sh data/$x exp/make_mfcc/$x $mfccdir || exit 1;
  utils/fix_data_dir.sh data/$x || exit 1;
done


