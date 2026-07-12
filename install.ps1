# =====================================================================
# INSTALADOR PROFESIONAL: TERMINAL SETUP - ANGEL-T DEV
# =====================================================================

$MiNombre = $env:TERMINAL_NOMBRE
if (-not $MiNombre) { $MiNombre = $env:USER_NAME }
if (-not $MiNombre) { $MiNombre = "Angel-T Dev" }

$ColorArteAscii = "Red"
$ArteAsciiGigante = @"
  █████╗ ███╗   ██╗ ██████╗ ███████╗██╗     
 ██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║     
 ███████║██╔██╗ ██║██║  ███╗█████╗  ██║     
 ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║     
 ██║  ██║██║ ╚████║╚██████╔╝███████╗███████╗
 ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝
"@

Clear-Host
Write-Host $ArteAsciiGigante -ForegroundColor $ColorArteAscii
Write-Host "`n🚀 Iniciando instalación profesional para $MiNombre..." -ForegroundColor Cyan

# 1. Configuración inicial
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force | Out-Null
winget install JanDeDobbeleer.OhMyPosh -s winget --silent --accept-package-agreements | Out-Null
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force -AcceptLicense | Out-Null

# 2. Biblioteca de Temas
$temas = @{
    "1"="angel-default"; "2"="angel-cyberpunk"; "3"="angel-dracula"; "4"="angel-hacker"; "5"="angel-tokyo"
    "6"="angel-monokai"; "7"="angel-ocean"; "8"="angel-synthwave"; "9"="angel-gruvbox"; "10"="angel-minimal"
}

$temaElegido = $env:TERMINAL_TEMA
if (-not $temaElegido) { $temaElegido = $env:SELECTED_THEME }

if (-not $temaElegido) {
    Write-Host "`n🎨 ELIGE TU TEMA:" -ForegroundColor Green
    foreach ($i in 1..10) { Write-Host "$i) $($temas[[string]$i])" -ForegroundColor Gray }
    $sel = Read-Host "`nSelecciona el número (1-10)"
    $temaElegido = if ($temas.ContainsKey($sel)) { $temas[$sel] } else { "angel-default" }
} else {
    Write-Host "`n🎨 Usando tema preconfigurado: $temaElegido" -ForegroundColor Green
}

# 3. Descarga de archivos
$PowerShellDir = "$HOME\Documents\PowerShell"
if (-not (Test-Path $PowerShellDir)) { New-Item -ItemType Directory -Force -Path $PowerShellDir | Out-Null }

$rutaTema = "$PowerShellDir\theme.omp.json"
$rutaArte = "$PowerShellDir\arte.txt"

# Usar tema local si existe (para pruebas), si no, descargar de GitHub
$localTheme = "c:\Users\angel\Desktop\Terminal-Setup-1\Themes\$temaElegido.omp.json"
if (Test-Path $localTheme) {
    Write-Host "[INFO] Cargando tema local desde: $localTheme" -ForegroundColor Yellow
    Copy-Item -Path $localTheme -Destination $rutaTema -Force
} else {
    Write-Host "[INFO] Descargando tema de GitHub..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/angeltarcayadev/Terminal-Setup/main/Themes/$temaElegido.omp.json" -OutFile $rutaTema -UseBasicParsing | Out-Null
}

$ArteAsciiGigante | Out-File -FilePath $rutaArte -Encoding utf8

# Personalizar el nombre en el JSON del tema
$Json = Get-Content $rutaTema -Raw
$Json = $Json -replace "Angel-T Dev", $MiNombre
$Json | Set-Content $rutaTema

# 4. Inyección Profesional en el Perfil
$ProfileCode = @"
oh-my-posh init pwsh --config '$rutaTema' | Invoke-Expression
Import-Module Terminal-Icons

`$global:FirstRun = `$true
function prompt {
    if (`$global:FirstRun) {
        Clear-Host
        Get-Content '$rutaArte' | Write-Host -ForegroundColor $ColorArteAscii
        `$global:FirstRun = `$false
    }
    return (& 'oh-my-posh' print primary)
}
"@
Set-Content -Path $PROFILE -Value $ProfileCode -Encoding UTF8

Write-Host "`n✅ ¡Instalación exitosa! Tu terminal ahora usa: $temaElegido" -ForegroundColor Green