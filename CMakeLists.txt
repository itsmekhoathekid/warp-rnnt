IF (APPLE)
    cmake_minimum_required(VERSION 3.4)
ELSE()
    cmake_minimum_required(VERSION 2.8)
ENDIF()

project(rnnt_release)

IF (NOT APPLE)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
ENDIF()

IF (APPLE)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -O2")
    add_definitions(-DAPPLE)
ENDIF()

include_directories(include)

FIND_PACKAGE(CUDA)
MESSAGE(STATUS "cuda found ${CUDA_FOUND}")

option(USE_NAIVE_KERNEL "use naive alpha-beta kernel" OFF)
option(DEBUG_TIME "output kernel time" OFF)
option(DEBUG_KERNEL "output alpha beta" OFF)
if (USE_NAIVE_KERNEL)
    add_definitions(-DUSE_NAIVE_KERNEL)
endif()
if (DEBUG_TIME)
    add_definitions(-DDEBUG_TIME)
endif()
if (DEBUG_KERNEL)
    add_definitions(-DDEBUG_KERNEL)
endif()

option(WITH_GPU "compile warp-rnnt with cuda." ${CUDA_FOUND})
option(WITH_OMP "compile warp-rnnt with openmp." ON)

if(NOT WITH_OMP)
    add_definitions(-DRNNT_DISABLE_OMP)
endif()
if (WITH_OMP)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fopenmp")
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -Xcompiler -fopenmp")
endif()

# Loại bỏ compute_30, compute_35 vì không còn hỗ trợ trên CUDA 12+
# Chỉ giữ lại các kiến trúc từ Pascal (5.0) trở lên
set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_50,code=sm_50")
set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_52,code=sm_52")

IF (CUDA_VERSION GREATER 7.6)
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_60,code=sm_60")
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_61,code=sm_61")
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_62,code=sm_62")
ENDIF()

IF (CUDA_VERSION GREATER 8.9)
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_70,code=sm_70")
ENDIF()

IF (CUDA_VERSION GREATER 9.9)
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_75,code=sm_75")
ENDIF()

IF (CUDA_VERSION GREATER 10.9)
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_80,code=sm_80")
ENDIF()

IF (CUDA_VERSION GREATER 11.9)
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_86,code=sm_86")
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_89,code=sm_89")
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -gencode arch=compute_90,code=sm_90")
ENDIF()

if (NOT APPLE)
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} --std=c++17")
    set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS}")
ENDIF()

IF (WITH_GPU)

    MESSAGE(STATUS "Building shared library with GPU support")

    CUDA_ADD_LIBRARY(warprnnt SHARED src/rnnt_entrypoint.cu)
    IF (!Torch_FOUND)
        TARGET_LINK_LIBRARIES(warprnnt ${CUDA_curand_LIBRARY})
    ENDIF()

    cuda_add_executable(test_time_gpu tests/test_time.cu tests/random.cpp )
    TARGET_LINK_LIBRARIES(test_time_gpu warprnnt ${CUDA_curand_LIBRARY})
    SET_TARGET_PROPERTIES(test_time_gpu PROPERTIES COMPILE_FLAGS "${CMAKE_CXX_FLAGS} --std=c++17")

    cuda_add_executable(test_gpu tests/test_gpu.cu tests/random.cpp )
    TARGET_LINK_LIBRARIES(test_gpu warprnnt ${CUDA_curand_LIBRARY})
    SET_TARGET_PROPERTIES(test_gpu PROPERTIES COMPILE_FLAGS "${CMAKE_CXX_FLAGS} --std=c++17")

ELSE()
    MESSAGE(STATUS "Building shared library with no GPU support")

    if (NOT APPLE)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -O2")
    ENDIF()

    ADD_LIBRARY(warprnnt SHARED src/rnnt_entrypoint.cpp)

ENDIF()

add_executable(test_cpu tests/test_cpu.cpp tests/random.cpp )
TARGET_LINK_LIBRARIES(test_cpu warprnnt)
SET_TARGET_PROPERTIES(test_cpu PROPERTIES COMPILE_FLAGS "${CMAKE_CXX_FLAGS} --std=c++17")

add_executable(test_time tests/test_time.cpp tests/random.cpp )
TARGET_LINK_LIBRARIES(test_time warprnnt)
SET_TARGET_PROPERTIES(test_time PROPERTIES COMPILE_FLAGS "${CMAKE_CXX_FLAGS} --std=c++17")

INSTALL(TARGETS warprnnt
        RUNTIME DESTINATION "bin"
        LIBRARY DESTINATION "lib"
        ARCHIVE DESTINATION "lib")

INSTALL(FILES include/rnnt.h DESTINATION "include")
