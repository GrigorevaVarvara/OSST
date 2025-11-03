@ECHO OFF
ECHO Setting up Git configuration

REM Check if parameters are provided
IF "%1"=="" (
    ECHO Error: No username provided
    ECHO Usage: %0 "Your Name" "your@email.com"
    PAUSE
    EXIT /B 1
)

IF "%2"=="" (
    ECHO Error: No email provided
    ECHO Usage: %0 "Your Name" "your@email.com"
    PAUSE
    EXIT /B 1
)

REM Set user name
git config --global user.name "%1"

REM Set user email
git config --global user.email "%2"

ECHO Git configuration completed!
ECHO User name: "%1"
ECHO User email: "%2"
ECHO.
ECHO Press any key to remove Git configuration...
PAUSE >nul
s
REM Remove configuration
git config --global --unset user.name
git config --global --unset user.email

ECHO Git configuration removed!
ECHO Press any key to exit...
PAUSE >nul