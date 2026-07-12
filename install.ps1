Clear-Host
Write-Host "██████╗ ██╗   ██╗██████╗  █████╗ ███████╗███████╗" -ForegroundColor Cyan
Write-Host "██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝" -ForegroundColor Cyan
Write-Host "██████╔╝ ╚████╔╝ ██████╔╝███████║███████╗█████╗  " -ForegroundColor Cyan
Write-Host "██╔══██╗  ╚██╔╝  ██╔═══╝ ██╔══██║╚════██║██╔══╝  " -ForegroundColor Cyan
Write-Host "██████╔╝   ██║   ██║     ██║  ██║███████║███████╗" -ForegroundColor Cyan
Write-Host "╚══════╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝" -ForegroundColor Cyan
Write-Host "       🚀 ASISTENTE DE INSTALACIÓN ANGEL-T DEV 🚀`n" -ForegroundColor Green

# 1. Configurar permisos y winget
Write-Host "🔓 Configurando permisos de ejecución..." -ForegroundColor Yellow
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force | Out-Null

Write-Host "📦 Instalando/Actualizando Oh My Posh..." -ForegroundColor Yellow
winget install JanDeDobbeleer.OhMyPosh --silent --accept-source-agreements --accept-package-agreements | Out-Null

# 2. Menú Interactivo de Temas
Write-Host "`n🎨 ¡Elige tu estilo visual para la terminal!" -ForegroundColor Green
Write-Host "1) Default      2) Cyberpunk    3) Dracula     4) Hacker      5) Tokyo" -ForegroundColor Gray
Write-Host "6) Monokai      7) Ocean        8) Synthwave   9) Gruvbox     10) Minimal" -ForegroundColor Gray

$seleccion = Read-Host "`nSelecciona un número (1-10)"

# Diccionario para mapear la selección al nombre del archivo
$temas = @{
    "1"  = "angel-default";   "2"  = "angel-cyberpunk"; "3"  = "angel-dracula"
    "4"  = "angel-hacker";    "5"  = "angel-tokyo";     "6"  = "angel-monokai"
    "7"  = "angel-ocean";     "8"  = "angel-synthwave"; "9"  = "angel-gruvbox"
    "10" = "angel-minimal"
}

$temaElegido = $temas[$seleccion]
if (-not $temaElegido) {
    Write-Host "⚠️ Selección inválida. Se aplicará el tema Default por seguridad." -ForegroundColor OpenbgColor
    $temaElegido = "angel-default"
}

# 3. Descargar el tema seleccionado desde TU GitHub
Write-Host "`n📥 Descargando tema personalizado [$temaElegido]..." -ForegroundColor Yellow
$urlTema = "https://raw.githubusercontent.com/angeltarcayadev/Terminal-Setup/main/Themes/$temaElegido.omp.json"
$rutaDestino = "$HOME\$temaElegido.omp.json"
Invoke-WebRequest -Uri $urlTema -OutFile $rutaDestino | Out-Null

# 4. Inyectar el tema en el perfil de PowerShell
Write-Host "📝 Configurando tu perfil del sistema..." -ForegroundColor Yellow
if (-not (Test-Path $PROFILE)) { New-Item -Type File -Path $PROFILE -Force | Out-Null }

$lineaComando = "oh-my-posh init pwsh --config '$rutaDestino' | Invoke-Expression"
Set-Content -Path $PROFILE -Value $lineaComando

Write-Host "`n✅ ¡Instalación completada con éxito!" -ForegroundColor Green
Write-Host "Cierra esta terminal y abre una nueva para ver tu tema de nivel profesional." -ForegroundColor Cyan