(defproject sbx "0.1.0-SNAPSHOT"
  :description "Clojure sandbox environment for web development."
  :url "https://github.com/rxacevedo/clojure-env-docker"
  :min-lein-version "2.0.0"
  :dependencies [[org.clojure/clojure "1.6.0"]
                 [ring "1.3.0"]
                 [ring/ring-defaults "0.1.2"]
                 [compojure "1.3.1"]
                 [environ "0.5.0"]]
  :plugins [[lein-ring "0.8.13"]]
  :main sbx.handler
  :ring {:handler sbx.handler/app}
  :repl-options {:host "0.0.0.0"}
  :profiles {:dev {:dependencies [[javax.servlet/servlet-api "2.5"]
                                  [ring-mock "0.1.5"]]}})
