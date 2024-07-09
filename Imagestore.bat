@echo off

echo "C:\tools\ImageStore\imagestore-admin-main\imagestore-admin-main\micronet"
:: =========================================
::    Edit your django project directory
:: =========================================
cd micronet


echo Now Server will be run at port 8020 by default
:: =========================================
::		Run command (You can change it)
:: if you change this part, should be change
::			openBrowser.bat File
:: =========================================
python manage.py runserver 0.0.0.0:8020
pause