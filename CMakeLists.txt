# Copyright (C) 2007-2012 LuaDist.
# Created by Peter Kapec
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

project ( mapm C )
cmake_minimum_required ( VERSION 2.8 )
include ( cmake/dist.cmake )

# Build
set ( MAPM_SRCS mapm_add.c mapm_cpi.c mapm_div.c mapm_exp.c mapm_fam.c mapm_fft.c 
  mapm_flr.c mapm_fpf.c mapm_gcd.c mapm_log.c mapm_lg2.c mapm_lg3.c mapm_lg4.c mapm_mul.c 
  mapm_pow.c mapm_rcp.c mapm_rnd.c mapm_set.c mapm_sin.c mapm5sin.c mapmasin.c mapmasn0.c 
  mapmcbrt.c mapmcnst.c mapmfact.c mapmfmul.c mapmgues.c mapmhasn.c mapmhsin.c mapmipwr.c 
  mapmistr.c mapmpwr2.c mapmrsin.c mapmsqrt.c mapmstck.c mapmutil.c mapmutl1.c mapmutl2.c )

# MAPM library
add_library ( mapm ${MAPM_SRCS} libmapm.def )
if ( UNIX )
  target_link_libraries ( mapm m )
endif ( )

if ( MSVC )
  set_target_properties ( mapm PROPERTIES OUTPUT_NAME libmapm CLEAN_DIRECT_OUTPUT 
    1 )
endif ( )
#~2DO: is this necessary? --djm

# optional demo programs
option ( MAPM_DEMOS "build demo programs?" NO )
if ( MAPM_DEMOS )
  add_executable ( calc calc.c )
  add_executable ( primenum primenum.c )
  enable_language ( CXX )
  add_executable ( cpp_demo cpp_demo.cpp )
  target_link_libraries ( calc mapm )
  target_link_libraries ( primenum mapm )
  target_link_libraries ( cpp_demo mapm )
endif ( MAPM_DEMOS )

include ( CTest )
if ( BUILD_TESTING )
  add_executable ( validate validate.c )
  target_link_libraries ( validate mapm )
  add_test ( validate validate )
endif ( BUILD_TESTING )

# Install
install_library ( mapm )
install_header ( m_apm.h m_apm_lc.h )
install_doc ( DOCS/ )
