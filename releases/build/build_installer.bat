@echo off

REM --- Configuration ---
set "PROJECT_ROOT=C:\Users\Felix\PycharmProjects\PotPlayer_Chatgpt_Translate"
set "VENV_PYTHON=%PROJECT_ROOT%\.venv\Scripts\python.exe"
set "VENV_DIR=%PROJECT_ROOT%\.venv\Scripts"
set "BUILD_DIR=%PROJECT_ROOT%\releases\build"
set "PREPARED_INSTALLER_SCRIPT=%BUILD_DIR%\installer_preped.py"

REM --- Step 1: Prepare installer script ---
echo "Preparing installer script by injecting version number..."
cd "%BUILD_DIR%"
"%VENV_PYTHON%" "prepare_installer.py"
if %errorlevel% neq 0 (
    echo "Failed to prepare installer script. Aborting."
    cd "%VENV_DIR%"
    exit /b %errorlevel%
)

REM --- Step 2: Build the installer ---
echo "Building installer with PyInstaller..."
cd "%VENV_DIR%"
"%VENV_PYTHON%" -m PyInstaller -F -w --clean --uac-admin --collect-all openai --collect-submodules httpx --collect-submodules anyio --distpath "%PROJECT_ROOT%\releases\latest" --name installer --icon "%PROJECT_ROOT%\icon.ico" --add-data "%PROJECT_ROOT%\SubtitleTranslate - ChatGPT.as;." --add-data "%PROJECT_ROOT%\SubtitleTranslate - ChatGPT.ico;." --add-data "%PROJECT_ROOT%\SubtitleTranslate - ChatGPT - Without Context.as;." --add-data "%PROJECT_ROOT%\SubtitleTranslate - ChatGPT - Without Context.ico;." --add-data "%BUILD_DIR%\language_strings.json;." --add-data "%BUILD_DIR%\model_token_limits.json;." --add-data "%PROJECT_ROOT%\LICENSE;." "%PREPARED_INSTALLER_SCRIPT%"

REM --- Step 3: Cleanup ---
echo "Cleaning up temporary files..."
rmdir /s /q build
del /f /q installer.spec
del /f /q "%PREPARED_INSTALLER_SCRIPT%"

echo "Installer build process finished."