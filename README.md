# 🚀 Ultimate PowerShell Terminal Setup

Transforma tu aburrida consola de Windows en una terminal moderna, rápida y con estilo hacker en menos de un minuto. Este repositorio utiliza **Oh My Posh** y **Terminal-Icons** configurados automáticamente.

> *(Aquí puedes arrastrar y soltar una captura de pantalla de tu terminal)*

---

## ✨ Características

- **Arte ASCII Dinámico:** Un banner impactante cada vez que abres tu consola.
- **Instalación One-Liner:** Se instala con un solo comando, configurando permisos y dependencias.
- **Módulos Inteligentes:** Los indicadores de Git, Node.js y Python solo aparecen cuando estás dentro de un proyecto que los necesita.
- **Altamente Personalizable:** Cambia colores, nombres y arte ASCII con facilidad.

---

## ⚡ Instalación Rápida

Abre **PowerShell como Administrador**, copia este comando, pégalo y presiona **Enter**. ¡Eso es todo!

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force; irm "[https://raw.githubusercontent.com/angeltarcayadev/Terminal-Setup/main/install.ps1](https://raw.githubusercontent.com/angeltarcayadev/Terminal-Setup/main/install.ps1)" | iex
🛠️ Cómo Personalizarlo para ti
Si quieres clonar este estilo pero usar tu propio nombre y colores:

Clona o descarga este repositorio.

Abre install.ps1 en tu editor de código favorito.

Modifica la ZONA DE CONFIGURACIÓN en las primeras líneas:

PowerShell
$MiNombre = "Tu Nombre"
$ColorPrincipal = "#FF2A2A"
$ColorSecundario = "#990000"
$ColorArteAscii = "Red"
Ejecuta el script localmente:

PowerShell
.\install.ps1
🔤 Requisito: Nerd Fonts
Para que los iconos de carpetas y herramientas se rendericen correctamente (y evitar ver cuadritos rotos), es obligatorio usar una fuente parcheada.

Descarga e instala CaskaydiaCove Nerd Font.

Cómo configurarla correctamente:
En Visual Studio Code:

Ve a Configuración (Ctrl + ,).

Escribe terminal font en el buscador.

En la opción Terminal > Integrated: Font Family, escribe exactamente: 'CaskaydiaCove Nerd Font'

Reinicia tu terminal de VS Code.

En Windows Terminal:

Abre Windows Terminal y presiona Ctrl + , para abrir la configuración.

En el panel izquierdo, selecciona Valores predeterminados (bajo Perfiles) o directamente tu perfil de PowerShell.

Ve a la pestaña Apariencia.

En Corte de la fuente (o Font Face), selecciona CaskaydiaCove Nerd Font.

Haz clic en Guardar.

👨‍💻 Desarrollado por
Angel Eduardo Tarcaya

⭐ Si este proyecto te fue útil, considera darle una estrella al repositorio para apoyar el desarrollo.


**Para actualizarlo en tu GitHub:**
1. Ve a tu repositorio.
2. Haz clic en el archivo `README.md`.
3. Haz clic en el ícono del lápiz (✏️) arriba a la derecha del texto para editarlo.
4. Borra lo que tienes, pega esta nueva versión.
5. Haz clic en **Commit changes...**.
