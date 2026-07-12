# 🚀 Ultimate PowerShell Terminal Setup

Transforma tu aburrida consola de Windows en una terminal moderna, rápida y con estilo hacker en menos de un minuto. Este repositorio utiliza **Oh My Posh** y **Terminal-Icons** configurados automáticamente.

*(Aquí puedes arrastrar y soltar una captura de pantalla de tu terminal)*

## ✨ Características
*   **Arte ASCII Dinámico:** Un banner impactante cada vez que abres tu consola.
*   **Instalación One-Liner:** Se instala con un solo comando, configurando permisos y dependencias.
*   **Módulos Inteligentes:** Los indicadores de Git, Node.js y Python solo aparecen cuando estás dentro de un proyecto que los necesita.
*   **Altamente Personalizable:** Cambia colores, nombres y arte ASCII con facilidad.

## ⚡ Instalación Rápida

Abre PowerShell como Administrador, copia este comando, pégalo y presiona Enter. ¡Eso es todo!

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force; irm "[https://raw.githubusercontent.com/angeltarcayadev/Terminal-Setup/main/install.ps1](https://raw.githubusercontent.com/angeltarcayadev/Terminal-Setup/main/install.ps1)" | iex
