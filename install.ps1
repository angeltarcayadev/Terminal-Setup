# =====================================================================
# INSTALADOR AUTOMÁTICO DE TERMINAL ESTILO ANIME / HACKER
# =====================================================================

# ---------------------------------------------------------------------
# ⚙️ ZONA DE CONFIGURACIÓN (¡Edita esto a tu gusto!)
# ---------------------------------------------------------------------

$MiNombre = "Angel-T Dev"         # Nombre que aparecerá en la línea de comandos
$ColorPrincipal = "#FF2A2A"       # Color del primer bloque (Hexadecimal)
$ColorSecundario = "#990000"      # Color de la ruta de carpeta (Hexadecimal)
$ColorArteAscii = "Red"           # Color de las letras gigantes (Red, Cyan, Green, Yellow, Magenta, Blue, etc.)

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

Write-Host "🚀 Iniciando la instalación del entorno..." -ForegroundColor Cyan

# 0. Desbloquear permisos de PowerShell
Write-Host "🔓 Configurando permisos de ejecución..." -ForegroundColor Yellow
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# 1. Crear carpeta de configuración
$PowerShellDir = "$HOME\Documents\PowerShell"
if (-not (Test-Path $PowerShellDir)) {
    New-Item -ItemType Directory -Force -Path $PowerShellDir | Out-Null
}

# 2. Instalar Oh My Posh
Write-Host "📦 Instalando motor gráfico (Oh My Posh)..." -ForegroundColor Yellow
winget install JanDeDobbeleer.OhMyPosh -s winget --silent

# 3. Instalar Iconos
Write-Host "📂 Instalando motor de iconos..." -ForegroundColor Yellow
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force -AcceptLicense

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

Write-Host "✅ ¡Instalación completa!" -ForegroundColor Green
Write-Host "⚠️  IMPORTANTE: Instala una Nerd Font (ej. CaskaydiaCove Nerd Font) y configúrala en tu terminal." -ForegroundColor Cyan
Write-Host "Cierra esta ventana y abre una nueva terminal para disfrutar tu nuevo entorno." -ForegroundColor Green
