(defpackage :logos.tradition (:use :cl))

;; based on "Revolt Against the Modern World"

(in-package :logos.tradition)

(defun being ()
  '((aliases (metaphysical
              being
              wave
              god))

    (attributes (timeless
                 higher
                 more-real))))


(defun becomming ()
  '((aliases (physical
              partical
              mortal)
     (attributes (timeful
                  lower
                  less-real)))))


(defun paths-to-being ()
  '((functions (self-mastery
                self-discipline
                autonomy))
    (name heroic-asceticism)
    (aphorism "A man is a mortal god, and a god is an immortal man")))


(defun king ()
  '((function (act as a bridge to the transcendent))
    (imposition (power-through-spirit sporadic-physical-force))
    (inferior-attributes (strength violence intelligence wisdom physical-courage concern-for-community))
    ))
