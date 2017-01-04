(defmodule leap
  (export
    (leap-year 1)))

(defun leap-year
  ((year) (when (> (rem year 4) 0))
   'false)
  ((year) (when (=:= 0 (rem year 400)))
   'true)
  ((year) (when (=:= 0 (rem year 100)))
   'false)
  ((_year)
   'true))
