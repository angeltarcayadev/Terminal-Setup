# 🚀 Ultimate PowerShell Terminal Setup

![PowerShell](https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

Transforma tu aburrida consola de Windows en una terminal moderna, rápida y con estilo hacker en menos de un minuto. Este repositorio utiliza **Oh My Posh** y **Terminal-Icons** configurados automáticamente.

## 📸 Vistazo a la Terminal

**Banner de bienvenida y estructura de línea de comandos:**
<img width="1851" height="655" alt="Terminal principal" src="https://github.com/user-attachments/assets/758f9b1d-58a1-45d0-83cf-fa9b6c78c5b1" />

**Módulos en acción (Rutas, Git y lenguajes):**
<img width="1851" height="584" alt="Terminal en proyecto" src="https://github.com/user-attachments/assets/f9b9adee-50f7-45a1-89f4-295af79246b7" />

---

## 🚀 Próximas Actualizaciones y Feedback

Este proyecto se mantendrá en **desarrollo activo**. Más adelante se vendrán nuevas cosas, como esquemas de colores alternativos, soporte para más módulos de programación y optimizaciones de rendimiento.

¿Tienes alguna sugerencia genial o te gustaría ver alguna función nueva? 
* 💡 Abre un [Issue](https://github.com/angeltarcayadev/Terminal-Setup/issues) para dejar tus ideas.
* 🛠️ ¡Todo feedback, idea o *Pull Request* de la comunidad es súper bienvenido!


---

## ✨ Características

- 🎨 **Arte ASCII Dinámico:** Un banner impactante cada vez que abres tu consola.
- ⚡ **Instalación One-Liner:** Se instala con un solo comando, configurando permisos y dependencias.
- 📥 **Descarga Automática de Fuentes**: Instala Nerd Fonts (FiraCode y Caskaydia) silenciosamente sin pedir permisos de administrador.
- ☁️ **Sincronización en la Nube**: Los diseños de la terminal descargan dinámicamente sus estructuras desde la nube, asegurando calidad premium sin copias baratas.
- 🧠 **Módulos Inteligentes:** Los indicadores de Git, Node.js y Python solo aparecen cuando estás dentro de un proyecto que los necesita.
- 🎛️ **Altamente Personalizable:** Cambia temas y arte ASCII con facilidad.
  *(Tip: Puedes generar tu propio arte ASCII gigante en [TAAG Generator](https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow))*

---

## ⚡ Instalación Rápida

Abre **PowerShell como Administrador**, copia este comando, pégalo y presiona **Enter**. ¡Eso es todo!

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force; irm "https://raw.githubusercontent.com/angeltarcayadev/Terminal-Setup/main/install.ps1" | iex
```

---

## 🛠️ Cómo Personalizarlo para ti

Si quieres clonar este estilo pero usar tu propio nombre y colores:

1. Clona o descarga este repositorio.
2. Abre `install.ps1` en tu editor de código favorito.
3. Modifica la **ZONA DE CONFIGURACIÓN** en las primeras líneas:

```powershell
$MiNombre = "Tu Nombre"
$temaElegido = "dracula"
$ColorArteAscii = "Magenta"
```

4. Ejecuta el script localmente:

```powershell
.\install.ps1
```

---

## 🔤 Fuentes Nerd Fonts (Automático)

Para que los iconos de carpetas y herramientas se rendericen correctamente, es obligatorio usar una fuente parcheada.

¡Buenas noticias! El script instalador ahora **descarga e instala automáticamente** las fuentes necesarias (*FiraCode Nerd Font Mono* y *CaskaydiaCove Nerd Font*) en tu perfil, sin requerir permisos de administrador.

*Nota: Solo si experimentas algún fallo en la descarga automática, puedes instalarlas manualmente desde la página de [Nerd Fonts](https://www.nerdfonts.com/).*

---

### 💻 Cómo configurarla correctamente

#### En Visual Studio Code

1. Ve a **Configuración** (`Ctrl + ,`).
2. Escribe **terminal font** en el buscador.
3. En la opción **Terminal > Integrated: Font Family**, escribe exactamente:

```text
'CaskaydiaCove Nerd Font'
```

4. Reinicia la terminal integrada de VS Code.

---

#### 🖥️ En Windows Terminal

1. Abre **Windows Terminal** y presiona `Ctrl + ,` para abrir la configuración.
2. En el panel izquierdo, selecciona **Valores predeterminados** (bajo **Perfiles**) o directamente tu perfil de **PowerShell**.
3. Ve a la pestaña **Apariencia**.
4. En **Fuente** (*Font Face*), selecciona:

```text
CaskaydiaCove Nerd Font
```

5. Haz clic en **Guardar**.

---

## 👨‍💻 Desarrollado por

**Angel Eduardo Tarcaya**

---

## ⭐ Apóyame

Si este proyecto te fue útil, considera darle una **⭐ estrella** al repositorio para apoyar el desarrollo.
