library(shiny)
library(sitar)
library(gamlss)
library("shinyMatrix")
library(shinydashboard)
library(rhandsontable)
library(tidyverse)
#library("tidyr")
#library("dplyr")
library(digest)
library(shinythemes)
library("dashboardthemes")

# shinythemes::themeSelector(),
fluidPage(theme = shinytheme("cosmo"),
  titlePanel(title= ""
    # img(src='GrowHT.png', align = "top",height = 90)
  ),
  br(),
  sidebarLayout(
    sidebarPanel(
     img(src='GrowHT.png', align = "top",height = 150),
     br(),
      radioButtons("sex", "",
                   c("Girl" = "girls", "Boy" = "boys"
                     
                   ), inline=TRUE),
      

      

     
      radioButtons("type", "How does your height compare with other children?",
                   c("Indian height growth charts" = "iap", 
                     "New! in 2022 (GAMLSS model)" = "gamlss",
                     "Track your height growth with age (SITAR model)" = "sitar"
                   )),
      br(),
    # sliderInput("n_entries", "Number of measurements:", 1, 40, 5),
     
     
  
     tags$h3("Disclaimer"),
     tags$p("This software is for educational purposes only. Please consult your doctor for medical advice."),

      # inputs
   width=3 )
    
    ,
    mainPanel(
      fluidRow(
        
        column(plotOutput("plot1"), width=9, status = "primary"), 
           column(  width=3,
                    sliderInput("n_entries", "Number of measurements:", 1, 40, 5),    
                    actionButton("update_table", "Update table"),
                    br(),
                    br(),
            p("Enter age in years and height in cm."),
          rHandsontableOutput("input_data"),
          br(),
          actionButton("update_plot", "Plot")
          
          
        ),  
        

        
        
        
      )
    ), position = "left",
  )
)
