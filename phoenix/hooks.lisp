(in-package :logos.phoenix)

(logos.task:add-hook '(bow to the short-wave) :complete #'short-wave-hook)
(logos.task:add-hook '(tweet) :select #'tweet-select-hook)
(logos.task:add-hook '(tweet) :complete #'tweet-complete-hook)
(logos.task:add-hook '(spiritual reading) :select #'what-did-you-think-about-reading)
(logos.task:add-hook '(meditate) :select #'print-strategies)


