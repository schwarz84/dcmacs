# dcmacs

Una distribución modular, minimalista y extensible de Emacs, diseñada para profesionales de la Ciencia de Datos.

`dcmacs` transforma Emacs en un entorno de desarrollo completo, ideal para roles como Data Scientist, Data Engineer y Deep Learning Engineer. Reúne herramientas clave en una plataforma unificada, optimizada para productividad, análisis y automatización.

## Objetivos

- Proveer un entorno de desarrollo moderno y completo dentro de Emacs, centrado en la Ciencia de Datos.
- Ofrecer una plataforma modular y mantenible, estructurada con archivos `.org` mediante literate programming.
- Mantener una filosofía minimalista: usar solo los paquetes esenciales, bien seleccionados y documentados.
- Unificar herramientas para scripting, análisis, visualización, documentación y gestión de proyectos.
- Ser accesible para usuarios nuevos y a la vez poderoso para usuarios avanzados que deseen personalizar todo.

## Funcionalidades principales

- Soporte completo para Python con entorno virtual, linting, completado, snippets y Jupyter Notebooks.
- Integración con Jupyter y org-mode para ejecutar código en bloques, documentar y exportar resultados.
- Soporte para R mediante ESS y ejecución directa desde org-babel.
- Visualización de datos desde notebooks o scripts con gráficos embebidos.
- Gestión de proyectos con Projectile, Treemacs y consult-project-extra.
- Terminal integrada con vterm y herramientas auxiliares como multi-vterm.
- Control de versiones con Magit, Forge y seguimiento visual de cambios.
- Dashboard inicial con acceso rápido a proyectos, tareas y archivos recientes.
- Agenda y tareas con org-agenda y super-agenda, organizadas por prioridad y etiquetas.
- Configuración modular, mantenible y extensible desde archivos `.org`.
- Optimización para funcionar con alto rendimiento en múltiples plataformas: Linux, MacOS y WSL.
- Carga rápida (cold start bajo), con foco en tiempos de arranque mínimos.
- Funcional incluso sin conexión a internet una vez instalado.

## Requisitos del sistema

Para instalar y usar `dcmacs`, se recomienda tener:

- Emacs 29.1 o superior (compilado con soporte para módulos y JSON nativo).
- Git (para clonar y gestionar paquetes).
- Python 3 con `pip` y `venv` (para entornos virtuales y notebooks).
- R (opcional, para soporte mediante ESS).
- SQLite3 y/o DuckDB (opcional, para procesamiento local de datos).
- Bash y herramientas de línea de comandos estándar.

`dcmacs` está desarrollado y probado principalmente en Arch Linux.  
Se incluye un script de instalación automatizada para este sistema operativo.  
La compatibilidad con otras distribuciones GNU/Linux, MacOS y WSL está prevista, pero puede requerir ajustes menores.

## Instalación

### Instalación en Arch Linux (recomendado)

1. Clonar el repositorio en tu directorio de configuración de Emacs:
   ```bash
   git clone https://github.com/usuario/dcmacs.git ~/.emacs.d
   ```

2. Ejecutar el script de instalación:
   ```bash
   cd ~/.emacs.d
   chmod +x scripts/install-arch.sh
   ./scripts/install-arch.sh
   ```

3. Abrir Emacs por primera vez:
   ```bash
   emacs
   ```

### Instalación manual (otras distribuciones)

1. Instalar Emacs 29.1+ y Git desde el gestor de paquetes de tu sistema.
2. Clonar el repositorio:
   ```bash
   git clone https://github.com/usuario/dcmacs.git ~/.emacs.d
   ```
3. Instalar las dependencias mínimas: Python 3, pip, sqlite3, duckdb.
4. Iniciar Emacs y completar la instalación desde los módulos `.org`.

## Estructura del proyecto

La configuración de `dcmacs` está organizada modularmente en archivos `.org`, aprovechando literate programming para asegurar claridad, mantenibilidad y documentación integrada.

```
~/.emacs.d/
├── early-init.el             # Configuración cargada antes del sistema de paquetes; optimiza el arranque.
├── init.el                   # Entrada principal que carga y ejecuta config/init.org.
├── README.md                 # Documentación principal del proyecto.
├── config/                   # Archivos .org modulares que definen toda la configuración.
│   ├── init.org              # Carga secuencial de los módulos .org. Punto de entrada real del sistema.
│   ├── core.org              # Opciones generales: codificación, backups, comportamiento global.
│   ├── packages.org          # Bootstrap de straight.el, instalación de use-package, setup inicial.
│   ├── ui.org                # Apariencia, fuentes, ligaduras, theme, modeline, íconos.
│   ├── keybindings.org       # Atajos personalizados y configuración de which-key.
│   ├── tools.org             # Herramientas: vterm, magit, forge, consult, embark, diff-hl, alert.
│   ├── functions.org         # Funciones propias reutilizables.
│   ├── project-management.org# Gestión de proyectos: projectile, treemacs, consult-project-extra, hydras.
│   ├── python.org            # Entorno Python, virtualenv, completado, flycheck, pyenv, pipenv.
│   ├── jupyter.org           # Jupyter Notebooks con ein, jupyter-mode, org-babel, gráficos.
│   ├── r.org                 # Soporte completo para R con ESS y org-babel.
│   ├── data.org              # Herramientas de manejo de datos: Pandas, Polars, DuckDB, SQLite3, csv-mode.
│   ├── ml.org                # Configuración de ML/DL: PyTorch, TensorFlow, ONNX, Sklearn, Optuna.
│   ├── orgmode.org           # org-mode avanzado: agenda, enlaces, exportación, literate programming.
│   ├── dashboard.org         # dashboard.el, vista inicial con accesos rápidos y agenda semanal.
│   ├── calendar.org          # Integración con Google Calendar (org-gcal) y eventos personalizados.
│   ├── export.org            # Exportaciones a PDF, HTML, Reveal.js, LaTeX, Markdown.
│   ├── mail.org              # Cliente de correo con mu4e, notmuch y org-msg.
├── lisp/                     # Funciones personalizadas que no van en los módulos .org.
│                             # (Reservado: se activará desde functions.org cuando sea necesario)
├── snippets/                 # Directorio de snippets para yasnippet.
│                             # (Reservado: se activará desde tools.org al configurar yasnippet)
├── assets/                   # Capturas de pantalla, íconos, logos, recursos externos.
└── scripts/                  # Scripts auxiliares (ej: install-arch.sh para instalación automatizada).
```

## Filosofía del proyecto

`dcmacs` nace con el objetivo de convertir Emacs en una plataforma profesional, modular y minimalista para Ciencia de Datos.

Se basa en los siguientes principios:

- Control total: cada línea de configuración está documentada y es entendible. Nada está oculto ni automatizado al extremo.
- Modularidad real: la configuración está organizada en archivos `.org` independientes, que se pueden cargar, desactivar o extender sin romper el sistema.
- Rendimiento primero: desde el uso de `early-init.el` hasta la elección de paquetes ligeros, se busca un arranque rápido y una experiencia fluida.
- Sin dependencias innecesarias: se evita cualquier paquete o herramienta que no tenga una función clara o justificada en el flujo de trabajo científico o de ingeniería.
- Uso offline y multiplataforma: el sistema está pensado para funcionar sin conexión constante, y en Linux, WSL o MacOS sin adaptaciones críticas.
- Escalable y mantenible: lo que comienza como un entorno personal puede evolucionar a un framework adaptable para otros equipos o proyectos.

### Literate Programming como núcleo

Toda la configuración se basa en literate programming, combinando documentación y código en un solo lugar. Esto permite aprender, modificar y compartir sin necesidad de comentarios ocultos o configuraciones oscuras. Los archivos `.org` son ejecutables, versionables y legibles al mismo tiempo.

### Personalización como libertad

`dcmacs` está pensado para que lo adaptes, no para que lo aceptes como caja cerrada. Podés escribir tus propias funciones, eliminar módulos, redefinir keybindings o sustituir paquetes. Todo está diseñado para facilitar la autonomía.

### Hacia un framework libre

Aunque comienza como una configuración personal optimizada, `dcmacs` tiene proyección a futuro como un framework libre, abierto y enfocado en Ciencia de Datos, para que otros profesionales puedan usarlo, aprender de él o contribuir con mejoras concretas.

## Contacto y contribuciones

`dcmacs` es un proyecto en desarrollo activo. Las ideas, sugerencias y contribuciones son bienvenidas.

Si querés proponer mejoras, reportar problemas o colaborar en el desarrollo:

- Podés abrir un issue o pull request en el repositorio (cuando esté público).
- También podés contactar directamente al creador del proyecto: Charly  
  Email: carlosschwarzfischer@gmail.com

Próximamente se incluirá una guía para contribuir y una hoja de ruta con próximos módulos y mejoras.

Toda colaboración es bienvenida mientras respete la filosofía del proyecto: claridad, utilidad y simplicidad.
