# ****************************************************************************
#  Project:  LibCMaker_fmt
#  Purpose:  A CMake build script for fmt library
#  Author:   NikitaFeodonit, nfeodonit@yandex.com
# ****************************************************************************
#    Copyright (c) 2017-2019 NikitaFeodonit
#
#    This file is part of the LibCMaker_fmt project.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published
#    by the Free Software Foundation, either version 3 of the License,
#    or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program. If not, see <http://www.gnu.org/licenses/>.
# ****************************************************************************

#-----------------------------------------------------------------------
# The file is an example of the convenient script for the library build.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Lib's name, version, paths
#-----------------------------------------------------------------------

set(FMT_lib_NAME "fmt")
set(FMT_lib_VERSION "8.0.1" CACHE STRING "FMT_lib_VERSION")
set(FMT_lib_DIR "${CMAKE_CURRENT_LIST_DIR}" CACHE PATH "FMT_lib_DIR")

# To use our Find<LibName>.cmake.
list(APPEND CMAKE_MODULE_PATH "${FMT_lib_DIR}/cmake/modules")


#-----------------------------------------------------------------------
# LibCMaker_<LibName> specific vars and options
#-----------------------------------------------------------------------

#option(COPY_FMT_CMAKE_BUILD_SCRIPTS "COPY_FMT_CMAKE_BUILD_SCRIPTS" ON)


#-----------------------------------------------------------------------
# Library specific vars and options
#-----------------------------------------------------------------------

option(FMT_PEDANTIC "Enable extra warnings and expensive tests." OFF)
option(FMT_WERROR
  "Halt the compilation with an error on compiler warnings."
  OFF
)

# Options that control generation of various targets.
option(FMT_DOC "Generate the doc target." OFF)
option(FMT_INSTALL "Generate the install target." ON)
option(FMT_TEST "Generate the test target." OFF)
option(FMT_FUZZ "Generate the fuzz target." OFF)
option(FMT_CUDA_TEST "Generate the cuda-test target." OFF)


#-----------------------------------------------------------------------
# Build, install and find the library
#-----------------------------------------------------------------------

cmr_find_package(
  LibCMaker_DIR   ${LibCMaker_DIR}
  NAME            ${FMT_lib_NAME}
  VERSION         ${FMT_lib_VERSION}
  LIB_DIR         ${FMT_lib_DIR}
  REQUIRED
)
