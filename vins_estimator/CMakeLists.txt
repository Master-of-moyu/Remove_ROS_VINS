cmake_minimum_required(VERSION 3.13)
project(vins_estimator)

set(CMAKE_BUILD_TYPE "Release")
set(CMAKE_CXX_FLAGS "-std=c++11")
#-DEIGEN_USE_MKL_ALL")
# set(CMAKE_CXX_FLAGS_RELEASE "-O3 -Wall -g -pthread -fopenmp")

include_directories(${CMAKE_SOURCE_DIR}/../camera_model/include)

find_package(Ceres REQUIRED)
find_package(OpenCV REQUIRED)

include_directories(${CERES_INCLUDE_DIRS})
#find_package(Eigen3  REQUIRED)
include_directories(
# ${EIGEN3_INCLUDE_DIR}
		/usr/include/eigen3
)
#message("EIGEN3_INCLUDE_DIR:" ${EIGEN3_INCLUDE_DIR}  " EIGEN3_LIBS: "  ${Eigen3_LIBRARIES} )
	
find_package(Boost REQUIRED COMPONENTS filesystem program_options system)

find_package(Pangolin REQUIRED)
include_directories(${Pangolin_INCLUDE_DIRS})

include_directories(${Boost_INCLUDE_DIRS})
add_executable(vins_estimator
    src/estimator_node.cpp
    src/parameters.cpp
    src/estimator.cpp
    src/feature_manager.cpp
    src/factor/pose_local_parameterization.cpp
    src/factor/projection_factor.cpp
    src/factor/marginalization_factor.cpp
    src/utility/utility.cpp
    src/utility/visualization.cpp
#    src/utility/CameraPoseVisualization.cpp
    src/initial/solve_5pts.cpp
    src/initial/initial_aligment.cpp
    src/initial/initial_sfm.cpp
    src/initial/initial_ex_rotation.cpp
    src/loop-closure/ThirdParty/DBoW/BowVector.cpp
    src/loop-closure/ThirdParty/DBoW/FBrief.cpp
    src/loop-closure/ThirdParty/DBoW/FeatureVector.cpp
    src/loop-closure/ThirdParty/DBoW/QueryResults.cpp
    src/loop-closure/ThirdParty/DBoW/ScoringObject.cpp
    src/loop-closure/ThirdParty/DUtils/Random.cpp
    src/loop-closure/ThirdParty/DUtils/Timestamp.cpp
    src/loop-closure/ThirdParty/DVision/BRIEF.cpp
    src/loop-closure/ThirdParty/VocabularyBinary.cpp
    src/loop-closure/loop_closure.cpp
    src/loop-closure/keyframe.cpp
    src/loop-closure/keyframe_database.cpp
    src/feature_tracker/feature_tracker.cpp 
  #  src/feature_tracker/feature_tracker_parameters.cpp
    ../camera_model/src/Chessboard.cc
    ../camera_model/src/CameraCalibration.cc
    ../camera_model/src/Camera.cc
    ../camera_model/src/CameraFactory.cc
    ../camera_model/src/CostFunctionFactory.cc
    ../camera_model/src/PinholeCamera.cc
    ../camera_model/src/CataCamera.cc
    ../camera_model/src/EquidistantCamera.cc
    ../camera_model/src/ScaramuzzaCamera.cc
    ../camera_model/src/Transform.cc
    ../camera_model/src/gpl.cc
    ../camera_model/src/EigenQuaternionParameterization.cc
)

target_link_libraries(
    vins_estimator
        ${Pangolin_LIBRARIES}
        ${CERES_LIBRARIES}
        ${OpenCV_LIBS}
) 
