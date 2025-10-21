cmake_minimum_required(VERSION 3.10)

# Project name
project(csad2526KI404PohrebniakAndrianYuriyovich21)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the main executable
add_executable(csad2526KI404PohrebniakAndrianYuriyovich21 name.cpp math_operations.cpp math_operations.h)

# Add the unit tests executable
add_executable(unit_tests tests/unit_tests.cpp math_operations.cpp math_operations.h)