#
# Try to find GLFW library and include path.
# Once done this will define
#
# GLFW_FOUND
# GLFW_INCLUDE_DIR
# GLFW_LIBRARIES
#

if(NOT GLFW_FOUND)

MESSAGE(STATUS "Searching in: ${LIBIGL_INCLUDE_DIR}")

FIND_PATH(GLFW_INCLUDE_DIR GLFW/glfw3.h
  PATHS
    ${LIBIGL_INCLUDE_DIR}/../external/nanogui/ext/glfw/include
    /usr/local/include
    /usr/X11/include
    /usr/include
    /opt/local/include
    NO_DEFAULT_PATH
    )

FIND_LIBRARY( GLFW_LIBRARIES NAMES glfw glfw3
  PATHS
    ${LIBIGL_INCLUDE_DIR}/../external/nanogui/ext/glfw/build/src
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

SET(GLFW_FOUND "NO")
IF (GLFW_INCLUDE_DIR AND GLFW_LIBRARIES)
	SET(GLFW_FOUND "YES")
ENDIF (GLFW_INCLUDE_DIR AND GLFW_LIBRARIES)

if(GLFW_FOUND)
  message(STATUS "Found GLFW: ${GLFW_INCLUDE_DIR}")
else(GLFW_FOUND)
    message(STATUS "GLFW include dir: ${GLFW_INCLUDE_DIR}")
    message(STATUS "GLFW library dir: ${GLFW_LIBRARIES}")
  message(FATAL_ERROR "could NOT find GLFW")
endif(GLFW_FOUND)

endif(NOT GLFW_FOUND)
