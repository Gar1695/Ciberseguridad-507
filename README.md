# reverseshell-python
Debemos tener en cuenta que para que funcione está reverse shell debemos instalar python3 en windows desde cmd o powershell, también al ejecutar el archivo víctima.py el defender lo detectará y te dirá si quieres ejecutarlo.
En este código solo debemos cambiar la dirección ip que aparece en el archivo atacante.py con la dirección de la víctima.
En la versión atacanteV2.py el cliente podrá recibir datos del servidor y seguir aceptando comandos del usuario de forma concurrente, lo que evitará que se congele la consola o la reverse shell. Se utiliza el módulo threading en Python para crear hilos y gestionar las interacciones con el servidor de forma simultánea.
