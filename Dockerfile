from lyrahgames/gcc-cmake:latest

label maintainer="markuspawellek@gmail.com"

# install latest Eigen library
workdir /tmp
run git clone https://github.com/eigenteam/eigen-git-mirror.git --depth=1 --branch master --single-branch eigen
workdir eigen/build
run \
  cmake -D CMAKE_BUILD_TYPE=Release .. && \
  cmake --build . && \
  cmake --build . --target install
workdir /
run rm -rf /tmp/eigen

# install latest doctest unit testing framework
workdir /tmp
run git clone https://github.com/onqtam/doctest.git --depth=1 --branch master --single-branch
workdir doctest/build
run \
  cmake -D CMAKE_BUILD_TYPE=Release .. && \
  cmake --build . && \
  cmake --build . --target install
workdir /
run rm -rf /tmp/doctest