#!/bin/bash -e

OPENCV_VERSION="4.1.0"

curl -L -o /opt/opencv.tar.gz "https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.tar.gz"
mkdir /opt/opencv/
tar -xf /opt/opencv.tar.gz -C /opt/opencv/
rm /opt/opencv.tar.gz

CV_DIR="/opt/opencv/opencv-${OPENCV_VERSION}"

mkdir -p "${CV_DIR}/build"

cmake -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX="${ROOTFS_DIR}/usr/local" \
    -D CMAKE_TOOLCHAIN_FILE="${CV_DIR}/platforms/linux/arm-gnueabi.toolchain.cmake" \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D PYTHON3_INCLUDE_PATH=/usr/include/python3.7m \
    -D PYTHON3_LIBRARIES=/usr/lib/arm-linux-gnueabihf/libpython3.7m.so \
    -D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/lib/python3/dist-packages/numpy/core/include \
    -D BUILD_opencv_python3=ON \
    -D PYTHON3_CVPY_SUFFIX='.cpython-37m-arm-linux-gnueabihf.so' \
    -D ENABLE_NEON=ON \
    -D ENABLE_VFPV3=ON \
    -D WITH_GTK=OFF \
    -D BUILD_DOCS=OFF \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -B "${CV_DIR}/build/" \
    -S "${CV_DIR}"

make -j$(nproc) -C "${CV_DIR}/build/"
if [ ! -f "files/opencv*.deb" ]; then
    checkinstall -D --install=no --pkgname "opencv" --pkgversion "$OPENCV_VERSION" --pkgsource "${CV_DIR}/build/" --pakdir "files/"
fi
dpkg -i files/opencv*.deb
# make install/strip -C "${CV_DIR}/build/"
