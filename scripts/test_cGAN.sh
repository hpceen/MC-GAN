#!/bin/bash -f

#=====================================
# MC-GAN
# Train and Test conditional GAN Glyph network
# By Samaneh Azadi
#=====================================


#=====================================
## Set Parameters
#=====================================

DATA=$1
DATASET="./datasets/${DATA}"
experiment_dir="GlyphNet_pretrain_ru_small_symbols"
MODEL=cGAN
MODEL_G=resnet_6blocks
MODEL_D=n_layers
n_layers_D=1
NORM=batch
IN_NC=32
O_NC=32
GRP=32
PRENET=2_layers
FINESIZE=64
LOADSIZE=64
LAM_A=100
NITER=500
NITERD=100
BATCHSIZE=150
EPOCH=latest #test at which epoch?
CUDA_ID=0

if [ ! -d "./checkpoints/${experiment_dir}" ]; then
	mkdir -p "./checkpoints/${experiment_dir}"
fi
LOG="./checkpoints/${experiment_dir}/test.txt"
if [ -f $LOG ]; then
	rm $LOG
fi
exec &> >(tee -a "$LOG")


# =======================================
## Test Glyph Network on font dataset
# =======================================
python2.7 test.py --dataroot ${DATASET} --name "${experiment_dir}" \
							 	--model ${MODEL} --which_model_netG ${MODEL_G} --which_model_netD ${MODEL_D} --n_layers_D ${n_layers_D} --which_model_preNet ${PRENET} \
							 	--norm ${NORM} --input_nc ${IN_NC} --output_nc ${O_NC} --grps ${GRP}  --loadSize ${FINESIZE} --fineSize ${LOADSIZE} --display_id 0 --batchSize 1 --conditional \
							 	--which_epoch ${EPOCH} --blanks 0.75 --conv3d --align_data --gpu_ids ' '