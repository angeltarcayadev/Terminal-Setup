# =====================================================================
# INSTALADOR AUTOMÁTICO DE TERMINAL ESTILO ANIME / HACKER
# =====================================================================

# ---------------------------------------------------------------------
# ⚙️ ZONA DE CONFIGURACIÓN DINÁMICA
# ---------------------------------------------------------------------

$MiNombre = $env:TERMINAL_NOMBRE
if (-not $MiNombre) { $MiNombre = $env:USER_NAME }
if (-not $MiNombre) { $MiNombre = "Angel-T Dev" }

$temaElegido = $env:TERMINAL_TEMA
if (-not $temaElegido) { $temaElegido = $env:SELECTED_THEME }
if (-not $temaElegido) { $temaElegido = "oficial_premium" }

$GlobalTemaElegido = $temaElegido

switch ($temaElegido) {
    "oficial_premium"  { $ColorArteAscii = "Blue" }
    "custom_pastel"    { $ColorArteAscii = "Cyan" }
    "custom_palette"   { $ColorArteAscii = "Yellow" }
    "custom_minimal"   { $ColorArteAscii = "White" }
    "custom_powerline" { $ColorArteAscii = "Blue" }
    "custom_split"     { $ColorArteAscii = "Magenta" }
    "custom_neon"      { $ColorArteAscii = "Cyan" }
    "custom_aqua"      { $ColorArteAscii = "Cyan" }
    "custom_dev"       { $ColorArteAscii = "Green" }
    "cyberpunk" { $ColorArteAscii = "Cyan" }
    "dracula"   { $ColorArteAscii = "Magenta" }
    "hacker"    { $ColorArteAscii = "Green" }
    "tokyonight_storm" { $ColorArteAscii = "Blue" }
    "monokai"   { $ColorArteAscii = "Yellow" }
    "blue-owl"  { $ColorArteAscii = "Cyan" }
    "synthwave" { $ColorArteAscii = "Magenta" }
    "gruvbox"   { $ColorArteAscii = "Yellow" }
    "minimal"   { $ColorArteAscii = "White" }
    "catppuccin_mocha" { $ColorArteAscii = "Magenta" }
    "cobalt2"   { $ColorArteAscii = "Yellow" }
    "night-owl" { $ColorArteAscii = "Blue" }
    "nord"      { $ColorArteAscii = "Cyan" }
    "agnoster"  { $ColorArteAscii = "Blue" }
    "material"  { $ColorArteAscii = "Cyan" }
    "spaceship" { $ColorArteAscii = "Magenta" }
    "powerlevel10k_rainbow" { $ColorArteAscii = "Yellow" }
    "paradox"   { $ColorArteAscii = "Green" }
    default     { $ColorArteAscii = "Red" }
}

$envColorAscii = $env:TERMINAL_COLOR_ASCII
if ($envColorAscii -and $envColorAscii -ne "auto") {
    $ColorArteAscii = $envColorAscii
}

# Letras gigantes (Genera las tuyas en: https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow)
$ArteAsciiGigante = @"
  █████╗ ███╗   ██╗ ██████╗ ███████╗██╗     ████████╗ █████╗ ██████╗  ██████╗  █████╗ ██╗   ██╗ █████╗ 
 ██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║     ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔══██╗╚██╗ ██╔╝██╔══██╗
 ███████║██╔██╗ ██║██║  ███╗█████╗  ██║        ██║   ███████║██████╔╝██║      ███████║ ╚████╔╝ ███████║
 ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║        ██║   ██╔══██║██╔══██╗██║      ██╔══██║  ╚██╔╝  ██╔══██║
 ██║  ██║██║ ╚████║╚██████╔╝███████╗███████╗   ██║   ██║  ██║██║  ██║╚██████╔╝██║  ██║   ██║   ██║  ██║
 ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
"@

# ---------------------------------------------------------------------
# 🚀 FIN DE CONFIGURACIÓN - ¡NO TOCAR EL CÓDIGO DE ABAJO!
# ---------------------------------------------------------------------

Clear-Host
Write-Host "🚀 Iniciando la instalación del entorno ($temaElegido) para $MiNombre..." -ForegroundColor Cyan

# 0. Desbloquear permisos de PowerShell
Write-Host "🔓 Configurando permisos de ejecución..." -ForegroundColor Yellow
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force | Out-Null

# 1. Crear carpeta de configuración
$PowerShellDir = "$HOME\Documents\PowerShell"
if (-not (Test-Path $PowerShellDir)) {
    New-Item -ItemType Directory -Force -Path $PowerShellDir | Out-Null
}

# 2. Instalar Oh My Posh
Write-Host "📦 Instalando motor gráfico (Oh My Posh)..." -ForegroundColor Yellow
winget install JanDeDobbeleer.OhMyPosh -s winget --silent --accept-package-agreements | Out-Null

# 3. Instalar Iconos
Write-Host "📂 Instalando motor de iconos..." -ForegroundColor Yellow
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force -AcceptLicense | Out-Null

# 3.5. Instalar Fuentes Nerd Font automáticamente
Write-Host "📥 Descargando e instalando fuentes necesarias..." -ForegroundColor Yellow
$FontsFolder = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
if (-not (Test-Path $FontsFolder)) {
    New-Item -ItemType Directory -Force -Path $FontsFolder | Out-Null
}
$RegistryPath = "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
$FontsToInstall = @(
    @{ Name="FiraCodeNerdFontMono-Regular.ttf"; Url="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFontMono-Regular.ttf"; RegName="FiraCode Nerd Font Mono (TrueType)" },
    @{ Name="CaskaydiaCoveNerdFont-Regular.ttf"; Url="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Regular/CaskaydiaCoveNerdFont-Regular.ttf"; RegName="CaskaydiaCove Nerd Font (TrueType)" }
)
foreach ($font in $FontsToInstall) {
    $FontPath = Join-Path $FontsFolder $font.Name
    if (-not (Test-Path $FontPath)) {
        try {
            Invoke-WebRequest -Uri $font.Url -OutFile $FontPath -UseBasicParsing
            Set-ItemProperty -Path $RegistryPath -Name $font.RegName -Value $FontPath
        } catch {
            Write-Host "❌ Error al descargar $($font.Name)." -ForegroundColor Red
        }
    }
}

# 4. Descargar Tema Oficial de Angel-T Dev
Write-Host "🎨 Descargando el tema '$GlobalTemaElegido'..." -ForegroundColor Yellow
$ThemePath = "$PowerShellDir\custom-theme.omp.json"
$ThemeUrl = "https://raw.githubusercontent.com/angeltarcayadev/terminal-setup-style/main/themes/$GlobalTemaElegido.omp.json"

try {
    Invoke-WebRequest -Uri $ThemeUrl -OutFile $ThemePath -UseBasicParsing
    Write-Host "✅ Tema descargado con éxito." -ForegroundColor Green
} catch {
    Write-Host "❌ Error al descargar el tema $GlobalTemaElegido. Verifica tu conexión a internet." -ForegroundColor Red
}

# 5. Configurar el Perfil y Arte ASCII Dinámico
Write-Host "📝 Inyectando perfil en el sistema..." -ForegroundColor Yellow

# Preparar el arte ASCII escapando comillas
$ArteSafe = $ArteAsciiGigante -replace '"', '`"'

$ProfileCode = @"
Invoke-Expression (@(& 'oh-my-posh' init pwsh --config '~\Documents\PowerShell\custom-theme.omp.json') -join "`n")
Import-Module Terminal-Icons

`$global:OmpPrompt = `$function:prompt
`$global:FirstTerminalRun = `$true

function prompt {
    if (`$global:FirstTerminalRun) {
        Clear-Host
        Write-Host " "
        Write-Host `"$ArteSafe`" -ForegroundColor $ColorArteAscii
        Write-Host " "
        `$global:FirstTerminalRun = `$false
    }
    & `$global:OmpPrompt
}
"@
Set-Content -Path $PROFILE -Value $ProfileCode -Encoding UTF8

Write-Host "`n✅ ¡Instalación completa!" -ForegroundColor Green
Write-Host "⚠️  IMPORTANTE: Cierra esta ventana y abre una nueva terminal para disfrutar tu nuevo entorno." -ForegroundColor Cyan