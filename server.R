# Server code
library(httr)
library(R6)

Line <- R6Class(
  "Line",
    public = list(
      line = "",
      delay = 0,
      status = 0,
      line_short = "",
      stations = ""
    )
)

maps_json_result <- function(data) {

  # Maps to class
  # Implements this for future features
  line = Line$new()
  line$delay = data$delay
  line$status = data$status
  line$line_short = data$short_name
  line$stations = paste(
    data$from,
    data$to,
    sep=" to ")

  # Returns UI
  fluidRow(
    column( 2,
      modalButton(line$line_short)
    ),
    column( 10,
      fluidRow(
        splitLayout(
        h4("Status"),
        h4("Est. Delay Time"),
        h4("Stations affected")
        )
      ),
      fluidRow(
        splitLayout(
        helpText(switch(line$status + 1,
        "Clear",
        "Minor Delays",
        "Delays"
        )),
        helpText(if (is.null(line$delay)) "nil" else paste(line$delay,"mins")),
        helpText(if (length(line$stations)==0) "nil" else line$stations)
        )
      )
    )
  )

}

function(input, output) {
  # Gets
  GET("https://is-mrt-down-staging.herokuapp.com/v1/status") -> d

  # Maps
  Map(maps_json_result, content(d)$data) -> lines

  # Renders
  output$one <- renderUI({
    lines[1]
  })
  output$two <- renderUI({
    lines[2]
  })
  output$three <- renderUI({
    lines[3]
  })

} -> server
