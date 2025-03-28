box::use(shiny[fluidPage, textInput, reactive, moduleServer])  # Import shiny functions
box::use(app/view/greeting_module)  # Import the module

#' @export
ui <- function(id) {
  ns <- shiny::NS(id)
  fluidPage(
    textInput(ns("nombre"),"Your name:"),
    greeting_module$ui(ns("salutacion"))
  )
}
#' @export
server <- function(id){
  moduleServer(id, function(input, output, session){
    nome <- reactive(input$nombre)
    greeting_module$server("salutacion", nome)
  })
}