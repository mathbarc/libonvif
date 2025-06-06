#*******************************************************************************
# libonvif/libonvif/CMakeLists.txt
#
# Copyright (c) 2023, 2024 Stephen Rhodes
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#******************************************************************************/


find_package(LibXml2 REQUIRED)
set(LIBONVIF_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include CACHE PATH "libonvif include dir")
include_directories(${LIBXML2_INCLUDE_DIRS} ${LIBONVIF_INCLUDE_DIR})

file(GLOB LIB_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)
file(GLOB LIB_HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h)

add_library(onvif ${LIB_SOURCES} ${LIB_HEADERS})
target_link_libraries(onvif ${LIBXML2_LIBRARIES})

install(TARGETS onvif EXPORT LibOnvif
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        INCLUDES DESTINATION include/onvif
)
install(DIRECTORY ${LIBONVIF_INCLUDE_DIR}/ DESTINATION ./include/onvif/)
include(GenerateExportHeader)
generate_export_header(onvif)
export(
  TARGETS onvif
  NAMESPACE LibOnvif::
  FILE LibOnvifTargets.cmake
)
install(EXPORT LibOnvif FILE LibOnvifTargets.cmake NAMESPACE LibOnvif:: DESTINATION lib/cmake/libonvif)

include(CMakePackageConfigHelpers)
configure_package_config_file(
  LibOnvifConfig.cmake.in
  "${CMAKE_CURRENT_BINARY_DIR}/cmake/LibOnvifConfig.cmake"
  INSTALL_DESTINATION lib/cmake/libonvif)

write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/cmake/LibOnvifConfigVersion.cmake"
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY AnyNewerVersion)


set(ConfigPackageLocation lib/cmake/libonvif)
# install(
#   EXPORT LibOnvif
#   FILE LibOnvifTargets.cmake
#   DESTINATION ${ConfigPackageLocation})
install(
  FILES
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/LibOnvifConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/LibOnvifConfigVersion.cmake"
  DESTINATION ${ConfigPackageLocation})
