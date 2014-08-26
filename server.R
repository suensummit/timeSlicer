# server.R
#https://www.youtube.com/v/fCmwKLtDZWA&start=426&end=457

shinyServer(
  function(input, output) {
    output$newlinks <- renderUI({
      x <- unlist(strsplit(input$whole_time, split = ":"))
      total <- as.numeric(x[[1]])*3600 + as.numeric(x[[2]])*60 + as.numeric(x[[3]])
      ndiv <- ceiling(total / (input$div_time*60))
      for (i in 1:ndiv){
        input$sliceButton
        str[i] <- (paste0(input$oldlink, "#t=", (i - 1)*(input$div_time*60 - input$ovl_time), "s"))
      }
      
    })
  }
)