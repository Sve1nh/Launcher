@echo off
chcp 65001
setlocal

REM === 1. Проверка наличия git ===
where git >nul 2>nul
if errorlevel 1 (
    echo Git не найден. Устанавливаем
    winget install --id Git.Git -e --source winget
) else (
    echo Git найден.
)

REM === 2. Клонирование или обновление репозитория ===
set "REPO_URL=https://github.com/Sve1nh/Launcher.git"
set "INSTALL_DIR=%USERPROFILE%\minecraft-modpack"

if exist "%INSTALL_DIR%\.git" (
    echo Обновляем модпак...
    pushd "%INSTALL_DIR%"
    git pull
    popd
) else (
    echo Клонируем модпак...
    git clone "%REPO_URL%" "%INSTALL_DIR%"
)

REM === 3. Запуск tLauncher.exe ===
set "TLAUNCHER_PATH=%INSTALL_DIR%\tLauncher.exe"

if exist "%TLAUNCHER_PATH%" (
    echo Запускаем tLauncher...
    start "" "%TLAUNCHER_PATH%"
) else (
    echo tLauncher.exe не найден! Проверьте содержимое репозитория.
    pause
    exit /b
)

echo Готово! Приятной игры :)
pause