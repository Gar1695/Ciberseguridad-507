@echo off
setlocal

rem Configura la dirección y el puerto
set SERVER_ADDRESS=0.0.0.0
set SERVER_PORT=5000

rem Ejecuta el script Python en segundo plano
python victima.py %SERVER_ADDRESS% %SERVER_PORT%

endlocal
