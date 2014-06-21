# server.R

shinyServer(
  function(input, output) {
    output$newlinks <- renderText({ 
      input$sliceButton
      isolate(paste0(input$oldlink, "&t=", input$div_time, "m", input$ovl_time, "s"))
    })
  }
)