#*******************************************************************************
# libonvif/onvif-util/CMakeLists.txt
#
# Copyright (c) 2022, 2025 Stephen Rhodes
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
message(${LIBONVIF_INCLUDE_DIR})
include_directories(${LIBONVIF_INCLUDE_DIR})

add_executable(onvif-util
    src/onvif-util.cpp
)

target_link_libraries(onvif-util PRIVATE
    onvif
)

install(TARGETS onvif-util
    RUNTIME DESTINATION bin)
