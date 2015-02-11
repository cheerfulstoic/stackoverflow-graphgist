# stackoverflow-graphgist

This is a Clojure project built with Leiningen to import data from the StackOverflow API into Neo4j.

While it is written with code reuse in mind, there are some known kinks:
 * Neo4j server is hardcoded
 * It is currently coded to import 1000 questions (10 pages) tagged `neo4j` and to also get the associated askers (Users), Answers, and answerers (Users).  See the model image below.

## Model

![StackOverflow domain model](https://raw.githubusercontent.com/cheerfulstoic/stackoverflow-graphgist/master/model.png)

## Installation and usage

 * Clone this repository
 * Install [Leiningen](http://leiningen.org/)
 * Run `lein repl`
 * Execute `(stackoverflow-graphgist.core/-main)`

## License

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.
