#/bin/bash

# Author 2020 wxt
# Transform dim=13 raw mfcc feats to dim=39 Final mfcc feats. More details see kaldi I/O mechanisms

. ./path.sh
aishell=/home/oshindo/kaldi/egs/aishell/s5
cd data

for x in train dev test; do
  rm $x/feats.ark $x/cmvn-feats.ark
  echo "processing $x data"
  apply-cmvn --utt2spk=ark:$x/utt2spk scp:$x/cmvn.scp scp:$x/feats.scp ark:$x/cmvn-feats.ark 
#  add-deltas ark:$x/cmvn-feats.ark ark:$x/feats.ark
#  copy-feats ark:$x/feats.ark ark,scp:$thchs30/$x/feats.ark,$thchs30/$x/feats.scp
done
