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

cython_add_module( _capi _capi.pyx )
set_target_properties( _capi PROPERTIES OUTPUT_NAME ${BLEND2DPY_TARGET_NAME} )

if(WIN32)
    set_target_properties( _capi PROPERTIES SUFFIX ".pyd" )
endif()

target_include_directories( _capi BEFORE PRIVATE ${BLEND2D_INCLUDE_DIR} )
target_link_libraries( _capi ${BLEND2D_LIBS} )
