@echo off
 
set int=0
 
for /f "usebackq delims=" %%a in ("%~1") do (
 for %%b in (%%a) do (
  for /f %%c in ('
   ^<nul set /p "=%%b"^| more^| findstr /r /c:"^[0-9][0-9]*$" /c:"^[+-][0-9][0-9]*$"
  ') do (
   set /a int+=1
   )
  )
 ) 
 
echo Integer = %int%