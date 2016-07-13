@ECHO OFF

SET GIT=..\_Bin\Git\cmd\git.exe
SET MUPDF_SOURCE_URL=http://git.ghostscript.com/mupdf.git
SET SOURCE_DIR=Unmanaged\MuPDF
SET GIT_DIR=%SOURCE_DIR%\.git

ECHO Updating MuPDF sources...
IF EXIST %SOURCE_DIR% GOTO DeleteSourceDir

:GetSource
ECHO Dowloading MuPDF sources...
ECHO.
%GIT% clone --recursive %MUPDF_SOURCE_URL% %SOURCE_DIR%
ECHO.
IF EXIST %GIT_DIR% GOTO DeleteGitDir

:Done
ECHO MuPDF sources update done
ECHO.
PAUSE
GOTO End

:DeleteSourceDir
ECHO Deleting old MuPDF sources...
RD %SOURCE_DIR% /S /Q
GOTO GetSource

:DeleteGitDir
ECHO Deleting Git system files...
RD %GIT_DIR%\ /S /Q
DEL %SOURCE_DIR%\.git /S /Q
DEL %SOURCE_DIR%\.gitattributes /S /Q
DEL %SOURCE_DIR%\.gitignore /S /Q

GOTO Done

:End