# ui.R
#source("url-input.R")
library(shiny)

shinyUI(fluidPage(
  titlePanel("Simple Youtube Time-Slicer"),
  sidebarPanel(h1("Original Link"),
               textInput("olink", "URL: ", "http://www.youtube.com/"),
               numericInput("div_time", "video length (min): ", 3, min = 0, max = 10),
               numericInput("ovl_time", "overlay time (sec): ", 30, min = 0, max = 60)
               ),

  mainPanel(h1("Sliced Links:")
            )
))