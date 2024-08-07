#!/bin/bash
set -e

pip install .

./Pangolin/scripts/install_prerequisites.sh recommended
mkdir Pangolin/build && cd Pangolin/build
cmake ..
make -j8
sudo make install
cd ../..

./cmake-3.30.2-linux-x86_64.sh --skip-license --prefix=/usr/local
update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 1 --force

pip install ./DPViewer
ldconfig