$themesDir = "Themes"
if (-not (Test-Path $themesDir)) { New-Item -ItemType Directory -Path $themesDir | Out-Null }

# Paletas: [Color OS, Color Carpeta, Color Git]
$themes = @{
    "angel-default"   = @("#007ACC", "#E5C07B", "#98C379")
    "angel-cyberpunk" = @("#FF00FF", "#00FFFF", "#FCE205")
    "angel-dracula"   = @("#BD93F9", "#FF79C6", "#50FA7B")
    "angel-hacker"    = @("#00FF00", "#008000", "#00FF00")
    "angel-tokyo"     = @("#7AA2F7", "#BB9AF7", "#9ECE6A")
    "angel-monokai"   = @("#FD971F", "#A6E22E", "#F92672")
    "angel-ocean"     = @("#0F4C75", "#3282B8", "#BBE1FA")
    "angel-synthwave" = @("#FF2A6D", "#05D9E8", "#01012B")
    "angel-gruvbox"   = @("#D3869B", "#FABD2F", "#B8BB26")
    "angel-minimal"   = @("#FFFFFF", "#CCCCCC", "#888888")
}

foreach ($theme in $themes.GetEnumerator()) {
    $json = @"
{
  "`$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "alignment": "left",
      "segments": [
        { "background": "$($theme.Value[0])", "foreground": "#1A1B26", "style": "powerline", "template": " \ue62a ", "type": "os" },
        { "background": "$($theme.Value[1])", "foreground": "#1A1B26", "style": "powerline", "template": " \uf07b {{ .Path }} ", "properties": { "style": "folder" }, "type": "path" },
        { "background": "$($theme.Value[2])", "foreground": "#1A1B26", "style": "powerline", "template": " \uf126 {{ .HEAD }} ", "type": "git" }
      ],
      "type": "prompt"
    }
  ],
  "version": 2
}
"@
    Set-Content -Path "$themesDir\$($theme.Key).omp.json" -Value $json -Encoding UTF8
}
Write-Host "✅ ¡Biblioteca generada! 10 temas creados en la carpeta 'Themes'" -ForegroundColor Green
