# - Try to find the GLEW library
# Once done this will define
#
#  GLEW_FOUND - system has GLEW
#  GLEW_INCLUDE_DIR - the GLEW include directory
#  GLEW_LIBRARIES - the GLEW source file list

FIND_PATH(GLEW_INCLUDE_DIR GL/glew.h
   ${PROJECT_SOURCE_DIR}/../../external/glew/include
   ${PROJECT_SOURCE_DIR}/../external/glew/include
   ${PROJECT_SOURCE_DIR}/../libigl/external/glew/include
   /usr/include
   /usr/local/include
   $ENV{GLEWROOT}/include
   $ENV{GLEW_ROOT}/include
   $ENV{GLEW_DIR}/include
   $ENV{GLEW_DIR}/inc
   [HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\VisualStudio\\8.0\\Setup\\VC]/PlatformSDK/Include
   NO_DEFAULT_PATH
)

FIND_LIBRARY( GLEW_LIBRARIES NAMES GLEW glew
  PATHS
    /usr/local
    /usr/X11
    /usr
    /opt/local/lib
    PATH_SUFFIXES
    a
    lib64
    lib
    lib/x86_64-linux-gnu
    lib/arm-linux-gnueabihf
    NO_DEFAULT_PATH
)


IF (GLEW_INCLUDE_DIR AND GLEW_LIBRARIES)
   SET(GLEW_FOUND TRUE)
ENDIF (GLEW_INCLUDE_DIR AND GLEW_LIBRARIES)

if(GLEW_FOUND)
    message(STATUS "Found GLEW: ${GLEW_INCLUDE_DIR}")
else(GLEW_FOUND)
    message(STATUS "GLEW include dir: ${GLEW_INCLUDE_DIR}")
    message(STATUS "GLEW library dir: ${GLEW_LIBRARIES}")
    message(FATAL_ERROR "could NOT find glew")
endif(GLEW_FOUND)

MARK_AS_ADVANCED(GLEW_INCLUDE_DIR)
