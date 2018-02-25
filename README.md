Snort++ build quick start (inside the container) with unit test support:
```
cd $HOME
git clone https://github.com/cpputest/cpputest.git
cd cpputest
mkdir obj
cd obj
cmake -DC++11=ON -DCMAKE_INSTALL_PREFIX=$HOME/install/cpputest ..
make -j$(nproc) install

cd $HOME
curl -LO https://snort.org/downloads/snortplus/daq-2.2.2.tar.gz
tar xf daq-2.2.2.tar.gz
cd daq-2.2.2
./configure
make install
ldconfig

cd $HOME
git clone https://github.com/snortadmin/snort3.git
cd snort3
PKG_CONFIG_PATH=$HOME/install/cpputest/lib/pkgconfig ./configure_cmake.sh --prefix=$HOME/install/snort3 --enable-unit-tests
cd build
make -j$(nproc) install
make check

$HOME/install/snort3/bin/snort -V
$HOME/install/snort3/bin/snort --catch-test all
```
