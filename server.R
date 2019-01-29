library(shiny)
library(shinydashboard)
library(googleVis)
library(leaflet)
library(maps)
library(dplyr)
library(tidyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$firehouselocation <- renderLeaflet({
    leaflet() %>%
      addProviderTiles('CartoDB.Voyager') %>%
      addMarkers(
        clusterOptions = markerClusterOptions(),
        lng = firehouse$Longitude,
        lat = firehouse$Latitude,
        popup = firehouse$FacilityName
      )
  })
  output$timefreq <- renderGvis({
    gvisColumnChart(
      data = tpfire_false,
      xvar = 'incident.time',
      yvar = c("False Alarm", "Fire Incident"),
      options = list(
        vAxes = "[{title:'Counts'}]",
        hAxes = "[{title:'Time(24-hour clock)'}]",
        bar = "{groupWidth:'80%'}"
      )
    )
  })
  output$borough <- renderGvis({
    gvisColumnChart(
      data = bfire_false,
      xvar = 'Borough',
      yvar = c("False Alarm", "Fire Incident"),
      options = list(
        title = 'Fire Incident and False Alarm',
        vAxes = "[{title:'Counts'}]",
        hAxes = "[{title:'Borough'}]",
        bar = "{groupWidth:'80%'}"
      )
    )
  })
})