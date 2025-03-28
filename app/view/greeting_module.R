box::use(
  shiny[moduleServer, NS, textOutput, renderText],
  app/logic/my_function,
  )

#' @export
ui <- function(id) {
  ns <- NS(id)  # Create a namespaced version of the ID
    textOutput(ns("greeting"))
}

#' @export
server <- function(id, name) {
  moduleServer(id, function(input, output, session) {
    output$greeting <- renderText({
      my_function$greet_user(name())
    })
  })
}