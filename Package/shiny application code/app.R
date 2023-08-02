#requirement
#source("int_functions/requirement.R")



##########################################################
##########################################################
##########################################################
ui <- fluidPage(
  navbarPage(
    theme = bs_theme(version = 3, bg = "white", fg = "black", primary ="#ff4f00"),
    collapsible = TRUE,
    HTML('<a style="text-decoration:none;
               cursor:default;
                    color:#ff4f00;
                    " class="active" href="#">tool</a>'),
    id="nav",
    windowTitle ="tool",

    tabPanel("tab1",
             sidebarLayout(
               sidebarPanel(
                 textInput("folder_path", label = "Enter folder path:"),
                 radioButtons("vtype","type: ",choices = c("type1","type2"), selected="type1"),
                 actionButton("submit_button", "Submit"),
               ),
               mainPanel(

               )
             )
    )


))

##########################################################
##########################################################
##########################################################
server <- function(input, output, session) {

}

# Run the application
shinyApp(ui = ui, server = server)
