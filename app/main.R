box::use(shiny[textInput, reactive, moduleServer, observeEvent],
         htmltools[h3],
         bslib[page_sidebar, bs_theme],
         waiter[useWaitress, Waitress],)  # Import shiny functions
box::use(app/view/greeting_module)  # Import the module

#' @export
ui <- function(id) {
  ns <- shiny::NS(id)
  page_sidebar(
    useWaitress(color = "#3459e6", percent_color = "#212529"),
    theme = bs_theme(bootswatch = "zephyr",
                     version = 5)
    # ,
    # textInput(ns("nombre"),"Your name:"),
    # greeting_module$ui(ns("salutacion"))
  )
}
#' @export
server <- function(id){
  moduleServer(id, function(input, output, session){
    waitress <- Waitress$
      new(theme = "overlay-percent")$
      start()
        for(i in 1:10){
          waitress$inc(10)
          Sys.sleep(.3)
        }
    waitress$close()
    # nome <- reactive(input$nombre)
    # greeting_module$server("salutacion", nome)
  })
}