param (
    [Parameter(Mandatory=$true)]
    [string]$DirectorioArranque,
    [Parameter(Mandatory=$true)]
    [int]$NumeroArchivos,
    [Parameter(Mandatory=$true)]
    [long]$TamanoMaximo,
    [string]$NombreArchivo
)

# Recorre el file system desde el directorio arranque, incluyendo subdirectorios
$archivos = Get-ChildItem -Path $DirectorioArranque -Recurse -File

if ($NombreArchivo) {
    # Buscar nombre
    $archivos = $archivos | Where-Object {$_.Name -like "*$NombreArchivo*"}
}

if ($archivos) {
    # Filtra los archivos por tamaño
    $archivos = $archivos | Where-Object {$_.Length -lt $TamanoMaximo}
    # Ordena los archivos por tamaño y muestra los n más pequeños
    $archivos = $archivos | Sort-Object -Property Length | Select-Object -First $NumeroArchivos
    # Muestra la información de los archivos seleccionados
    foreach ($archivo in $archivos) {
	$direccion = $archivo.FullName 
	$nombreArchivo = (Split-Path $direccion -Leaf)
    	$rutaArchivo = (Split-Path $direccion -Parent)
   	$tamanoArchivo = (Get-Item $direccion).Length
    	Write-Host "$nombreArchivo`t`t$rutaArchivo`t`t$tamanoArchivo"
    }
} else {
    Write-Host "No se encontraron archivos."
}
