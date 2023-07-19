#!/bin/bash

# Dirección IP y Puerto del servidor
serverIP="IP_DEL_SERVIDOR"
serverPort=443

# Establecer conexión con el servidor
exec 3<>/dev/tcp/$serverIP/$serverPort

# Bucle para leer comandos del usuario y enviarlos al servidor
while true; do
    # Leer el comando ingresado por el usuario
    read -p "Ingrese un comando (o 'exit' para salir): " command

    # Salir si el comando es 'exit'
    if [ "$command" = "exit" ]; then
        echo "exit" >&3
        break
    fi

    # Enviar el comando al servidor
    echo "$command" >&3

    # Leer la respuesta del servidor y mostrarla en la máquina cliente
    while IFS= read -r -t 0.1 -u 3 line; do
        echo "$line"
    done
done

# Cerrar la conexión
exec 3<&-
exec 3>&-
