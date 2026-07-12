# 🚀 Ultimate PowerShell Terminal Setup

Transforma tu aburrida consola de Windows en una terminal moderna, rápida y con estilo hacker en menos de un minuto. Este repositorio utiliza **Oh My Posh** y **Terminal-Icons** configurados automáticamente.

> 📸 **Aquí puedes arrastrar y soltar una captura de pantalla de tu terminal.**

---

## ✨ Características

- 🎨 **Arte ASCII Dinámico:** Un banner impactante cada vez que abres tu consola.
- ⚡ **Instalación One-Liner:** Se instala con un solo comando, configurando permisos y dependencias.
- 🧠 **Módulos Inteligentes:** Los indicadores de Git, Node.js y Python solo aparecen cuando estás dentro de un proyecto que los necesita.
- 🎛️ **Altamente Personalizable:** Cambia colores, nombres y arte ASCII con facilidad.

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
$ColorPrincipal = "#FF2A2A"
$ColorSecundario = "#990000"
$ColorArteAscii = "Red"
```

4. Ejecuta el script localmente:

```powershell
.\install.ps1
```

---

## 🔤 Requisito: Nerd Fonts

Para que los iconos de carpetas y herramientas se rendericen correctamente (y evitar ver cuadritos rotos), es obligatorio usar una fuente parcheada.

### 📥 Descarga e instala **CaskaydiaCove Nerd Font**

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
