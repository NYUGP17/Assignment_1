cmake_minimum_required(VERSION 2.6)
project(assignment1)

# We will use the static library (e.g. the one built in the LibIGL
# tutorials/build directory).
SET(LIBIGL_USE_STATIC_LIBRARY  "YES")

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

SET(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../cmake ${PROJECT_SOURCE_DIR}/cmake)
set(CMAKE_COLOR_MAKEFILE ON)

# Find packages...
find_package(OpenGL REQUIRED)
find_package(EIGEN REQUIRED)
find_package(LIBIGL REQUIRED)
find_package(GLFW REQUIRED)

if(APPLE)
    set(CMAKE_CXX_LINK_FLAGS "-framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
else(APPLE)
    find_package(GLEW REQUIRED)
    include_directories( ${GLEW_INCLUDE_DIR} )
    if(UNIX)
        set(CMAKE_CXX_LINK_EXECUTABLE "${CMAKE_CXX_LINK_EXECUTABLE} -lGL -lGLU -lrt -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXcursor -lXinerama")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    endif(UNIX)
endif(APPLE)

include_directories(${LIBIGL_INCLUDE_DIR} ${EIGEN_INCLUDE_DIR})
include_directories(
	/usr/local/include
	/opt/local/include
    ${PROJECT_SOURCE_DIR}
    ${OPENGL_INCLUDE_DIR}
)

link_directories(
	/usr/local/lib
	/opt/local/lib
)

IF(CMAKE_BUILD_TYPE MATCHES RELEASE)
    add_definitions(-DNDEBUG)
ENDIF(CMAKE_BUILD_TYPE MATCHES RELEASE)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-register")
endif()

set(SHARED_LIBRARIES
		${LIBIGL_LIBRARIES}
		${OPENGL_LIBRARIES}
		${EIGEN_LIBRARIES}
		${GLEW_LIBRARIES}
		${GLFW_LIBRARIES}
)

file(GLOB SOURCES
    "${PROJECT_SOURCE_DIR}/src/*.h"
    "${PROJECT_SOURCE_DIR}/src/*.cpp"
)
add_executable(${PROJECT_NAME}_bin ${SOURCES})
target_link_libraries(${PROJECT_NAME}_bin ${SHARED_LIBRARIES} ${LIBIGL_LIBRARIES} ${GLFW_LIBRARIES})
