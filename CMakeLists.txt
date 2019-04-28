cmake_minimum_required( VERSION 3.1 )

project( blend2d_python C CXX )

# Blend2D
# -------

set(CMAKE_CXX_STANDARD 17)

set(BLEND2D_DIR "${CMAKE_CURRENT_LIST_DIR}/../blend2d"
    CACHE PATH "Location of 'blend2d'")

set(BLEND2D_BUILD_STATIC TRUE)
include("${BLEND2D_DIR}/CMakeLists.txt")

if("${CMAKE_CXX_COMPILER_ID}" MATCHES "^(GNU|Clang|AppleClang)$")
  list(APPEND BLEND2D_CFLAGS "-fvisibility=hidden")
endif()

# Blend2D Cython Extension
# ------------------------

set( BLEND2DPY_TARGET_NAME "_capi" CACHE STRING "Name of the extension file")

set( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR}/cmake )
include( UseCython )

include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/src )
add_subdirectory( src )
