$DriveLetter = "C" # Cambia la letra de la unidad según la que desees crear la imagen de disco
$ImagePath = "C:\Users\Usuario\Documents\ImageBackup.wim" # Cambia la ruta de la imagen de disco según la que desees utilizar

New-Item -ItemType Directory -Force -Path $ImagePath.Substring(0, $ImagePath.LastIndexOf("\"))

New-Item -ItemType File -Path $ImagePath -Force

$Wimcmd = "New-WindowsImage -CapturePath $DriveLetter\ -ImagePath $ImagePath -Name 'Windows 10 Image Backup' -Description 'Image Backup created on $(Get-Date)' -Verify -CompressionType Maximum"

Invoke-Expression $Wimcmd
