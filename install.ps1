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
if (-not $temaElegido) { $temaElegido = "angel-default" }

switch ($temaElegido) {
    "angel-cyberpunk" { $ColorPrincipal = "#00FF9C"; $ColorSecundario = "#008F56"; $ColorArteAscii = "Cyan" }
    "angel-dracula"   { $ColorPrincipal = "#FF79C6"; $ColorSecundario = "#BD93F9"; $ColorArteAscii = "Magenta" }
    "angel-hacker"    { $ColorPrincipal = "#00FF00"; $ColorSecundario = "#008000"; $ColorArteAscii = "Green" }
    "angel-tokyo"     { $ColorPrincipal = "#7AA2F7"; $ColorSecundario = "#9ECE6A"; $ColorArteAscii = "Blue" }
    "angel-monokai"   { $ColorPrincipal = "#FD971F"; $ColorSecundario = "#F92672"; $ColorArteAscii = "Yellow" }
    "angel-ocean"     { $ColorPrincipal = "#00A8CC"; $ColorSecundario = "#142850"; $ColorArteAscii = "Cyan" }
    "angel-synthwave" { $ColorPrincipal = "#FF007F"; $ColorSecundario = "#3A0CA3"; $ColorArteAscii = "Magenta" }
    "angel-gruvbox"   { $ColorPrincipal = "#FE8019"; $ColorSecundario = "#D3869B"; $ColorArteAscii = "Yellow" }
    "angel-minimal"   { $ColorPrincipal = "#D4D4D4"; $ColorSecundario = "#808080"; $ColorArteAscii = "White" }
    default           { $ColorPrincipal = "#FF2A2A"; $ColorSecundario = "#990000"; $ColorArteAscii = "Red" }
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

# 4. Generar Tema JSON Dinámico
Write-Host "🎨 Aplicando tus colores y nombre..." -ForegroundColor Yellow
$ThemePath = "$PowerShellDir\custom-theme.omp.json"
$ThemeJSON = @'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "alignment": "left",
      "segments": [
        {
          "background": "{COLOR_PRINCIPAL}",
          "foreground": "#FFFFFF",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": " \uf415 {NOMBRE} ",
          "trailing_diamond": "\ue0c6",
          "type": "session"
        },
        {
          "background": "{COLOR_SECUNDARIO}",
          "foreground": "#FFFFFF",
          "leading_diamond": "\ue0c7",
          "options": { "style": "folder" },
          "style": "diamond",
          "template": " \uf07b {{ .Path }} ",
          "trailing_diamond": "\ue0c6",
          "type": "path"
        },
        {
          "background": "#424242",
          "foreground": "{COLOR_PRINCIPAL}",
          "leading_diamond": "\ue0c7",
          "options": { "branch_icon": "" },
          "style": "diamond",
          "template": " \uf126 {{ .HEAD }} ",
          "trailing_diamond": "\ue0c6",
          "type": "git"
        },
        {
          "background": "#2E2E2E",
          "foreground": "#E4F34A",
          "leading_diamond": "\ue0c7",
          "options": { "fetch_version": false },
          "style": "diamond",
          "template": " \ue235 {{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }}{{ end }} ",
          "trailing_diamond": "\ue0c6",
          "type": "python"
        },
        {
          "background": "#2E2E2E",
          "foreground": "#42E66C",
          "leading_diamond": "\ue0c7",
          "options": { "fetch_version": false },
          "style": "diamond",
          "template": " \ue718 {{ if .PackageManagerIcon }}{{ .PackageManagerIcon }} {{ end }}{{ .Full }} ",
          "trailing_diamond": "\ue0c6",
          "type": "node"
        },
        {
          "background": "#1A1A1A",
          "foreground": "#FFFFFF",
          "leading_diamond": "\ue0c7",
          "options": { "time_format": "15:04" },
          "style": "diamond",
          "template": " \uf017 {{ .CurrentDate | date .Format }} ",
          "trailing_diamond": "\ue0b4",
          "type": "time"
        }
      ],
      "type": "prompt"
    }
  ],
  "final_space": true,
  "version": 4
}
'@

# Aplicar reemplazos
$ThemeJSON = $ThemeJSON -replace '\{COLOR_PRINCIPAL\}', $ColorPrincipal
$ThemeJSON = $ThemeJSON -replace '\{COLOR_SECUNDARIO\}', $ColorSecundario
$ThemeJSON = $ThemeJSON -replace '\{NOMBRE\}', $MiNombre
Set-Content -Path $ThemePath -Value $ThemeJSON -Encoding UTF8

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