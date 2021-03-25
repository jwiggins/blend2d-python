import os
import os.path as op
import platform
import subprocess
import sys

from setuptools import setup, Extension
from setuptools.command.build_ext import build_ext

# Set to 'Release' when building a release
BUILD_TYPE = 'Debug'


class CMakeExtension(Extension):
    def __init__(self, name, cmake_lists_dir='.', sources=None, **kwa):
        sources = [] if sources is None else sources
        Extension.__init__(self, name, sources=sources, **kwa)
        self.cmake_lists_dir = os.path.abspath(cmake_lists_dir)


class cmake_build_ext(build_ext):
    def build_extensions(self):
        try:
            subprocess.check_output(['cmake', '--version'])
        except OSError:
            raise RuntimeError('Cannot find CMake executable')

        for ext in self.extensions:
            extpath = self.get_ext_fullpath(ext.name)
            extdir = op.abspath(op.dirname(extpath))
            extfile = op.splitext(op.basename(extpath))[0]
            tmpdir = self.build_temp
            cmake_args = [
                '-DBLEND2D_STATIC=TRUE',
                '-DBLEND2DPY_TARGET_NAME={}'.format(extfile),
                '-DCMAKE_BUILD_TYPE={}'.format(BUILD_TYPE),
                '-DCMAKE_LIBRARY_OUTPUT_DIRECTORY_{}={}'.format(
                    BUILD_TYPE.upper(), extdir),
                '-DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_{}={}'.format(
                    BUILD_TYPE.upper(), extdir),
                '-DPYTHON_EXECUTABLE={}'.format(sys.executable),
            ]

            if platform.system() == 'Windows':
                plat = ('x64' if platform.architecture()[0] == '64bit'
                        else 'Win32')
                cmake_args += [
                    '-DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=TRUE',
                    '-DCMAKE_RUNTIME_OUTPUT_DIRECTORY_{}={}'.format(
                        BUILD_TYPE.upper(), extdir),
                ]
                if self.compiler.compiler_type == 'msvc':
                    cmake_args += [
                        '-DCMAKE_GENERATOR_PLATFORM={}'.format(plat),
                    ]
                else:
                    cmake_args += [
                        '-G', 'MinGW Makefiles',
                    ]
            elif platform.system() == 'Linux':
                cmake_args += [
                    '-DCMAKE_C_FLAGS=-fPIC',
                    '-DCMAKE_CXX_FLAGS=-fPIC',
                ]

            if not op.exists(tmpdir):
                os.makedirs(tmpdir)

            # Config and build the extension
            cmd = ['cmake', ext.cmake_lists_dir] + cmake_args
            subprocess.check_call(cmd, cwd=tmpdir)
            cmd = ['cmake', '--build', '.', '--config', BUILD_TYPE]
            subprocess.check_call(cmd, cwd=tmpdir)


if __name__ == '__main__':
    # See setup.cfg for package metadata
    setup(
        ext_modules=[CMakeExtension('blend2d._capi')],
        cmdclass={'build_ext': cmake_build_ext},
    )
