(defpackage :logos.pheonix.lenses (:use :cl) (:export lenses))
(in-package :logos.pheonix.lenses)

(defparameter source "The Art of Game Design")

(defun make-lens (name questions))

(defun lenses ()
  "Small sets of questions used to drive game design"
  `(
    ,(make-lens `(The Lens of Essential Experience)

                `(((What experience do I want the player to have) .
                   "Hackers of their own world")

                  ((What is essential to that experience) .
                   "Code, limitations, a complex world to hack, reason to hack it")

                  ((How can my game capture that essence) .
                   "An IDE interface, a progressively revealed API with various call limits and a storied reason for those limits to exist, a problem space in the world, and a storied end goal")))


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

                `(((What questions does my game put into the players mind) .
                   (2023-09-17 . "What will the next API call I unlock be?"))
                  (What am I doing to make them care about these questions)
                  (What can I do to make them invent even more questions)))



    ,(make-lens `(The Lens of Endogenous Value)

                `((What is valuable to the players of my game)
                  (How can I make it more valuable to them)
                  (What is the relationship between value in the game and the players motivations)))



    ,(make-lens `(The Lens of Problem Solving)

                 `(((What problems does my game ask the player to solve) .
                    (2023-09-17 . "If there is code, then there will be the problem of writing code that compiles. Also, without any guidence or puzzles, there will be the not so good problem of what to write code about."))

                   ((Are there hidden problems to solve that arise out of gameplay) .
                    (2023-09-17 . "Users can invent their own games or puzzles"))

                   (How can my game generate new problems that keeps the player comming back)))


    ,(make-lens '(The Lens of the Elemental Tetrad)

                 `((Is my game design using all four elements)
                   (Could my game design be improved by enhancing elements in one or more of the categories)
                   (Are the four elements in harmony - reinforcing each other - and working towards a common theme)))

    ,(make-lens '(The Lens of Holographic Design)

                 `((What elements of the game make the experience enjoyable)
                   (What elements of the game detract from the experience)
                   (How can I change game elements to improve the experience)))



    ,(make-lens '(The Lens of Unification)

                `(((What is my theme) .
                   (Divine/magical power beyond one's comprehension
                                   is available to those who seek it
                                   and learn to harmonize themselves
                                   with the spirit of the universe))
                   (Am I using every means available to reinforce that theme)))



    ,(make-lens '(The Lens of Resonance)

                `((What is it about my game that feels powerful and special)
                  (When I describe my game to people what Ideas get them really excited)
                  (If I had no constraints of any kind what would this game be like)
                  ((I have certian instincts about how this game should be) (What is driving those insticts))))



    ,(make-lens '()

                `(()
                  ()
                  ()))

    ))




;,(make-lens '()

;             `(()
;               ()
;               ()))
