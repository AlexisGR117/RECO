$periodicidad=$args[1]
$p=$periodicidad.Substring($periodicidad.Length-1,1)
$n=[int]$periodicidad.Substring(0,$periodicidad.Length-1)

if ($p -eq "m") {
schtasks /create /tn $args[0] /tr "C:\Users\Administrador\Desktop\aplicaciones\$($args[0]).bat" /sc minute /mo $n
} elseif ($p -eq "h") {
schtasks /create /tn $args[0] /tr "C:\Users\Administrador\Desktop\aplicaciones\$($args[0]).bat" /sc hourly /mo $n
} elseif ($p -eq "d") {
schtasks /create /tn $args[0] /tr "C:\Users\Administrador\Desktop\aplicaciones\$($args[0]).bat" /sc daily /mo $n
} else {
Write-Output "La opcion no es valida debe ser m, h, y d."
}