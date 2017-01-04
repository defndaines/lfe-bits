(defmodule rna-transcription
  (export (to-rna 1)))

(defun to-rna
  (((cons #\A rest)) (cons #\U (to-rna rest)))
  (((cons #\C rest)) (cons #\G (to-rna rest)))
  (((cons #\G rest)) (cons #\C (to-rna rest)))
  (((cons #\T rest)) (cons #\A (to-rna rest)))
  ((rna) rna))
