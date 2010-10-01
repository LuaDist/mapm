# Copyright (C) 2007-2009 LuaDist.
# Created by Peter Kapec <kapecp@gmail.com>
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
#	Note:
#		Searching headers and libraries is very simple and is NOT as powerful as scripts
#		distributed with CMake, because LuaDist defines directories to search for.
#		Everyone is encouraged to contact the author with improvements. Maybe this file
#		becomes part of CMake distribution sometimes.

# - Find mapm
# Find the native MAPM headers and libraries.
#
# MAPM_INCLUDE_DIRS	- where to find m_apm.h, etc.
# MAPM_LIBRARIES	- List of libraries when using mapm.
# MAPM_FOUND	- True if mapm found.

# Look for the header file.
FIND_PATH(MAPM_INCLUDE_DIR NAMES m_apm.h)

# Look for the library.
FIND_LIBRARY(MAPM_LIBRARY NAMES mapm)

# Handle the QUIETLY and REQUIRED arguments and set MAPM_FOUND to TRUE if all listed variables are TRUE.
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(MAPM DEFAULT_MSG MAPM_LIBRARY MAPM_INCLUDE_DIR)

# Copy the results to the output variables.
IF(MAPM_FOUND)
	SET(MAPM_LIBRARIES ${MAPM_LIBRARY})
	SET(MAPM_INCLUDE_DIRS ${MAPM_INCLUDE_DIR})
ELSE(MAPM_FOUND)
	SET(MAPM_LIBRARIES)
	SET(MAPM_INCLUDE_DIRS)
ENDIF(MAPM_FOUND)

MARK_AS_ADVANCED(MAPM_INCLUDE_DIRS MAPM_LIBRARIES)
