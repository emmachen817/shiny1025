library(shiny)
library(shinyIncubator)
require(rCharts)
library(rHighcharts)
shinyUI(navbarPage(
    
  
  title = '功能選取',

  tabPanel('詞雲',
           titlePanel("詞雲展示"),
           sidebarLayout(
             sidebarPanel(
               fileInput('file1', 'Choose File',accept=c('text/txt','.txt')),
               sliderInput("freq", "字詞頻率控制:",min = 2, max = 10, value = 3),
               sliderInput("max","字詞展示個數:",min = 5, max = 25, value = 17),
               downloadButton('wf', 'DownloadWordFreq')
             ),
             mainPanel(plotOutput("plot"),chartOutput("baplot"))
             ,position = c("right"))
  ),
  tabPanel('集群',
           titlePanel("集群展示"),
           sidebarLayout(
             mainPanel(plotOutput("clplot", height = 1000, width = 1000)),
             sidebarPanel(
               sliderInput("pz", "集群字體大小",min = 0.5, max = 3, value = 1.23),
               numericInput("cn","集群群數",min=2,max=8,value=3),
               downloadButton('dc', 'Download')), fluid = TRUE)),
  
  tabPanel('脈絡分析',
           titlePanel("脈絡分析"),
           
           sidebarLayout(
           sidebarPanel(
             
             numericInput("k","主題數",min=10,max=50,value=30),
             downloadButton('logLiktest', 'Download')),
           
           mainPanel(plotOutput("storyplot",height = 1000, width = 1000))  , fluid = TRUE)),
  
  tabPanel('文字相關',
           titlePanel("字詞相關展現"),
           textInput("dd", "輸入:"),
           dataTableOutput(outputId="table"), fluid = TRUE) ,
  
  tabPanel('facebook爬文',
           titlePanel("台灣美食"),
           checkboxInput(inputId = "tp",
                         label = strong("台北"),
                         value = FALSE),
           checkboxInput(inputId = "tc",
                         label = strong("台中"),
                         value = FALSE),
           checkboxInput(inputId = "tn",
                         label = strong("台南"),
                         value = FALSE),
           checkboxInput(inputId = "hs",
                         label = strong("高雄"),
                         value = FALSE),
           sidebarLayout(sidebarPanel(
             
             sliderInput("mmax","字詞展示個數:",min = 1, max = 100, value = 100)
           ),
                         # Show a tabset that includes a plot, summary, and table view
                         # of the generated distribution
                         mainPanel(plotOutput("ptplot",height = 1500, width = 1000 )), fluid = TRUE))

  
))


