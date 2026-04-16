;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun acronym (phrase)
  "Convert a PHRASE to its acronym."
  ;; Use 'let' for local variables to keep the global namespace clean
  (let ((words (split-string phrase "[^[:word:]']+" t)))
    (mapconcat (lambda (word) 
                 (upcase (substring word 0 1))) 
               words 
               "")))

(provide 'acronym)
;;; acronym.el ends here