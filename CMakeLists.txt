# Copyright (C) 2007-2009 LuaDist.
# Created by Peter Kapec
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

PROJECT(mapm C)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
INCLUDE(dist.cmake)

# Build
SET( MAPM_SRCS
	mapm_add.c
	mapm_cpi.c
	mapm_div.c
	mapm_exp.c
	mapm_fam.c
	mapm_fft.c
	mapm_flr.c
	mapm_fpf.c
	mapm_gcd.c
	mapm_log.c
	mapm_lg2.c
	mapm_lg3.c
	mapm_lg4.c
	mapm_mul.c
	mapm_pow.c
	mapm_rcp.c
	mapm_rnd.c
	mapm_set.c
	mapm_sin.c
	mapm5sin.c
	mapmasin.c
	mapmasn0.c
	mapmcbrt.c
	mapmcnst.c
	mapmfact.c
	mapmfmul.c
	mapmgues.c
	mapmhasn.c
	mapmhsin.c
	mapmipwr.c
	mapmistr.c
	mapmpwr2.c
	mapmrsin.c
	mapmsqrt.c
	mapmstck.c
	mapmutil.c
	mapmutl1.c
	mapmutl2.c
	)


# MAPM library
ADD_LIBRARY(mapm SHARED ${MAPM_SRCS} libmapm.def)
IF(UNIX) 
	TARGET_LINK_LIBRARIES(mapm m)
ENDIF()

IF(MSVC)
	SET_TARGET_PROPERTIES(mapm PROPERTIES OUTPUT_NAME libmapm CLEAN_DIRECT_OUTPUT 1 )
ENDIF()
#~2DO: is this necessary? --djm

# optional demo programs
OPTION(MAPM_DEMOS "build demo programs?" NO)
IF(MAPM_DEMOS)
	ADD_EXECUTABLE(calc calc.c)
	ADD_EXECUTABLE(primenum primenum.c)
	ENABLE_LANGUAGE(CXX)
	ADD_EXECUTABLE(cpp_demo cpp_demo.cpp)
	TARGET_LINK_LIBRARIES(calc mapm)
	TARGET_LINK_LIBRARIES(primenum mapm)
	TARGET_LINK_LIBRARIES(cpp_demo mapm)
ENDIF(MAPM_DEMOS)

INCLUDE(CTest)
IF(BUILD_TESTING)
	ADD_EXECUTABLE(validate validate.c)
	TARGET_LINK_LIBRARIES(validate mapm)
	ADD_TEST(validate validate)
ENDIF(BUILD_TESTING)


# Install
INSTALL(TARGETS mapm DESTINATION ${INSTALL_LIB})
INSTALL(FILES m_apm.h m_apm_lc.h DESTINATION ${INSTALL_INC})
INSTALL(DIRECTORY DOCS/ DESTINATION ${INSTALL_DOC})
