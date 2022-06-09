cmake_minimum_required(VERSION 3.20)
project(sudoku_solver C)

set(CMAKE_C_STANDARD 11)

find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)

include_directories(${GTK3_INCLUDE_DIRS})
link_directories(${GTK3_LIBRARY_DIRS})

add_definitions(${GTK3_CFLAGS_OTHER})

add_executable(sudoku_solver main.c)

target_link_libraries(sudoku_solver ${GTK3_LIBRARIES})