qsub -I -l select=1:ncpus=16:mem=20gb:ngpus=1:gpu_model=k40,walltime=72:00:00
module purge
module load cuda/10.2.89-gcc/8.3.1 cudnn/8.0.0.180-10.2-linux-x64-gcc/8.3.1 anaconda3/2019.10-gcc/8.3.1
conda create -n py38 python=3.8.3
source activate py38
conda install -c anaconda tensorflow-gpu=2.2.0
conda install pandas
conda install keras
conda install scikit-learn
conda install matplotlib
conda install gxx_linux-64 gcc_linux-64 swig
curl https://raw.githubusercontent.com/automl/auto-sklearn/master/requirements.txt | xargs -n 1 -L 1 pip install
pip install auto-sklearn --user

conda install jupyter
python -m ipykernel install --user --name yuxinc --display-name "py38"
cd 
nano .jhubrc
paste module load cuda/10.2.89-gcc/8.3.1 cudnn/8.0.0.180-10.2-linux-x64-gcc/8.3.1 anaconda3/2019.10-gcc/8.3.1
Ctrl+X
Y
Enter