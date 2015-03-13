(ns sbx.handler
  (:require [compojure.core :refer :all]
            [compojure.handler :refer [site]]
            [compojure.route :as route]
            [ring.middleware.defaults :refer [wrap-defaults site-defaults]]
            [ring.middleware.reload :refer [wrap-reload]]
            [ring.adapter.jetty :as jetty]
            [environ.core :refer [env]]))

(defroutes app-routes
  (GET "/" [] "Hello World")
  (route/not-found "Not Found"))

(def app
  (wrap-reload
   (wrap-defaults app-routes site-defaults)))

(defn -main [& [port]]
  (let [port (Integer. (or port (env :port) 80))]
    (jetty/run-jetty (site #'app) {:port port :join? false})))
