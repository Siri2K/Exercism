;;; accumulate.el --- Accumulate (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun accumulate (lst func)
  "Apply FUNC to each element of LST and return a new list of results."
  (let ((result '()))
    (while lst
      ;; Apply the function to the first element and add it to our result list
      (push (funcall func (car lst)) result)
      ;; Move to the next element in the list
      (setq lst (cdr lst)))
    ;; 'push' builds the list in reverse order, so we must reverse it back
    (nreverse result)))

(provide 'accumulate)


(provide 'accumulate)
;;; accumulate.el ends here
