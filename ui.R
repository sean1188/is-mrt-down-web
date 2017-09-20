# UI Code

fluidPage(
  fluidRow(
    column(12,
    titlePanel("is MRT Down?")
    )
  ),

  helpText("Realtime information on train delays."),

  fluidRow(
    column(2,
      sidebarPanel(
        verticalLayout(
          a("About", href="http://www.covve.co"),
          a(href="","API")
        ),
        width = 12
      )
    ),

    column(10,
      wellPanel(
        uiOutput("one")
      ),

      wellPanel(
        uiOutput("two")
      ),

      wellPanel(
        uiOutput("three")
      )
    )
  )

) -> ui
