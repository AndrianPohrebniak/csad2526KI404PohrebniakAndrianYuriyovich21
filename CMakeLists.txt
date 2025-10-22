cmake_minimum_required(VERSION 3.10)

# Project name
project(csad2526KI404PohrebniakAndrianYuriyovich21)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the main executable
add_executable(csad2526KI404PohrebniakAndrianYuriyovich21 name.cpp math_operations.cpp)

# Download and configure GoogleTest
include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.12.1
)
FetchContent_MakeAvailable(googletest)

# Add the unit tests executable
add_executable(unit_tests tests/unit_tests.cpp math_operations.cpp)

# Include directories for unit tests (so it can find header files)
target_include_directories(unit_tests PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

# Link GoogleTest to unit tests
target_link_libraries(unit_tests gtest gtest_main)

# Enable testing
enable_testing()

# Add the unit test
add_test(NAME unit_tests COMMAND unit_tests)