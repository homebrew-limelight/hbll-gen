#!/bin/bash -e

OPENCV_VERSION="4.1.0"

curl -L -o /opt/opencv.tar.gz "https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.tar.gz"
mkdir /opt/opencv/
tar -xf /opt/opencv.tar.gz -C /opt/opencv/
rm /opt/opencv.tar.gz

CV_DIR="/opt/opencv/opencv-${OPENCV_VERSION}"

mkdir -p "${CV_DIR}/build"
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX="/usr/local" \
    -D CMAKE_TOOLCHAIN_FILE="${CV_DIR}/platforms/linux/arm-gnueabi.toolchain.cmake" \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D PYTHON3_INCLUDE_PATH=/usr/include/python3.7m \
    -D PYTHON3_LIBRARIES=/usr/lib/arm-linux-gnueabihf/libpython3.7m.so \
    -D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/lib/python3/dist-packages/numpy/core/include \
    -D BUILD_OPENCV_PYTHON2=OFF \
    -D BUILD_OPENCV_PYTHON3=ON \
    -D ENABLE_NEON=ON \
    -D ENABLE_VFPV3=ON \
    -D BUILD_TESTS=OFF \
    -D BUILD_DOCS=OFF \
    -D BUILD_EXAMPLES=OFF \
    -B "${CV_DIR}/build/" \
    -S "${CV_DIR}"

make -j$(nproc) -C "${CV_DIR}/build/"
make install/strip -C "${CV_DIR}/build/"
cp -r "${CV_DIR}" "${ROOTFS_DIR}/opt/opencv/"
