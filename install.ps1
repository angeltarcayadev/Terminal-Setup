# =====================================================================
# INSTALADOR PROFESIONAL: TERMINAL SETUP - ANGEL-T DEV
# =====================================================================

$MiNombre = "Angel-T Dev"
$ColorArteAscii = "Red"
$ArteAsciiGigante = @"
  "██████╗ ██╗   ██╗██████╗  █████╗ ███████╗███████╗"
  "██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝"
  "██████╔╝ ╚████╔╝ ██████╔╝███████║███████╗█████╗  "
  "██╔══██╗  ╚██╔╝  ██╔═══╝ ██╔══██║╚════██║██╔══╝  "
  "██████╔╝   ██║   ██║     ██║  ██║███████║███████╗"
  "╚══════╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝"
"@

Clear-Host
Write-Host $ArteAsciiGigante -ForegroundColor $ColorArteAscii
Write-Host "`n🚀 Iniciando instalación profesional..." -ForegroundColor Cyan

# 1. Configuración inicial
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force | Out-Null
winget install JanDeDobbeleer.OhMyPosh -s winget --silent --accept-package-agreements | Out-Null
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force -AcceptLicense | Out-Null

# 2. Biblioteca de Temas
$temas = @{
    "1"="angel-default"; "2"="angel-cyberpunk"; "3"="angel-dracula"; "4"="angel-hacker"; "5"="angel-tokyo"
    "6"="angel-monokai"; "7"="angel-ocean"; "8"="angel-synthwave"; "9"="angel-gruvbox"; "10"="angel-minimal"
}

Write-Host "`n🎨 ELIGE TU TEMA:" -ForegroundColor Green
foreach ($i in 1..10) { Write-Host "$i) $($temas[[string]$i])" -ForegroundColor Gray }
$sel = Read-Host "`nSelecciona el número (1-10)"
$temaElegido = if ($temas.ContainsKey($sel)) { $temas[$sel] } else { "angel-default" }

# 3. Descarga de archivos
$PowerShellDir = "$HOME\Documents\PowerShell"
if (-not (Test-Path $PowerShellDir)) { New-Item -ItemType Directory -Force -Path $PowerShellDir | Out-Null }

$rutaTema = "$PowerShellDir\theme.omp.json"
$rutaArte = "$PowerShellDir\arte.txt"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/angeltarcayadev/Terminal-Setup/main/Themes/$temaElegido.omp.json" -OutFile $rutaTema -UseBasicParsing | Out-Null
$ArteAsciiGigante | Out-File -FilePath $rutaArte -Encoding utf8

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