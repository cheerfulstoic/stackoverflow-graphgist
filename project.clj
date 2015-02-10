(defproject stackoverflow-graphgist "0.1.0-SNAPSHOT"
  :description "Project to import StackOverflow data to neo4j for a demonstration of Master Data Management"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.6.0"],
                 [cheshire "5.4.0"],
                 [clj-http "1.0.1"],
                 [clojurewerkz/neocons "3.0.0"]]
  :main stackoverflow-graphgist.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
