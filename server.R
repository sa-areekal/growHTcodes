### function to make dataframe
make_DF <- function(n) {
  DF <- tibble(
    entry = 1:n,
    Age = NA_real_,
    Height = NA_real_
  )
  DF[-1]
}


## initial age vs height dataframe
DF_shown<-make_DF(5)

##### function to choose plot type to show
source("helper.R")
plot_to_show <- function(sex,type){
  swith_object<- paste(sex,type,sep="_")
 switch (swith_object,
   girls_iap = girls_iap() ,
   girls_gamlss = girls_gamlss(),
  girls_sitar= girls_sitar(),
    boys_iap= boys_iap(),
  boys_sitar= boys_sitar(),
  boys_gamlss= boys_gamlss()
 )
 
  
}


################################# server function starts here ###################
server <- shinyServer(function(input, output,session) {
  # create or update the data frame by adding some rows
  values <- reactiveValues()
########### logo ################
  # output$logo <- renderImage({
  #   list(
  #     src = file.path("www/GrowHT.png"),
  #     contentType = "image/png",
  #     height = 400
  #   )
  # }, deleteFile = FALSE)
  
  
########## initial dataframe input ####################
    output$input_data <- renderRHandsontable({rhandsontable(DF_shown)})

######### Initial plots ##################    
   output$plot1<-renderPlot(
         plot_to_show(as.character(input$sex),as.character(input$type))
        )
  #  output$HowToUse <- renderText(print(""))

########### update dataframe and update input data ################      
  observeEvent(input$update_table, {
  
     # if a table does not already exist, this is our DF
    if (input$update_table == 1) {
      values$df <- make_DF(input$n_entries)
    } else { # otherwise,  append the new data frame to the old.
      tmp_data <- hot_to_r(input$input_data)
      values$df[,names(tmp_data)] <- tmp_data
      
      values$df <- bind_rows(values$df, make_DF(input$n_entries))
    }
  
    
    # finally, set up table for data entry
    DF_shown <- values$df[c('Age', 'Height')]
    #output$test_output <- renderTable(values$df)
    output$input_data <- renderRHandsontable({rhandsontable(DF_shown)})
    
  }) 
    
  
   observeEvent(input$update_plot, # observe if any changes to the cells of the rhandontable
                                 {
                                   
                                     newdata <- hot_to_r(input$input_data) # convert the rhandontable to R data frame object so manipulation / calculations could be done
                                     ## Individual height curves plot
                                     output$plot1<-  renderPlot({
                                       plot_to_show(as.character(input$sex),as.character(input$type))
                                       lines(newdata$Age, newdata$Height, lwd=2,"o",pch=20)
                                     })
                                   
                                   
     })  # observe event update individual plot
   


})



