qsub -I -l select=1:ncpus=16:mem=20gb:ngpus=1:gpu_model=k40,walltime=72:00:00
module purge
module load cuda/10.2.89-gcc/8.3.1 cudnn/8.0.0.180-10.2-linux-x64-gcc/8.3.1 anaconda3/2019.10-gcc/8.3.1
module load git/2.27.0-gcc/8.3.1
source activate tf22_py38
