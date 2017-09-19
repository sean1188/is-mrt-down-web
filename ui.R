# UI Code

fluidPage(
  fluidRow(
    column(5,
    img(src='logo.png', align = "left"),
    h1("is MRT Down?")
    )
  ),

  helpText(" Realtime information on train delays."),

  wellPanel(
    uiOutput("one")
  ),

  wellPanel(
    uiOutput("two")
  ),

  wellPanel(
    uiOutput("three")
  )
) -> ui
