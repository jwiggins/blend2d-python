if( NOT NUMPY_INCLUDE_DIR )
  find_package( PythonInterp )
  execute_process(
    COMMAND ${PYTHON_EXECUTABLE} -c "import numpy; print(numpy.get_include())"
    OUTPUT_VARIABLE _numpy_include
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  find_path( NUMPY_INCLUDE_DIR numpy/arrayobject.h
    HINTS ${_numpy_include} )
endif()

include_directories( ${NUMPY_INCLUDE_DIR} )

cython_add_module( capi capi.pyx )
target_include_directories(capi BEFORE PRIVATE ${BLEND2D_INCLUDE_DIR})
target_compile_options(capi PRIVATE ${BLEND2D_CFLAGS})
target_link_libraries(capi ${BLEND2D_LIBS})
