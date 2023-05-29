$menu = 1
while ($menu -lt 6 -and $menu -gt 0) {
	Write-Host ""
	Write-Host "Elija una opcion escribiendo su respectivo numero:"
	Write-Host "1. Estadisticas para los protocolos TCP, UDP, ICMP e IP."
	Write-Host "2. Informacion sobre los adapatadores de red."
	Write-Host "3. Informacion de todas las interfaces de red activas e inactivas."
	Write-Host "4. Entradas de la tabla de enrutamiento IPv4."
	Write-Host "5. Estadisticas de Ethernet."
	Write-Host "Para salir del menu de opciones cualquier otro numero."
	$menu = Read-Host
	Write-Host ""
	switch ($menu) {
		1 {
			netstat -s
		} 2 {
			Get-NetAdapter
		} 3 {
			ipconfig /all
		} 4 {
			route PRINT -4
		} 5 {
			netstat -e
		}
	}
}