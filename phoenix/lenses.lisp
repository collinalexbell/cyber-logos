(defpackage :logos.pheonix.lenses (:use :cl) (:export lenses))
(in-package :logos.pheonix.lenses)

(defparameter source "The Art of Game Design")

(defun make-lens (name questions))

(defun lenses ()
  "Small sets of questions used to drive game design"
  `(
    ,(make-lens `(The Lens of Essential Experience)

                `((What experience do I want the player to have)
                  (What is essential to that experience)
                  (How can my game capture that essence)))


    ,(make-lens `(The Lens of Suprise)

                `((What will suprise players when they play my game)
                  (     (Does the story of my game have suprises)
                        (Do the game rules)
                        (Does the artwork)
                        (The technology)     )
                  (Do my rules give players ways to suprise eachother)
                  (Do my rules give players ways to suprise themselves)))


    ,(make-lens `(The Lens of Fun)

                `((  (What parts of my game are fun)
                     (Why)  )
                  (What parts need to be more fun)))



    ,(make-lens `(The Lens of Curiosity)

                `((What questions does my game put into the players mind)
                  (What am I doing to make them care about these questions)
                  (What can I do to make them invent even more questions)))



    ,(make-lens `(The Lens of Endogenous Value)

                `((What is valuable to the players of my game)
                  (How can I make it more valuable to them)
                  (What is the relationship between value in the game and the players motivations)))



    ,(make-lense `(The Lens of Problem Solving)

                 `((What problems does my game ask the player to solve)
                   (Are there hidden problems to solve that arise out of gameplay)
                   (How can my game generate new problems that keeps the player comming back)))))
