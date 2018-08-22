Link to fork - https://github.com/HeartsBRL/ros_people_object_detection_tensorflow

# For Python 2.7.9

mkdir ~/src

mkdir ~/.localpython

cd ~/src

wget http://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz

tar -zxvf Python-2.7.9.tgz

cd Python-2.7.9

make clean

./configure --prefix=/home/${USER}/.localpython --enable-unicode=ucs4

make

make install

# For VirtualEnv (Globally installed)

sudo apt-get install python-virtualenv

mkdir ~/virtualenvs

virtualenv NameOfVirtualEnv --python=/home/${USER}/.localpython/bin/python2.7

source NameOfVirtualEnv/bin/activate

pip install --upgrade pip

pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.10.0-cp27-none-linux_x86_64.whl


# Tenserflow 1.10 using pip install inside virtual environment
- Pip install empy 
- Pip install other dependencies 
- Different pre-trained tensorflow models available at https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md - 
- put those models into src/object_detection/, lastly set the model_name parameter of launch/cob_people_object_detection_tensoflow_params.yaml
