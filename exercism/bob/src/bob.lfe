(defmodule bob
  (export
    (response-for 1)))

(defun question? (phrase)
  (case (re:run phrase "\\?$")
    ((tuple 'match _) #('question 2))
    ('nomatch #('statement 99))))

(defun silence? (phrase)
  (case (string:strip phrase)
    ("" #('silence 1))
    (_ #('statement 99))))

(defun shouting? (phrase)
  (case (and (== phrase (string:to_upper phrase))
             (!= (string:to_upper phrase) (string:to_lower phrase)))
    ('true #('shouting 1))
    ('false #('statement 99))))

(defun response-for (phrase)
  (case (lists:foldl (lambda (f acc) (min acc (funcall f phrase)))
                     phrase
                     (list #'silence?/1 #'shouting?/1 #'question?/1))
    ((tuple 'silence _) "Fine. Be that way!")
    ((tuple 'shouting _) "Whoa, chill out!")
    ((tuple 'question _) "Sure.")
    ((tuple 'statement _) "Whatever.")))
