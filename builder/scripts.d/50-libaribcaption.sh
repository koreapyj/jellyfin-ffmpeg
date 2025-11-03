#!/bin/bash

SCRIPT_REPO="https://github.com/xqq/libaribcaption.git"
SCRIPT_COMMIT="0a3a209d3f0b3650b92941248b9701bf69584a1f"

ffbuild_enabled() {
    return 0
}

ffbuild_dockerbuild() {
    git-mini-clone "$SCRIPT_REPO" "$SCRIPT_COMMIT" libaribcaption
    cd libaribcaption

    cmake -DCMAKE_TOOLCHAIN_FILE="$FFBUILD_CMAKE_TOOLCHAIN" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$FFBUILD_PREFIX" -DARIBCC_SHARED_LIBRARY:BOOL=ON

    make -j$(nproc)
    make install
}

ffbuild_configure() {
    echo --enable-libaribcaption
}

ffbuild_unconfigure() {
    echo --disable-libaribcaption
}
