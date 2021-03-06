# Driver

## headers

sudo apt-get install linux-headers-$(uname -r)

git clone https://github.com/intel/linux-sgx-driver.git
cd linux-sgx-driver
make
sudo mkdir -p "/lib/modules/"`uname -r`"/kernel/drivers/intel/sgx" 
sudo cp isgx.ko "/lib/modules/"`uname -r`"/kernel/drivers/intel/sgx" 
sudo sh -c "cat /etc/modules | grep -Fxq isgx || echo isgx >> /etc/modules" 
sudo /sbin/depmod
sudo /sbin/modprobe isgx
cd ..
# Verify installation
lsmod | grep sgx

# dependencies for SDK
sudo apt-get install build-essential ocaml ocamlbuild automake autoconf libtool wget python-is-python3 libssl-dev git cmake perl -y

sudo apt-get install libssl-dev libcurl4-openssl-dev protobuf-compiler libprotobuf-dev debhelper cmake reprepro unzip -y

git clone https://github.com/intel/linux-sgx.git

cd linux-sgx && make preparation

sudo cp external/toolset/ubuntu20.04/{as,ld,ld.gold,objdump} /usr/local/bin

make sdk DEBUG=1

make sdk_install_pkg DEBUG=1

####################
# INSTALL SDK HERE #
####################
sudo apt-get install build-essential python -y

cd linux/installer/bin

sudo ./sgx_linux_x64_sdk_2.*.bin 

# no
# /opt/intel
cd ../../..
source /opt/intel/sgxsdk/environment

# PSW
make psw DEBUG=1

# Architecture Enclaves
cd psw/ae/le
make

cd ../../..

make deb_psw_pkg DEBUG=1

make deb_local_repo
cd ..
# Please change the path of home accordingly
# This may not work in docker because the local deb repo may not be /root
sudo sh -c 'echo "deb [trusted=yes arch=amd64] file:/home/ya0guang/linux-sgx/linux/installer/deb/sgx_debian_local_repo focal main" >> /etc/apt/sources.list'

sudo apt update

sudo apt-get install libsgx-epid libsgx-urts

# OPTIONAL

# sudo apt-get install libsgx-launch libsgx-urts
# sudo apt-get install libsgx-quote-ex libsgx-urts
# sudo apt-get install libsgx-dcap-ql

# Graphene-SGX: https://graphene.readthedocs.io/en/latest/building.html

# Install the Linux kernel patched with FSGSBASE
# or
# Install the Graphene FSGSBASE driver

# 1. Clone the repository and set the home directory of Graphene:

pip3 install toml

git clone https://github.com/oscarlab/graphene.git
cd graphene
export GRAPHENE_DIR=$PWD

# 2 Prepare a signing key:

cd $GRAPHENE_DIR/Pal/src/host/Linux-SGX/signer
openssl genrsa -3 -out enclave-key.pem 3072

# 3 Dep and build
# may add env var
export ISGX_DRIVER_PATH=/root/linux-sgx-driver/
 sudo apt-get install -y \
   build-essential autoconf gawk bison libcurl4-openssl-dev \
   python3-protobuf libprotobuf-c-dev protobuf-c-compiler
cd $GRAPHENE_DIR
make SGX=1
# or we can use the following line...
# ISGX_DRIVER_PATH=/root/linux-sgx-driver/ make SGX=1
