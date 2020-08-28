. ./path.sh

nj=3
fbankdir=fbank
train_cmd='run.pl'

aishell=/home/oshindo/kaldi/egs/aishell/s5/data

for x in train dev test; do
    #steps/make_fbank.sh --cmd "$train_cmd" --nj $nj data/$x exp/make_fbank/$x $fbankdir
    #steps/compute_cmvn_stats.sh data/$x exp/make_fbank/$x $fbankdir
    #apply-cmvn --utt2spk=ark:data/$x/utt2spk scp:data/$x/cmvn.scp scp:data/$x/feats.scp ark:data/$x/cmvn-feats.ark
   # add-deltas --delta-order=2 ark:data/fbank/$x/cmvn-feats.ark ark:data/fbank/$x/delta-feats.ark  
    copy-feats ark:data/$x/cmvn-feats.ark ark,scp:$aishell/$x/feats.ark,$aishell/$x/feats.scp
done
