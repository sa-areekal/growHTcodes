library(shiny)
library(sitar)
library(gamlss)
#library("shinyMatrix")
#library(shinydashboard)
library(rhandsontable)
library(tidyverse) 
#library("tidyr")
#library("dplyr")
library(digest)
library(shinythemes)
#library("dashboardthemes")




shinyApp(ui = ui.R, server = server.R)

# input is age and height
# display that point in the chart with 3 backgrounds
# IAP, SITAR, and GAMLSS
