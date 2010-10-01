@echo off
rem 
rem     Build batch file for MAPM library using Micro$oft 
rem     Visual C/C++ 6.0 under Win NT/9x
rem
rem     Note: run VCVARS32.BAT in /bin directory of VCPP first to set
rem           the environment variables.
rem 
echo.
echo Running build file for MAPM library with Visual CPP under Win NT/9x ...
echo.
rem
rem
      del map*.obj
      del mapm.lib
rem
rem (1) Compiles each map*.c and creates map*.obj:
rem
      cl /c /O2 /W3 /Zl map*.c
rem
rem
rem (2) Creates MAPM.LIB:
rem
      lib /OUT:mapm.lib map*.obj
rem
      del map*.obj
rem
rem
rem (3) Compiles and links validate.c, calc.c, primenum.c, and cpp_demo.cpp
rem
rem
      cl /c /O2 /ML calc.c
      link calc.obj mapm.lib
      del calc.obj
rem
rem
      cl /c /O2 /ML validate.c
      link validate.obj mapm.lib
      del validate.obj
rem
rem
      cl /c /O2 /ML primenum.c
      link primenum.obj mapm.lib
      del primenum.obj
rem
rem
      cl /c /O2 /ML cpp_demo.cpp
      link cpp_demo.obj mapm.lib
      del cpp_demo.obj
rem
rem
rem -------
rem      by M. Ring using 'mkalltcc.bat' as template
rem
