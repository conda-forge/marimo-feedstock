@echo on

bash %RECIPE_DIR%/build_win.sh
IF %ERRORLEVEL% NEQ 0 exit 1

"%PYTHON%" -m pip install . -vv --no-deps --no-build-isolation
IF %ERRORLEVEL% NEQ 0 exit 1

:: menu (menuinst)
mkdir "%PREFIX%\Menu"
IF %ERRORLEVEL% NEQ 0 exit 1

"%PYTHON%" -c "import os, re; open(os.path.join(os.environ['PREFIX'], 'Menu', 'marimo-menu.json'), 'w').write(re.sub('__PKG_VERSION__', os.environ['PKG_VERSION'], open(os.path.join(os.environ['RECIPE_DIR'], 'menu.json')).read()))"
IF %ERRORLEVEL% NEQ 0 exit 1

copy "%RECIPE_DIR%\marimo.ico" "%PREFIX%\Menu\"
IF %ERRORLEVEL% NEQ 0 exit 1
