@echo off
set "SRC=%USERPROFILE%\.config\opencode\ast-grep-rules"
set "DST=%CD%"
if not exist "%SRC%" (
  echo Global ast-grep template not found at %SRC%
  echo Run the OpenCode tool-setup first.
  exit /b 1
)
copy /Y "%SRC%\sgconfig.yml" "%DST%" >nul
if not exist "%DST%\rules" mkdir "%DST%\rules"
xcopy /Y /E /I "%SRC%\rules" "%DST%\rules" >nul
echo ast-grep config copied to %DST%
echo Run 'ast-grep scan' to lint the project.
