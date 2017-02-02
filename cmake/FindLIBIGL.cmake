# - Try to find the LIBIGL library
# Once done this will define
#
#  LIBIGL_FOUND - system has LIBIGL
#  LIBIGL_INCLUDE_DIR - the LIBIGL include directory
#  LIBIGL_SOURCES - the LIBIGL source files

# Additionally, if LIBIGL_USE_STATIC_LIBRARY is true, this will define:
#  LIBIGL_LIBRARIES - the paths to the pre-built static libraries.
if(NOT LIBIGL_FOUND)

FIND_PATH(LIBIGL_INCLUDE_DIR igl/readOBJ.h
   /usr/include
   /usr/local/include
   /usr/local/igl/libigl/include
   $ENV{LIBIGL}/include
   $ENV{LIBIGLROOT}/include
   $ENV{LIBIGL_ROOT}/include
   $ENV{LIBIGL_DIR}/include
   $ENV{LIBIGL_DIR}/inc
   ${PROJECT_SOURCE_DIR}/../libigl/include
   ${PROJECT_SOURCE_DIR}/../../libigl/include
   ${PROJECT_SOURCE_DIR}/../../include
)

if(LIBIGL_INCLUDE_DIR)
   set(LIBIGL_FOUND TRUE)
   set(LIBIGL_INCLUDE_DIR ${LIBIGL_INCLUDE_DIR})
   #set(LIBIGL_SOURCES
   #   ${LIBIGL_INCLUDE_DIR}/igl/viewer/Viewer.cpp
   #)
endif(LIBIGL_INCLUDE_DIR)

if(LIBIGL_USE_STATIC_LIBRARY)
  add_definitions(-DIGL_STATIC_LIBRARY)
  set(LIBIGL_LIB_DIRS
    /usr/lib
    /usr/local/lib
    $ENV{LIBIGLROOT}/lib
    $ENV{LIBIGL_ROOT}/lib
    $ENV{LIBIGL_DIR}/lib
    ${PROJECT_SOURCE_DIR}/../libigl/lib
    ${PROJECT_SOURCE_DIR}/../../libigl/lib
    ${PROJECT_SOURCE_DIR}/../../lib
    $ENV{LIBIGL_ROOT}/tutorial/build/libigl
  )

  FIND_LIBRARY( LIBIGL_LIBRARY NAMES igl PATHS ${LIBIGL_LIB_DIRS} PATH_SUFFIXES a)
  if(NOT LIBIGL_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libigl")
  endif(NOT LIBIGL_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGL_LIBRARY})

  FIND_LIBRARY( LIBIGL_VIEWER_LIBRARY NAMES igl_viewer PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGL_VIEWER_LIBRARY)
    set(LIBIGL_FOUND FALSE)
      message(FATAL_ERROR "could NOT find libigl_viewer")
  endif(NOT LIBIGL_VIEWER_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES} ${LIBIGL_VIEWER_LIBRARY})

  FIND_LIBRARY( LIBIGL_OPENGL_GLFW_LIBRARY NAMES igl_opengl_glfw PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGL_OPENGL_GLFW_LIBRARY)
    set(LIBIGL_FOUND FALSE)
      message(FATAL_ERROR "could NOT find libigl_opengl_glfw")
  endif(NOT LIBIGL_OPENGL_GLFW_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES} ${LIBIGL_OPENGL_GLFW_LIBRARY})

endif(LIBIGL_USE_STATIC_LIBRARY)

if(LIBIGL_FOUND)
   if(NOT LIBIGL_FIND_QUIETLY)
      message(STATUS "Found LIBIGL: ${LIBIGL_INCLUDE_DIR}")
   endif(NOT LIBIGL_FIND_QUIETLY)
else(LIBIGL_FOUND)
   if(LIBIGL_FIND_REQUIRED)
      message(FATAL_ERROR "could NOT find LIBIGL")
   endif(LIBIGL_FIND_REQUIRED)
endif(LIBIGL_FOUND)

MARK_AS_ADVANCED(LIBIGL_INCLUDE_DIR LIBIGL_LIBRARIES IGL_VIEWER_SOURCES)

endif(NOT LIBIGL_FOUND)
