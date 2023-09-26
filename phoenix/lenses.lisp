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



    ,(make-lens '(The Lens of Inifite Inspirtation)

                `(((What is an experience I have had in my life that I want to share with others) .
                   ((One experience is that of using emacs)
                    (Another is the experience of nature)
                    (Being in a park in the midst of NYC)))
                  ((In what small way can I capture that experience and put it into my game) .
                   ((I can use emacs colors for my game. That would be a pleasant aesthetic)
                    (I can build environments that contrast heavily with the emacs env)
                    (I can create a sharp and delineated distinction between
                       the man made structures
                       and nature)))))



    ,(make-lens '(The Lens of the Problem Statement)

                `(((What problems am I really trying to solve) .
                   ((I want the freedom to be creative - to study - and to build my own experience of life without a 9-5 job)
                    (I want $$$ to be free and to live a modern tech genius life)))
                  (Have I been making assumptions about this game that really have nothing to do with its true purpose)
                  ((Is a game really my best solution. Why) .
                   ((Yes -  everything else will feel like work)
                    (Also I have software engineering experience and need a market to self software)
                    (Games are a good market to seel creative software in)
                    (Also I dont have the capital required to start a (real business))))

                  ((How will I be able to tell if the problem is solved) .
                   ((I have a digital experience that feels freeing and exciting to work on)
                    (I have the money to work on it)))))


    ,(make-lens '(The Lens of the eight filters)

                `((Does this game feel right)
                  (Will the intended audience like the game enough)
                  (Is this a well designed game)
                  (Is the game novel enough)
                  (Will this game sell)
                  (Is it technically possible to build this game)
                  (Does this game meet our social or community goals)
                  (Do the playtesters enjoy the game enough)))



    ,(make-lens '(The Lens of Risk Mitigation)

                `(((What could stop this game from being great) .
                   ((The game isnt good enough by funding time to get funding))
                   )
                  ((How can I stop this from happening) .
                   ((Make the game good enough by getting deeper into flow)))))


    ,(make-lens '(The Lens of the Toy)

                `((If my game had no goal would it be fun at all - If not how can I change that)
                  (When people see my game - do they want to start interacting with it - Even before they know what to do - If not how do I change that)))



    ,(make-lens '(The Lens of the Player)

                `((In general - what do they like)
                  (What dont they like and why)
                  (What do they expect to see in a game)
                  (If I were in their place - what would I want to see in a game)
                  (What would they like or dislike about my game in particular)))

    ,(make-lens '(The Lens of Pleasure)

                `((What pleasures does your game give to players - Can these be improved)
                  (What pleasures are missing from your experience - Why - Can they be added)))


    ,(make-lens '(The Lens of Flow)

                `((Does the game have clear goals - If not how can I fix that)
                  (Are the goals of the player the same goals I intend)
                  (Are there parts of the game that distract the player to the point that they forget the goal - If so can these distractions be reduced or tied to the game goal )
                  (Does my game provide a steady stream of  not-to-easy not-to-hard challenges - taking into account the fact that the players skills may be gradually improving)
                  (Are the players skills improving at the rate I had hoped)))



    ,(make-lens '()

                `(()
                  ()
                  ()))







    ))




;,(make-lens '()

;             `(()
;               ()
;               ()))
