# cyber-logos


## What is cyber-logos

cyber-logos
    is an ecosystem of
    software objects that
        model the real world.
        (by
            tracking it,
            modeling it,
            building it's [holon](https://en.wikipedia.org/wiki/Holon)).

## Reading cyber-logos

### Conventions
This library is common lisp dominant and takes many of its conventions from CL

#### nameing files and directories
- most files and dirs are written in kebab case, however files and dirs in other languages use CamelCase.
- lisp files are lower case - thinking of capitalizing files for classes of major imporantance in

#### syntax
this section will be a bit difficult for non-lispers to understand.

In general, when repsenting data, the following symbols are always grouped:
- proper nouns: `(GO TO (BATTERY PARK BIKEWAY))`
- noun clauses: `(FLUFFY WHITE DOG)`
- supporting clauses and appositives

This is particularly useful when running "human NLP algorithms" or writing gpt prompts


### packages
- logos
- logos.task
- logos.goal

## config.json
This is an example config.
It is used to connect to the db.
Don't expose a service running with this config to the web
