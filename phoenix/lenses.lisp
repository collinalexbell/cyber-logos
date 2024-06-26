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



    ,(make-lens '(The Lens of Needs)

                `((On which levels of Maslows hierarchy is my game operating on)
                  (How can I make my game fulfill more basic needs than it already is)
                  (On the levels my game is operating - how can I make it fulfill those needs even better)))



    ,(make-lens '(The Lense of Judgement)

                `((What does your game judge about the player)
                  (How does it communicate this judgement)
                  (Do players feel that this judgement is fair)
                  (Do they care about the judgement)
                  (Does this judgement make them want to improve)))


    ,(make-lens '(The Lens of Functional Space)

                `((Is the space of this game discrete or continuous?)
                  (How many dimensions does it have?)
                  (What are the boundaries of the space?)
                  (Are there sub spaces? How are they connected?)
                  (Is there more than one way to abstractly model the space in this game?)))

    ,(make-lens '(The Lens of Dynamic State)

                `((What are the objects of my game ?)
                  (What are the attributes of the objects ?)
                  (What are the possible states for each attribute ?)
                  (What triggers the state change for each attribute ?)
                  (What state is known by the game only ?)
                  (What state is known by all players ? )
                  (What state is known by some or only one player ?)
                  (Would changing who knows the state improve the game in some way ?)))


    ,(make-lens '(The Lens of Emergence)

                `((How many verbs do my players have ?)
                  (How many objects can each verb act on ?)
                  (How many ways can players acheive their goals ?)
                  (How many subjects do the players control ?)
                  (How do side effects change constraints ?)))



    ,(make-lens '(The Lens of Action)

                `((What are the operational actions in my game?)
                  (What are the resultant actions?)
                  (What resultant actions would I like to see?
                        How could I change the game to make those possible?)
                  (Am I happy with the ratio of resultant to operational actions)
                  (What actions do players wish they could do in my game that they cannot?
                        Can I somehow enable these - either as operation or resultant action)))



    ,(make-lens '(The Lens of Goals)

                `((What is the ultimate goal of my game?)
                  (Is that goal clear to players?)
                  (If there is a series of goals - do the players understand that ? )
                  (Are the different goals related to each other in a meaningful way ? )
                  (Are my goals concrete - achievable - rewarding ? )
                  (Do players have a chance to decide on their own goals ? )))

    ,(make-lens '(The Lens of Rules)

                `((What are the foundational rules of my game? How do these differ from the operational rules? )
                  (Are there laws or house rules that are forming as the game develops? Should these be incroprated into my game directly? )
                  (Are there different modes in my game? Do these modes make things simpler - or more complex? Would the game be better with fewer modes? More modes? )
                  (Who enforeces the rules)
                  (Are the rules easy to understand - or is there confusion about them? If there is confusion - should I fix it by changing the rules or by explaining them more clearly? ))
                )


    ,(make-lens '(The Lens of Skill)

                `((What skills does my game require from the player ? )
                  (Are there categories of skill that this game is missing ? )
                  (Which skills are dominant ? )
                  (Are these skills creating the experience I want ? )
                  (Are some players much better at these skills than others ? )
                  (Does this make the game feel unfail ?)
                  "Can players improve their skils with practice?"
                  "Does this game demand the right level of skill"
                  ))
    ,(make-lens '(The Lens of Expected Value)
                `("What is the actual chance of a certian event occuring?"
                  "What is the percieved chanc?"
                  "What value does the outcome of that event have? Can the value be quantified/ Are there intangible aspects of value that I am not considering?"
                  "Each action a player can take has a different expected value when I add up all the possible outcomes. Am I happy with these values? Do they give the player interesting choices? Are they too rewarding, or too punishing?"))


    ))




;,(make-lens '()

;             `(()
;               ()
;               ()))
