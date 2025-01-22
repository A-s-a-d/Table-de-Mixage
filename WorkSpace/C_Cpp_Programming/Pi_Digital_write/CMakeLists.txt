cmake_minimum_required(VERSION 3.10)

# Automatically set the project name to the directory name
get_filename_component(PROJECT_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

# Set the project name and version
project(${PROJECT_NAME} VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Find wiringPi
find_library(WIRINGPI_LIB wiringPi)

# Check if wiringPi was found
if(NOT WIRINGPI_LIB)
    message(FATAL_ERROR "wiringPi library not found. Please install wiringPi.")
endif()

# Add an executable
add_executable(${PROJECT_NAME} src/main.cpp)

# Add the lib directory to the include directories
include_directories(${CMAKE_SOURCE_DIR}/docs)
include_directories(${CMAKE_SOURCE_DIR}/exemples)
include_directories(${CMAKE_SOURCE_DIR}/external)
include_directories(${CMAKE_SOURCE_DIR}/include)
include_directories(${CMAKE_SOURCE_DIR}/lib)
include_directories(${CMAKE_SOURCE_DIR}/src)
include_directories(${CMAKE_SOURCE_DIR}/tests)
include_directories(${CMAKE_SOURCE_DIR}/tools)



# Link wiringPi to the executable
target_link_libraries(${PROJECT_NAME} ${WIRINGPI_LIB})
