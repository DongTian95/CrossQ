#!/bin/bash

# 4 # CrossQ Ablations #############
# Fig 16
timesteps=1000000
q_bias=0

# TODO
for env in \
  "metaworld/assembly-v2" \
  "metaworld/basketball-v2" \
  "metaworld/bin-picking-v2" \
  "metaworld/box-close-v2" \
  "metaworld/button-press-topdown-v2" \
  "metaworld/button-press-topdown-wall-v2" \
  "metaworld/button-press-v2" \
  "metaworld/button-press-wall-v2" \
  "metaworld/coffee-button-v2" \
  "metaworld/coffee-pull-v2" \
  "metaworld/coffee-push-v2" \
  "metaworld/dial-turn-v2" \
  "metaworld/disassemble-v2" \
  "metaworld/door-close-v2" \
  "metaworld/door-lock-v2" \
  "metaworld/door-open-v2" \
  "metaworld/door-unlock-v2" \
  "metaworld/drawer-close-v2" \
  "metaworld/drawer-open-v2" \
  "metaworld/faucet-open-v2" \
  "metaworld/faucet-close-v2" \
  "metaworld/hammer-v2" \
  "metaworld/hand-insert-v2" \
  "metaworld/handle-press-side-v2" \
  "metaworld/handle-press-v2" \
  "metaworld/handle-pull-side-v2" \
  "metaworld/handle-pull-v2" \
  "metaworld/lever-pull-v2" \
  "metaworld/peg-insert-side-v2" \
  "metaworld/pick-place-wall-v2" \
  "metaworld/pick-out-of-hole-v2" \
  "metaworld/reach-v2" \
  "metaworld/push-back-v2" \
  "metaworld/push-v2" \
  "metaworld/pick-place-v2" \
  "metaworld/plate-slide-v2" \
  "metaworld/plate-slide-side-v2" \
  "metaworld/plate-slide-back-v2" \
  "metaworld/plate-slide-back-side-v2" \
  "metaworld/peg-unplug-side-v2" \
  "metaworld/soccer-v2" \
  "metaworld/stick-push-v2" \
  "metaworld/stick-pull-v2" \
  "metaworld/push-wall-v2" \
  "metaworld/reach-wall-v2" \
  "metaworld/shelf-place-v2" \
  "metaworld/sweep-into-v2" \
  "metaworld/sweep-v2" \
  "metaworld/window-open-v2" \
  "metaworld/window-close-v2"
do
    ALGO='sac' ENV=$env ACT='relu' LR='0.001' UTD='1' PI_DELAY='3' B1='0.5' XQ_STYLE=1 BN=1 LN=0 N_NEURONS=256  N_CRITICS=2 BN_MODE='brn_actor' BN_MOM='0.99' EVAL_QBIAS=$q_bias STEPS=$timesteps sbatch slurm_experiment_multi.sh;  # small
done