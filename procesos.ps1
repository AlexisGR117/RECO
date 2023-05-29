while ($true) {
    Write-Host "Elija una opcion escribiendo su respectivo numero:"
    Write-Host "1. Ver los procesos que estan corriendo en el servidor"
    Write-Host "2. Buscar un proceso"
    Write-Host "3. Matar un proceso en ejecucion"
    Write-Host "4. Salir del menu de opciones"
    $menu = Read-Host "Opcion"
    switch ($menu) {
        "1" {
            tasklist /fi "status eq running" /fo table
        }
        "2" {
            $proceso = Read-Host "Ingrese el nombre del proceso que quiere buscar"
            tasklist | findstr $proceso
        }
        "3" {
            $idproceso = Read-Host "Ingrese el PID del proceso que quiere matar"
            taskkill /pid $idproceso /f
        }
        "4" {
            exit
        }
        Default {
            Write-Host "Opcion invalida. Intente de nuevo."
        }
    }
}