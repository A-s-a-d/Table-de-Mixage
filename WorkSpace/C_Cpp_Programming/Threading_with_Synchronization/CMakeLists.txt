cmake_minimum_required(VERSION 3.10)

# Set the project name and version
project(Project_name VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add an executable
add_executable(Project_name src/main.cpp)
