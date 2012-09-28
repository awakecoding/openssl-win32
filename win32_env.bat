@echo off
@cls

@rem ***************************************************************
@rem Setup paths
@rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@set NasmPath=%LocalAppData%\nasm
@set ActivePerlPath=%SystemDrive%\Perl\bin
@set OpenSSLPath=%cd%
@set BuildOutputPath=%cd%\build
@rem ***************************************************************

@IF NOT "%NasmPath%" == "" set PATH=%NasmPath%;%PATH%
@IF NOT "%ActivePerlPath%" == "" set PATH=%ActivePerlPath%;%PATH%

@rem START

@%OpenSSLPathDir%
@cd %OpenSSLPath%

:VSCmdPromptSetup2012
@if "%VS110COMNTOOLS%" == "" goto VSCmdPromptSetup2010
@call "%VS110COMNTOOLS%vsvars32.bat"
goto EOF

:VSCmdPromptSetup2010
@if "%VS100COMNTOOLS%" == "" goto VSCmdPromptError
@call "%VS100COMNTOOLS%vsvars32.bat"
goto EOF

rem Errors
rem ***********************************************************
:VSCmdPromptError
@echo Could not find Visual Studio Command Prompt!
goto EOF

:EOF
@echo OpenSSL Win32 Build Environment Ready.
