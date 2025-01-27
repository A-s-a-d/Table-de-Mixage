cmake_minimum_required(VERSION 3.10)

# Automatically set the project name to the directory name
get_filename_component(PROJECT_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

# Set the project name and version
project(${PROJECT_NAME} VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add include directories
include_directories(${CMAKE_SOURCE_DIR}/docs)
include_directories(${CMAKE_SOURCE_DIR}/exemples)
include_directories(${CMAKE_SOURCE_DIR}/external)
include_directories(${CMAKE_SOURCE_DIR}/lib)
include_directories(${CMAKE_SOURCE_DIR}/src)


# Include directories for header files
include_directories("${CMAKE_SOURCE_DIR}/lib")


# Find all .cpp files in the src and lib directories (including subdirectories)
file(GLOB_RECURSE SOURCES
    "${CMAKE_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_SOURCE_DIR}/lib/*/*.cpp"
)

# Find all header files in the lib directory (including subdirectories)
file(GLOB_RECURSE HEADERS
    "${CMAKE_SOURCE_DIR}/lib/*/*.h"
)



# Add executable target, passing in all the .cpp files found
add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})

