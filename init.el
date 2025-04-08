;;; init.el --- Punto de entrada principal para dcmacs -*- lexical-binding: t; -*-

;; Reactivar redisplay y mensajes después del early-init
(setq inhibit-redisplay nil)
(setq inhibit-message nil)
(redisplay)

;; Restaurar parámetros de garbage collection y handlers de archivos
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216) ;; 16MB
            (setq gc-cons-percentage 0.1)
            (setq file-name-handler-alist dcmacs--file-name-handler-alist)))

;; Evitar que customize escriba en este archivo
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Asegurar que org-mode esté disponible
(require 'org)

;; Cargar configuración principal desde config/init.org
(let ((main-init (expand-file-name "config/init.org" dcmacs-dir)))
  (if (file-exists-p main-init)
      (org-babel-load-file main-init)
    (message "⚠️  Archivo config/init.org no encontrado")))

(provide 'init)
;;; init.el ends here
