# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/aetherlinx/Workspace/Local_Workspace/Template

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aetherlinx/Workspace/Local_Workspace/Template/build

# Include any dependencies generated for this target.
include CMakeFiles/Project_name.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Project_name.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Project_name.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Project_name.dir/flags.make

CMakeFiles/Project_name.dir/src/main.cpp.o: CMakeFiles/Project_name.dir/flags.make
CMakeFiles/Project_name.dir/src/main.cpp.o: /home/aetherlinx/Workspace/Local_Workspace/Template/src/main.cpp
CMakeFiles/Project_name.dir/src/main.cpp.o: CMakeFiles/Project_name.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aetherlinx/Workspace/Local_Workspace/Template/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Project_name.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Project_name.dir/src/main.cpp.o -MF CMakeFiles/Project_name.dir/src/main.cpp.o.d -o CMakeFiles/Project_name.dir/src/main.cpp.o -c /home/aetherlinx/Workspace/Local_Workspace/Template/src/main.cpp

CMakeFiles/Project_name.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Project_name.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aetherlinx/Workspace/Local_Workspace/Template/src/main.cpp > CMakeFiles/Project_name.dir/src/main.cpp.i

CMakeFiles/Project_name.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Project_name.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aetherlinx/Workspace/Local_Workspace/Template/src/main.cpp -o CMakeFiles/Project_name.dir/src/main.cpp.s

# Object files for target Project_name
Project_name_OBJECTS = \
"CMakeFiles/Project_name.dir/src/main.cpp.o"

# External object files for target Project_name
Project_name_EXTERNAL_OBJECTS =

Project_name: CMakeFiles/Project_name.dir/src/main.cpp.o
Project_name: CMakeFiles/Project_name.dir/build.make
Project_name: CMakeFiles/Project_name.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/aetherlinx/Workspace/Local_Workspace/Template/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Project_name"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Project_name.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Project_name.dir/build: Project_name
.PHONY : CMakeFiles/Project_name.dir/build

CMakeFiles/Project_name.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Project_name.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Project_name.dir/clean

CMakeFiles/Project_name.dir/depend:
	cd /home/aetherlinx/Workspace/Local_Workspace/Template/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aetherlinx/Workspace/Local_Workspace/Template /home/aetherlinx/Workspace/Local_Workspace/Template /home/aetherlinx/Workspace/Local_Workspace/Template/build /home/aetherlinx/Workspace/Local_Workspace/Template/build /home/aetherlinx/Workspace/Local_Workspace/Template/build/CMakeFiles/Project_name.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Project_name.dir/depend

