;;; early-init.el --- Carga temprana para dcmacs -*- lexical-binding: t; -*-

;; Desactiva UI innecesaria desde el arranque
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

;; Desactiva sistema de paquetes nativo de Emacs
(setq package-enable-at-startup nil)
(setq package-quickstart nil)

;; Optimiza Garbage Collection y file-name handlers durante arranque
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)

(defvar dcmacs--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Inhibe redisplay y mensajes
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-screen t)
(setq inhibit-default-init t)
(setq initial-scratch-message nil)
(setq frame-inhibit-implied-resize t)
(setq inhibit-redisplay t)
(setq inhibit-message t)

;; Mejora de performance en renderizado de fuentes
(setq inhibit-compacting-font-caches t)

;; Define el directorio base del proyecto
(defvar dcmacs-dir (file-name-directory (or load-file-name buffer-file-name)))

;;; early-init.el ends here
