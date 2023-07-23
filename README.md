# reverseshell-python-bash-ps1-batch
Debemos tener en cuenta que para que funcione está reverse shell debemos instalar python3 en windows desde cmd o powershell, también al ejecutar el archivo victima.py el defender lo detectará y te dirá si quieres ejecutarlo.
En este código solo debemos cambiar la dirección ip que aparece en el archivo atacante.py con la dirección de la victima.
En la versión atacanteV2.py el cliente podrá recibir datos del servidor y seguir aceptando comandos del usuario de forma concurrente, lo que evitará que se congele la consola o la reverse shell. Se utiliza el módulo threading en Python para crear hilos y gestionar las interacciones con el servidor de forma simultánea.

El archivo victima.bat es para ejecutar en la máquina windows, aún me falta mejorarlo para poder ocultarlo y mantener una conexión a pesar de cerrar la consola.

El archivo servidor.ps1 contiene un script sencillo para ejecutarlo en la máquina windows y con el archivo cliente.sh hacer la conexión desde la máquina kali. Con el archivo servidor.bat podemos ejecutar el script de manera más directa. Cabe destacar que al ejecutar el script victima.py o servidor.ps1 el antivirus o defender lo detectará y te preguntará si quieres ejecutarlo.
Estos sencillos scripts le falta técnica de ofuscación y evasión mucho más complejas, pero es algo simple para ir empezando y comprendiendo.
