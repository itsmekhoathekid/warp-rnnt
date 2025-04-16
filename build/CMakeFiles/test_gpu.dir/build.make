# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/npl/.local/lib/python3.9/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/npl/.local/lib/python3.9/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /data/npl/Speech2Text/RNN-Transducer/warp-transducer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data/npl/Speech2Text/RNN-Transducer/warp-transducer/build

# Include any dependencies generated for this target.
include CMakeFiles/test_gpu.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test_gpu.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test_gpu.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_gpu.dir/flags.make

CMakeFiles/test_gpu.dir/tests/test_gpu_generated_test_gpu.cu.o: /data/npl/Speech2Text/RNN-Transducer/warp-transducer/tests/test_gpu.cu
CMakeFiles/test_gpu.dir/tests/test_gpu_generated_test_gpu.cu.o: CMakeFiles/test_gpu.dir/tests/test_gpu_generated_test_gpu.cu.o.depend
CMakeFiles/test_gpu.dir/tests/test_gpu_generated_test_gpu.cu.o: CMakeFiles/test_gpu.dir/tests/test_gpu_generated_test_gpu.cu.o.cmake
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building NVCC (Device) object CMakeFiles/test_gpu.dir/tests/test_gpu_generated_test_gpu.cu.o"
	cd /data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles/test_gpu.dir/tests && /home/npl/.local/lib/python3.9/site-packages/cmake/data/bin/cmake -E make_directory /data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles/test_gpu.dir/tests/.
	cd /data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles/test_gpu.dir/tests && /home/npl/.local/lib/python3.9/site-packages/cmake/data/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING= -D generated_file:STRING=/data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles/test_gpu.dir/tests/./test_gpu_generated_test_gpu.cu.o -D generated_cubin_file:STRING=/data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles/test_gpu.dir/tests/./test_gpu_generated_test_gpu.cu.o.cubin.txt -P /data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles/test_gpu.dir/tests/test_gpu_generated_test_gpu.cu.o.cmake

CMakeFiles/test_gpu.dir/codegen:
.PHONY : CMakeFiles/test_gpu.dir/codegen

CMakeFiles/test_gpu.dir/tests/random.cpp.o: CMakeFiles/test_gpu.dir/flags.make
CMakeFiles/test_gpu.dir/tests/random.cpp.o: /data/npl/Speech2Text/RNN-Transducer/warp-transducer/tests/random.cpp
CMakeFiles/test_gpu.dir/tests/random.cpp.o: CMakeFiles/test_gpu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/test_gpu.dir/tests/random.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/test_gpu.dir/tests/random.cpp.o -MF CMakeFiles/test_gpu.dir/tests/random.cpp.o.d -o CMakeFiles/test_gpu.dir/tests/random.cpp.o -c /data/npl/Speech2Text/RNN-Transducer/warp-transducer/tests/random.cpp

CMakeFiles/test_gpu.dir/tests/random.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/test_gpu.dir/tests/random.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/npl/Speech2Text/RNN-Transducer/warp-transducer/tests/random.cpp > CMakeFiles/test_gpu.dir/tests/random.cpp.i

CMakeFiles/test_gpu.dir/tests/random.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/test_gpu.dir/tests/random.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/npl/Speech2Text/RNN-Transducer/warp-transducer/tests/random.cpp -o CMakeFiles/test_gpu.dir/tests/random.cpp.s

# Object files for target test_gpu
test_gpu_OBJECTS = \
"CMakeFiles/test_gpu.dir/tests/random.cpp.o"

# External object files for target test_gpu
test_gpu_EXTERNAL_OBJECTS = \
"/data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles/test_gpu.dir/tests/test_gpu_generated_test_gpu.cu.o"

test_gpu: CMakeFiles/test_gpu.dir/tests/random.cpp.o
test_gpu: CMakeFiles/test_gpu.dir/tests/test_gpu_generated_test_gpu.cu.o
test_gpu: CMakeFiles/test_gpu.dir/build.make
test_gpu: /home/npl/.conda/envs/ds/lib/libcudart_static.a
test_gpu: /usr/lib/x86_64-linux-gnu/librt.a
test_gpu: libwarprnnt.so
test_gpu: /home/npl/.conda/envs/ds/lib/libcurand.so
test_gpu: /home/npl/.conda/envs/ds/lib/libcudart_static.a
test_gpu: /usr/lib/x86_64-linux-gnu/librt.a
test_gpu: CMakeFiles/test_gpu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable test_gpu"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_gpu.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_gpu.dir/build: test_gpu
.PHONY : CMakeFiles/test_gpu.dir/build

CMakeFiles/test_gpu.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_gpu.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_gpu.dir/clean

CMakeFiles/test_gpu.dir/depend: CMakeFiles/test_gpu.dir/tests/test_gpu_generated_test_gpu.cu.o
	cd /data/npl/Speech2Text/RNN-Transducer/warp-transducer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data/npl/Speech2Text/RNN-Transducer/warp-transducer /data/npl/Speech2Text/RNN-Transducer/warp-transducer /data/npl/Speech2Text/RNN-Transducer/warp-transducer/build /data/npl/Speech2Text/RNN-Transducer/warp-transducer/build /data/npl/Speech2Text/RNN-Transducer/warp-transducer/build/CMakeFiles/test_gpu.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/test_gpu.dir/depend

