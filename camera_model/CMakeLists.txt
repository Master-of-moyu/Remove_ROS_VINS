cmake_minimum_required(VERSION 3.13)
project(camera_model)

set(CMAKE_BUILD_TYPE "Release")
set(CMAKE_CXX_FLAGS "-std=c++11")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -fPIC")

find_package(Boost REQUIRED COMPONENTS filesystem program_options system)
include_directories(${Boost_INCLUDE_DIRS})

find_package(OpenCV REQUIRED)

# set(EIGEN_INCLUDE_DIR "/usr/local/include/eigen3")
find_package(Ceres REQUIRED)
include_directories(${CERES_INCLUDE_DIRS})

include_directories("include")

add_library(camera_model STATIC
    src/Chessboard.cc
    src/CameraCalibration.cc
    src/Camera.cc
    src/CameraFactory.cc
    src/CostFunctionFactory.cc
    src/PinholeCamera.cc
    src/CataCamera.cc
    src/EquidistantCamera.cc
    src/ScaramuzzaCamera.cc
    src/Transform.cc
    src/gpl.cc
    src/EigenQuaternionParameterization.cc
)

target_link_libraries(camera_model ${Boost_LIBRARIES} ${OpenCV_LIBS} ${CERES_LIBRARIES})
