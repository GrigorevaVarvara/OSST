@echo off
setlocal enabledelayedexpansion

set "target_dir=%~1"
set "target_year=%~2"

if not exist "%target_dir%" (
    echo Error: Directory does not exist
    exit /b 1
)

echo Processing directory: %target_dir%
echo Searching for files from Jan-Jun %target_year%
echo.

set file_count=0

REM Создаем массив для хранения файлов
set "files[0]="

for /f "tokens=1-3,*" %%a in ('dir "%target_dir%" /a-d /tc ^| findstr "^[0-9]"') do (
    set "file_date=%%a"
    set "file_time=%%b"
    set "file_period=%%c"
    set "file_name=%%d"
    
    for /f "tokens=1-3 delims=." %%d in ("!file_date!") do (
        set "day=%%d"
        set "month=%%e"
        set "year=%%f"
    )
    
    if "!year!"=="%target_year%" (
        if !month! geq 1 if !month! leq 6 (
            set /a file_count+=1
            set "files[!file_count!]=!file_name! - !file_date! !file_time!"
        )
    )
)

if !file_count! equ 0 (
    echo No files found.
) else (
    for /l %%i in (1,1,!file_count!) do (
        echo !files[%%i]!
    )
)

echo.
echo Total files found: !file_count!
endlocal