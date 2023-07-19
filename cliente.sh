#!/bin/bash

# Cambiar la siguiente línea por la dirección IP de la máquina Windows (servidor)
SERVER_IP="direccion_ip_máquina_windows"

# Cambiar el siguiente puerto por el puerto en el que escucha el servidor en la máquina Windows
SERVER_PORT=443

# Función para enviar y recibir datos con el servidor
function communicate_with_server {
    # Establecer conexión con el servidor en la máquina Windows
    exec 3<> /dev/tcp/"$SERVER_IP"/"$SERVER_PORT"

    # Función para enviar comando al servidor
    function send_command {
        echo "$1" >&3
    }

    # Función para recibir resultados del servidor
    function receive_results {
        cat <&3
    }

    # Leer y enviar comandos desde el usuario al servidor
    while read -p "Comando: " command; do
        # Salir si el usuario ingresa "exit"
        if [ "$command" == "exit" ]; then
            send_command "$command"
            break
        fi

        # Enviar el comando al servidor
        send_command "$command"

        # Recibir y mostrar los resultados del servidor
        receive_results
    done

    # Cerrar la conexión
    exec 3>&-
}

# Iniciar la comunicación con el servidor
communicate_with_server
