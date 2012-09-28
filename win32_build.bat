@echo on
@cls

@rem call win32_env.bat first

@set BuildOutputPath=%cd%\build

@mkdir %BuildOutputPath%

@perl Configure VC-WIN32 enable-static-engine --prefix=%BuildOutputPath%

@call ms\do_nasm

@nmake -f ms\ntdll.mak

@rem @nmake -f ms\ntdll.mak test

@nmake -f ms\ntdll.mak install

