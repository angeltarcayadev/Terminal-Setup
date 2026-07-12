````md
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
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force; irm "https://raw.githubusercontent.com/angeltarcayadev/Terminal-Setup/main/install.ps1" | iex
````

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

Para que los iconos de carpetas y herramientas se rendericen correctamente, es obligatorio usar una **Nerd Font**.

1. Descarga e instala **CaskaydiaCove Nerd Font**.
2. Configura **Visual Studio Code** o **Windows Terminal** para utilizar **CaskaydiaCove Nerd Font** como fuente.

---

## 👨‍💻 Desarrollado por

**Angel-T Dev**

---

⭐ Si este proyecto te fue útil, considera darle una **estrella** al repositorio para apoyar el desarrollo.

```
```
