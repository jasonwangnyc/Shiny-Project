shinyUI(
  dashboardPage(
    skin = 'red',
    title = 'HRRC',
    header = dashboardHeader(
      titleWidth = '100%',
      title = span(
        tags$img(src = "firefighters-870888_1920 (1).jpg", width = '110%', style =
                   'margin-left: -20px;'),
        column(
          12,
          class = "title-box",
          tags$h1(
            class = "primary-title",
            style = 'margin-top:17px;',
            'NYC Fire Incident and False Alarm'
          ),
          tags$h2(class = "primary-subtitle", style = 'margin-top:13px;', '2013-2017')
        )
      ),
      dropdownMenuOutput("helpMenu")
    ),
    dashboardSidebar(sidebarMenu(menuItem('Map', tabName = 'Fmap')),
                     sidebarMenu(menuItem('Data', tabName = 'data'))),
    dashboardBody(
      tabItems(
        tabItem(tabName = "Fmap",
                fluidRow(
                  column(12,
                         titlePanel('Firehouse location'),
                         position = 'center')
                ),
                fluidRow(column(
                  12,
                  leafletOutput('firehouselocation')
                ))),
        tabItem(tabName = 'data',
                fluidRow(
                  column(
                    12,
                    titlePanel('Frequencies of Fire Incident and False Alarm'),
                    position = 'center'
                  )
                ),
                fluidRow(
                  column(
                    12,
                    htmlOutput('timefreq'),
                    fluidRow(column(
                      12,
                      titlePanel('fire incident and false alarm in each borough'),
                      position = 'center'
                    )),
                    fluidRow(column(12,
                                    htmlOutput('borough')))
                  )
                ))
      ),
      tags$style(
        type = "text/css",
        "
        .content-wrapper {
        margin-top: 50px;
        }
        .content {
        padding-top: 100px;
        }
        .title-box {
        position: absolute;
        text-align: center;
        top: 96%;
        left: 50%;
        transform:translate(-50%, -50%);
        }
        .main-header .logo {
        height: 200px;
        position: center;
        }
        @media (max-width: 5000px) {
        .main-header {
        padding: 0 0;
        position: relative;
        }
        .main-header .logo,
        .main-header .navbar {
        width: 100%;
        float: none;
        }
        .main-header .navbar {
        margin: 0;
        }
        .main-header .navbar-custom-menu {
        float: right;
        }
        }
        .main-sidebar {
        position: absolute;
        }
        .left-side, .main-sidebar {
        padding-top: 175px;
        }"
)
      )
      )
      )
