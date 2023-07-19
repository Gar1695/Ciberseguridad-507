#!/bin/bash

# Función para leer datos del servidor y mostrarlos en la máquina cliente
function ReadData_TCP {
    param($Stream)
    $Buffer = New-Object Byte[] 1024
    $Encoding = New-Object System.Text.AsciiEncoding

    $Data = ""
    while ($Stream.DataAvailable) {
        $ReadBytes = $Stream.Read($Buffer, 0, $Buffer.Length)
        $Data += $Encoding.GetString($Buffer, 0, $ReadBytes)
    }

    Write-Output $Data
}

# Dirección IP y Puerto del servidor
$serverIP = "IP_DEL_SERVIDOR"
$serverPort = 443

# Establecer conexión con el servidor
$client = New-Object System.Net.Sockets.TcpClient
$client.Connect($serverIP, $serverPort)
$stream = $client.GetStream()

# Bucle para leer comandos del usuario y enviarlos al servidor
while ($true) {
    # Leer el comando ingresado por el usuario
    $command = Read-Host "Ingrese un comando (o 'exit' para salir)"

    # Salir si el comando es 'exit'
    if ($command -eq "exit") {
        break
    }

    # Enviar el comando al servidor
    $writer = New-Object System.IO.StreamWriter $stream
    $writer.WriteLine($command)
    $writer.Flush()

    # Leer la salida del comando ejecutado en el servidor y mostrarla en la máquina cliente
    $output = ReadData_TCP $stream
    Write-Output $output
}

# Cerrar la conexión y el cliente
$stream.Close()
$client.Close()


