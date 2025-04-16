import os
import platform
import sys
from setuptools import setup, find_packages
import torch
from torch.utils.cpp_extension import BuildExtension, CppExtension
from packaging.version import Version

# Kiểm tra phiên bản PyTorch
torch_version = Version(torch.__version__)

# Dùng C++17 thay vì C++14 (PyTorch mới yêu cầu C++17)
extra_compile_args = ['-fPIC', '-std=c++17']

warp_rnnt_path = "../build"

# Lấy CUDA_HOME từ biến môi trường, mặc định là trong venv
CUDA_HOME = os.environ.get("CUDA_HOME", "/home/npl/.conda/envs/ds")

# Kiểm tra CUDA có sẵn không
if torch.cuda.is_available() or CUDA_HOME:
    enable_gpu = True
else:
    print("Torch was not built with CUDA support, not building GPU extensions.")
    enable_gpu = False

if platform.system() == 'Darwin':
    lib_ext = ".dylib"
else:
    lib_ext = ".so"

if enable_gpu:
    extra_compile_args += ['-DWARPRNNT_ENABLE_GPU']

# Kiểm tra biến môi trường
if "WARP_RNNT_PATH" in os.environ:
    warp_rnnt_path = os.environ["WARP_RNNT_PATH"]

if not os.path.exists(os.path.join(warp_rnnt_path, "libwarprnnt" + lib_ext)):
    print(("Could not find libwarprnnt.so in {}.\n"
           "Build warp-rnnt and set WARP_RNNT_PATH to the location of"
           " libwarprnnt.so (default is '../build')").format(warp_rnnt_path))
    sys.exit(1)

include_dirs = [os.path.realpath('../include'), f"{CUDA_HOME}/include"]
library_dirs = [os.path.realpath(warp_rnnt_path), f"{CUDA_HOME}/lib64"]

setup(
    name='warprnnt_pytorch',
    version="0.1",
    description="PyTorch wrapper for RNN-Transducer",
    url="https://github.com/HawkAaron/warp-transducer",
    author="Mingkun Huang",
    author_email="mingkunhuang95@gmail.com",
    packages=find_packages(),
    ext_modules=[
        CppExtension(
            name='warprnnt_pytorch.warp_rnnt',
            sources=['src/binding.cpp'],
            include_dirs=include_dirs,
            library_dirs=library_dirs,
            libraries=['warprnnt'],
            extra_link_args=['-Wl,-rpath,' + os.path.realpath(warp_rnnt_path)],
            extra_compile_args=extra_compile_args),
    ],
    cmdclass={
        'build_ext': BuildExtension
    }
)
