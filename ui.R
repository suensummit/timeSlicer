# ui.R

shinyUI(fluidPage(
  titlePanel(img(src="test_logo3.png", height = 175, width = 640),
             "Simple YouTube Video-Slicer"
             ),
  sidebarPanel(h1("Original Link"),
               textInput("oldlink", "URL: ", "http://www.youtube.com/"),
               numericInput("div_time", "video length (min): ", 3, min = 0),
               numericInput("ovl_time", "overlay time (sec): ", 30, min = 0),
               p(actionButton("sliceButton", "Slice!"))
               ),
  mainPanel(h1("Sliced Links:"),
            textOutput("newlinks")
            )
))