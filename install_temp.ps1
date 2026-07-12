# =====================================================================
# INSTALADOR PROFESIONAL: TERMINAL SETUP - ANGEL-T DEV
# =====================================================================

$MiNombre = "Angel-T Dev"
$ColorArteAscii = "Red"
$ArteAsciiGigante = @"
  █████╗ ███╗   ██╗ ██████╗ ███████╗██╗     ████████╗ █████╗ ██████╗  ██████╗  █████╗ ██╗   ██╗ █████╗ 
 ██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║     ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔══██╗╚██╗ ██╔╝██╔══██╗
 ███████║██╔██╗ ██║██║  ███╗█████╗  ██║        ██║   ███████║██████╔╝██║      ███████║ ╚████╔╝ ███████║
 ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║        ██║   ██╔══██║██╔══██╗██║      ██╔══██║  ╚██╔╝  ██╔══██║
 ██║  ██║██║ ╚████║╚██████╔╝███████╗███████╗   ██║   ██║  ██║██║  ██║╚██████╔╝██║  ██║   ██║   ██║  ██║
 ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
"@

Clear-Host
Write-Host "$ArteAsciiGigante" -ForegroundColor $ColorArteAscii
Write-Host "`n🚀 Iniciando instalación profesional de Angel-T Dev..." -ForegroundColor Cyan

# 1. Configuración inicial
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force | Out-Null
winget install JanDeDobbeleer.OhMyPosh -s winget --silent --accept-package-agreements | Out-Null
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force -AcceptLicense | Out-Null

# 2. Biblioteca de Temas
$temas = @{
    "1"="angel-default"; "2"="angel-cyberpunk"; "3"="angel-dracula"; "4"="angel-hacker"; "5"="angel-tokyo"
    "6"="angel-monokai"; "7"="angel-ocean"; "8"="angel-synthwave"; "9"="angel-gruvbox"; "10"="angel-minimal"
}

Write-Host "`n🎨 ELIGE TU TEMA DE LA BIBLIOTECA:" -ForegroundColor Green
foreach ($i in 1..10) { Write-Host "$i) $($temas[[string]$i])" -ForegroundColor Gray }
$sel = Read-Host "`nSelecciona el número (1-10)"
$temaElegido = if ($temas.ContainsKey($sel)) { $temas[$sel] } else { "angel-default" }

# 3. Descarga e instalación
$PowerShellDir = "$HOME\Documents\PowerShell"
if (-not (Test-Path $PowerShellDir)) { New-Item -ItemType Directory -Force -Path $PowerShellDir | Out-Null }

$url = "https://raw.githubusercontent.com/angeltarcayadev/Terminal-Setup/main/Themes/$temaElegido.omp.json"
$rutaTema = "$PowerShellDir\theme.omp.json"

Write-Host "`n📥 Descargando tema '$temaElegido'..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $url -OutFile $rutaTema -UseBasicParsing | Out-Null

# 4. Inyección en el Perfil
$ProfileCode = @"
oh-my-posh init pwsh --config '$rutaTema' | Invoke-Expression
Import-Module Terminal-Icons

function prompt {
    if (`$global:FirstRun -ne `$false) {
        Clear-Host
        Write-Host @"
$ArteAsciiGigante
"@ -ForegroundColor $ColorArteAscii
        `$global:FirstRun = `$false
    }
    return (& 'oh-my-posh' print primary)
}
"@
Set-Content -Path $PROFILE -Value $ProfileCode -Encoding UTF8

Write-Host "`n✅ ¡Instalación exitosa! Tu terminal ahora usa el tema: $temaElegido" -ForegroundColor Green
Write-Host "👉 Abre una terminal nueva para ver los cambios." -ForegroundColor Cyan