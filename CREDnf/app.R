library(shiny)

ncheck <- 24 # Number of checklist items
checkIDs <- c("1a", "1b",
              "2a", "2b", "2c.rater", "2c.stat", "2d", "2e",
              "3a", "3b", "3c", "3d", "3e",
              "4a", "4b", "4c", "4d", "4e",
              "5a", "5b", "5c",
              "6a", "6b",
              "7a"
)

# Vectors of checklist IDs
inputIDs <- paste0("checklist", checkIDs)  # Generate inputIDs
newIDs <- paste0("new", checkIDs)  # Generate newIDs
textIDs <- paste0("text", checkIDs)  # Generate textIDs
summaryIDs <- paste0("summary", checkIDs)  # Generate summaryIDs
sumIDs <- paste0("sum", checkIDs)
responseIDs <- paste0("response", checkIDs)

# An index of choices and vector of pre-existing choices
choicecode <- c(1,1,
                1,4,7,7,2,5,
                1,1,1,1,1,
                1,1,1,1,1,
                1,8,7,
                6,6,
                1
)
choicelist <- list(c("No", "Yes"),
                   c("No", "Yes", "Not applicable"),
                   c("No", "Yes, and the measure was defined a priori", "Yes, and the measure was not defined a priori", "Not applicable"),
                   c("No", "Yes, but a double-blind was not used", "Yes, and a double-blind was used"),
                   c("No", "Yes, and a standard-of-care intervention group was not used as a benchmark for improvement", "Yes, and a standard-of-care intervention group was used as a benchmark for improvement"),
                   c("No", "Yes", "Not applicable, the study does not take cognitive or behavioural measures"),
                   c("No", "Yes", "Not applicable, there was only one participant group"),
                   c("No", "Partially", "Yes")
)


# Text vectors
labels <- c("Was the protocol or analysis preregistered?",
            "Does the manuscript describe the sampling plan and/or justify the sample size used?",
            "Did the experiment include at least one control group or control condition?",
            "Was a double-blind appropriate in the present experiment?",
            "Were those who rate the outcomes blinded to group assignment?",
            "Were those who analysed the data blinded to group assignment?",
            "Were any measures taken to examine to what extend participants and experimenters remained blind?",
            "Is this a clinical efficacy study?",
            "Were data collected on psychosocial factors?",
            "Does the manuscript report whether participants were provided with a strategy?",
            "Does the manuscript describe the strategies that participants reported using?",
            "Does the manuscript report the methods used for online-data processing and artifact correction?",
            "Does the manuscript report condition and/or group effects for artifacts?",
            "Does the manuscript report how the online-feature extraction was defined?",
            "Does the manuscript report and justify the reinforcement schedule?",
            "Does the manuscript report the feedback modality and content?",
            "Does the manuscript report all brain activity variable(s) and/or contrasts used for feedback, as displayed to experimental participants?",
            "Does the manuscript report the hardware and software used?",
            "Does the manuscript report neurofeedback regulation success based on the feedback signal?",
            "Does the manuscript plot within-session and between-session regulation blocks of feedback variable(s), as well as pre-to-post resting baselines or contrasts?",
            "Does the manuscript statistically compare the experimental condition/group to the control condition(s)/group(s) (not only each group to baseline measures)?",
            "Does the manuscript report measures of clinical or behavioural significance and describe whether they were reached?",
            "Does the manuscript compare regulation success and behavioural outcomes?",
            "Does the manuscript include a link to any open access materials, analysis scripts, code, raw data, or final values?"
)
placeholders <- list("Copy the text from your manuscript that identifies the preregistration and includes a link to it",
                     "Copy the text from your manuscript that describes the sampling plan and justifies the sample size",
                     "Copy the text from your manuscript that describes the control group(s) and/or condition(s)",
                     "Copy the text from your manuscript that describes the double-blind and how it was implemented",
                     "Copy the text from your manuscript that describes the blind and how it was implemented",
                     "Copy the text from your manuscript that describes the blind and how it was implemented",
                     "Copy the text from your manuscript that describes the measures taken to examine whether participants and experimenters remained blind",
                     "Copy the text from your manuscript that describes the standard-of-care intervention group",
                     "Copy the text from your manuscript that describes the data collected on psychosocial factors",
                     "Copy the text from your manuscript that identifies whether one or more strategy was provided. If one or more strategy was provided, include the text describing the strategy or strategies.",
                     "Copy the text from your manuscript that describes the strategies participants used (note, these are not necessarily the same as the strategies provided)",
                     "Copy the text from your manuscript that describes the methods used for online-data processing and artifact correction",
                     "Copy the text from your manuscript that describes condition and/or group level artifacts",
                     "Copy the text from your manuscript that describes how the online-feature extraction was defined",
                     "Copy the text from your manuscript that describes and justifies the reinforcement schedule",
                     "Copy the text from your manuscript that describes the feedback modality and content",
                     "Copy the text from your manuscript that reports the brain activity variable(s) and/or contrasts used for feedback, as displayed to experimental participants",
                     "Copy the text from your manuscript that describes the hardware and software used",
                     "Copy the text from your manuscript that describes neurofeedback regulation success based on the feedback signal",
                     "Copy the text from your manuscript and/or insert the figure number(s) that plot within-session and between-session regulation blocks of feedback variable(s), as well as pre-to-post resting baselines or contrasts",
                     "Copy the text from your manuscript that describes the statistical comparison of the experimental condition/group to the control condition(s)/group(s)",
                     "Copy the text from your manuscript that reports measures of clinical or behavioural significance and describes whether they were reached. Ensure this text includes the URL where the measure of clinical or behavioural significance was preregistered or enter the source where this clinical or behavioural significance value has been previously established",
                     "Copy the text from your manuscript and/or the figure numbers that compare regulation success and behavioural outcomes",
                     "Copy the text from your manuscript detailing which items are available. Ensure this text includes a link to access the documents"
)
noboilers <- c("This experiment was not preregistered",
               "The manuscript does not describe the sampling plan or justify the sample size used",
               "This experiment did not include a control group or control condition",
               "NA: A double-blind was not appropriate for this experiment",
               "Those who rated the outcome were not blind to group assignment",
               "Those who analysed the data were not blind to group assignment",
               "No measures were taken to examine whether participants and experimenters remained blind",
               "NA: This is not a clinical efficacy study",
               "Psychosocial factors were not measured",
               "The manuscript does not report whether strategies were provided",
               "The strategies participants used were not recorded or not reported in the manuscript",
               "The manuscript does not report the methods used for online-data processing and artifact correction",
               "Condition and group effects for artifacts were not measured, or not reported in the manuscript",
               "The manuscript does not report how the online-feature extraction was defined",
               "The manuscript does not report or justify the reinforcement schedule",
               "The manuscript does not report the feedback modality and content",
               "All brain activity variable(s) and/or contrasts used for feedback, as displayed to experimental participants were not collected or are not reported in the manuscript",
               "The manuscript does not report the hardware and software used",
               "The manuscript does not report neurofeedback regulation success based on the feedback signal",
               "The manuscript does not plot within-session and between-session regulation blocks of feedback variable(s), as well as pre-to-post resting baselines or contrasts",
               "The manuscript does not statistically compare the experimental condition/group to the control condition(s)/group(s)",
               "The manuscript does not include measures of clinical or behavioural significance",
               "This manuscript does not compare regulation success and behavioural outcomes",
               "No additional documents related to the materials, analysis scripts, code, raw data, or final values are available for this manuscript"
)
naboilers <- c(NA, NA, 
               NA, "The experiment did not include a double-blind",
               "NA: There was only one participant group",
               "NA: There was only one participant group",
               "NA: There was only one participant group",
               "The present study is a clinical efficacy study. There was no standard-of-care intervention group",
               NA, NA, NA, NA, NA,
               NA, NA, NA, NA, NA,
               NA, NA, "NA: There was only one participant group",
               "NA:  the study does not take cognitive or behavioural measures",
               "NA:  the study does not take cognitive or behavioural measures",
               NA
)
strblank <- "This field has been left blank"


# Run checks on vector lengths
if (length(checkIDs)!=ncheck) {
    stop("checkIDs not equal to length of ncheck")
}
if (length(labels)!=ncheck) {
    stop("labels not equal to length of ncheck")
}
if (length(choicecode)!=ncheck) {
    stop("choicecode not equal to length of ncheck")
}
if (length(placeholders)!=ncheck) {
    stop("placeholders not equal to length of ncheck")
}
if (length(responseIDs)!=ncheck) {
    stop("responseIDs not equal to length of ncheck")
}
if (length(noboilers)!=ncheck) {
    stop("noboilers not equal to length of ncheck")
}
if (length(naboilers)!=ncheck) {
    stop("naboilers not equal to length of ncheck")
}
if (length(summaryIDs)!=ncheck) {
    stop("summaryIDs not equal to length of ncheck")
}
if (length(sumIDs)!=ncheck) {
    stop("sumIDs not equal to length of ncheck")
}



########################## START UI #############################

ui <- fluidPage(
    titlePanel(h2("CRED-nf Checklist")),
    
    navlistPanel(
        "Domains",
        tabPanel("About",
                 tags$div(HTML("<h1><u>C</u>onsensus on the <u>r</u>eporting and <u>e</u>xperimental <u>d</u>esign of clinical and cognitive-beharioural <u>n</u>euro<u>f</u>eedback studies (CRED-nf checklist)</h1>")),
                 tags$div(p("This webpage serves as an online tool to standardize reporting of the", 
                            a(href="https://academic.oup.com/brain/advance-article/doi/10.1093/brain/awaa009/5807912", "CRED-nf checklist."), 
                            "Please select the tabs on the left and answer the questions provided. When you respond ‘Yes’ to an item, you will be prompted to copy-paste the text from your manuscript that addresses the item. We recommend you also save this copy-pasted text in a text document as this webpage has a timeout of 20 minutes.", style = "font-size:15px")),
                 br(),
                 p("When completed, click the ‘Download summary’ button from the ‘Checklist summary’ tab. This will produce a table which you can include in your manuscript submission as supplementary material. Table formatting may vary if long responses to checklist items are submitted", style = "font-size:15px"),
                 br(),
                 tags$div(p("For full details about this checklist, the criteria regarding each item, and the motivation for its development, please see", 
                            a(href="https://academic.oup.com/brain/advance-article/doi/10.1093/brain/awaa009/5807912", "the associated manuscript here."), 
                            "To discuss or comment on the article please use the annotate function in PsyArXiv on ",
                            a(href="https://psyarxiv.com/nyx84/", "the preprint."),
                            "Writing comments requires a ",
                            a(href="https://web.hypothes.is/blog/hypothesis-live-on-cos-osf/", "hypothes.is"),
                            " account. We welcome feedback and will consider these annotations when the checklist is updated.",
                            style = "font-size:15px")),
                 br(),
                 tags$div(p("This tool has been created by Hugo Pedder and Robert Thibault of the University of Bristol. The content is taken from the published version of the CRED-nf checklist. If you encounter any bugs when using it or have any feedback, please raise an issue on",
                          a(href="https://www.github.com/hugaped/CRED-nf", "GitHub"), 
                          " or email robert.thibault@bristol.ac.uk with the subject `CRED-nf Shiny App`",
                          style = "font-size:15px"))
        ),
        tabPanel("Manuscript information",
                 textInput("title", label="Manuscript title", width="80%"),
                 textInput("author", label="Corresponding author name", width="80%"),
                 textInput("email", label="Corresponding author email", width="80%")),
        tabPanel("1. Pre-experiment",
                 h2("Pre-Experiment"),
                 lapply(1:2, function(i) {
                     wellPanel(
                         selectInput(inputIDs[i], h4(),
                                     choices = as.list(choicelist[[choicecode[i]]]), selected = NULL),
                         uiOutput(newIDs[i]),
                         textOutput(textIDs[i])
                     )
                 })
        ),
        
        tabPanel("2. Control groups",
                 h2("Control groups"),
                 lapply(3:8, function(i) {
                     wellPanel(
                         selectInput(inputIDs[i], h4(),
                                     choices = as.list(choicelist[[choicecode[i]]]), selected = NULL),
                         uiOutput(newIDs[i]),
                         textOutput(textIDs[i])
                     )
                 })
        ),
        
        tabPanel("3. Control measures",
                 h2("Control measures"),
                 lapply(9:13, function(i) {
                     wellPanel(
                         selectInput(inputIDs[i], h4(),
                                     choices = as.list(choicelist[[choicecode[i]]]), selected = NULL),
                         uiOutput(newIDs[i]),
                         textOutput(textIDs[i])
                     )
                 })
        ),
        
        tabPanel("4. Feedback specifications",
                 h2("Feedback specifications"),
                 lapply(14:18, function(i) {
                     wellPanel(
                         selectInput(inputIDs[i], h4(),
                                     choices = as.list(choicelist[[choicecode[i]]]), selected = NULL),
                         uiOutput(newIDs[i]),
                         textOutput(textIDs[i])
                     )
                 })
        ),
        
        tabPanel("5. Outcome measures - Brain",
                 h2("Outcome measures - Brain"),
                 lapply(19:21, function(i) {
                     wellPanel(
                         selectInput(inputIDs[i], h4(),
                                     choices = as.list(choicelist[[choicecode[i]]]), selected = NULL),
                         uiOutput(newIDs[i]),
                         textOutput(textIDs[i])
                     )
                 })
        ),
        tabPanel("6. Outcome measures - Behaviour",
                 h2("Outcome measures - Behaviour"),
                 lapply(22:23, function(i) {
                     wellPanel(
                         selectInput(inputIDs[i], h4(),
                                     choices = as.list(choicelist[[choicecode[i]]]), selected = NULL),
                         uiOutput(newIDs[i]),
                         textOutput(textIDs[i])
                     )
                 })
        ),
        tabPanel("7. Data storage",
                 h2("Data storage"),
                 lapply(24, function(i) {
                     wellPanel(
                         selectInput(inputIDs[i], h4(),
                                     choices = as.list(choicelist[[choicecode[i]]]), selected = NULL),
                         uiOutput(newIDs[i]),
                         textOutput(textIDs[i])
                     )
                 })
        ),
        tabPanel("Checklist summary",
                 tags$span(style="color:red", 
                           strong(em(textOutput("warningtext")))
                 ),
                 
                 h2("CRED-nf checklist summary output"),
                 tags$div(
                     tags$ol(
                         tags$li("Pre-experiment"),
                         tags$ol(
                             lapply(1:2, function(i) {
                                 tags$li(textOutput(summaryIDs[i]))
                             }),
                             type="a"
                         ),
                         
                         tags$li("Control groups"),
                         tags$ol(
                             lapply(3:4, function(i) {
                                 tags$li(textOutput(summaryIDs[i]))
                             }),
                             tags$li("Blinding of those who rate the outcome and those who analyse the data:",
                                     tags$ul(
                                         tags$li(textOutput(summaryIDs[5])),
                                         tags$li(textOutput(summaryIDs[6]))
                                     )
                             ),
                             lapply(7:8, function(i) {
                                 tags$li(textOutput(summaryIDs[i]))
                             }),
                             type="a"
                         ),
                         
                         tags$li("Control measures"),
                         tags$ol(
                             lapply(9:13, function(i) {
                                 tags$li(textOutput(summaryIDs[i]))
                             }),
                             type="a"
                         ),
                         
                         tags$li("Feedback specifications"),
                         tags$ol(
                             lapply(14:18, function(i) {
                                 tags$li(textOutput(summaryIDs[i]))
                             }),
                             type="a"
                         ),
                         
                         tags$li("Outcome measures - Brain"),
                         tags$ol(
                             lapply(19:21, function(i) {
                                 tags$li(textOutput(summaryIDs[i]))
                             }),
                             type="a"
                         ),
                         
                         tags$li("Outcome measures - Behaviour"),
                         tags$ol(
                             lapply(22:23, function(i) {
                                 tags$li(textOutput(summaryIDs[i]))
                             }),
                             type="a"
                         ),
                         
                         tags$li("Data storage"),
                         tags$ol(
                             lapply(24, function(i) {
                                 tags$li(textOutput(summaryIDs[i]))
                             }),
                             type="a"
                         )
                     )
                 ),
                 
                 br(), br(),
                 downloadButton("reportpdf", "Download summary")
        ),
        widths=c(3,9)
    )
    
)




########################## START SERVER #############################

server <- function(input, output, session) {
    
    ############ Observe inputs to react to selections made by user ############
    
    observe({
        for (i in 1:ncheck) {
            updateSelectInput(session, inputId = inputIDs[i], label = labels[i],
                              choices = choicelist[[choicecode[i]]])
        }
    })
    
    ############ Add text boxes for manuscript info, etc #########
    assign("title", renderText({input$title}))
    assign("author", renderText({input$author}))
    assign("email", renderText({input$email}))

  
    ############ Add open end box to enter text if they user has selected "yes" ############
    
    lapply(1:ncheck, function(i) {
        output[[newIDs[i]]] <- renderUI({
            if (!input[[inputIDs[i]]] %in% c("Yes", 
                                             "Yes, and the measure was defined a priori", 
                                             "Yes, and the measure was not defined a priori", 
                                             "Yes, and a double-blind was used", 
                                             "Yes, and a standard-of-care intervention group was used as a benchmark for improvement",
                                             "Partially")) {
                return(NULL)
            } else {
                textAreaInput(responseIDs[i], label=NULL, placeholder=placeholders[[i]])
            }
        })
    })
    
    
    
    ########### Return text ############
    
    lapply(1:ncheck, function(i) {
        output[[paste0("text", checkIDs[i])]] <- renderText({
            if (input[[inputIDs[i]]] %in% c("Yes", "Yes, and the measure was defined a priori", "Yes, and the measure was not defined a priori")) {
                return(input[[responseIDs[i]]])
            }
        })
    })
    
    
    ############# Generate report summary #############
    
    params <- list()
    lapply(1:ncheck, function(i) {
        assign(sumIDs[i],
               reactive({
                   
                   if (input[[inputIDs[i]]] %in% c("Yes", 
                                                   "Yes, and the measure was defined a priori",
                                                   "Yes, and a double-blind was used",
                                                   "Yes, and a standard-of-care intervention group was used as a benchmark for improvement",
                                                   "Partially")) {
                       if (input[[responseIDs[i]]]=="") {
                           return(strblank)
                       } else {
                           return(input[[responseIDs[i]]])
                       }
                   } else if (input[[inputIDs[i]]] == "No") {
                       return(noboilers[i])
                   } else if (input[[inputIDs[i]]] %in% c("Not applicable",
                                                          "Not applicable, the study does not take cognitive or behavioural measures",
                                                          "Not applicable, there was only one participant group")) {
                       return(naboilers[i])
                   } else if (input[[inputIDs[i]]] == "Yes, and the measure was not defined a priori") {
                       temp <- input[[responseIDs[i]]]
                       
                       if (temp=="") {
                           temp <- strblank
                       }
                       
                       # Remove leading/trailing whitespace and add period if not at end
                       temp <- trimws(temp)
                       if (!grepl(".+\\.$", temp)) {
                           temp <- paste0(temp, ".")
                       }
                       return(paste(temp, "This clinical or behavioural significance value was not defined a priori.", sep=" "))
                   } else if (input[[inputIDs[i]]] %in% c("Yes, but a double-blind was not used",
                                                          "Yes, and a standard-of-care intervention group was not used as a benchmark for improvement")) {
                       return(naboilers[i])
                   }
               }),
               envir=globalenv()
        )
        
        output[[summaryIDs[i]]] <- renderText({eval(parse(text=paste0(sumIDs[i], "()")))})
        
    })
    
    
    ########## Add warning text for items left blank ##########
    
    warningtext <- reactive({
        blankindex <- vector()
        
        for (i in 1:ncheck) {
            if (input[[inputIDs[i]]] %in% c("Yes", "Yes, and the measure was defined a priori", "Yes, and the measure was not defined a priori")) {
                if (input[[responseIDs[i]]]=="") {
                    blankindex <- append(blankindex, i)
                }
            }
        }
        
        if (length(blankindex)>0) {
            return(paste0("Warning: Checklist item(s) ", paste(checkIDs[blankindex], collapse=", "), 
                          " have been left blank."))
        } else {return(NULL)}
    })
    output$warningtext <- renderText(warningtext())
    
    
    ########## Add option to export to PDF and/or Docx ##########
    
    output$reportpdf <- downloadHandler(
        filename = "checklist.pdf",
        content = function(file) {
            # Copy report file to temp directory before processing it to avoid permission issues
            tempReport <- file.path(tempdir(), "report.Rmd")
            file.copy("report.Rmd", tempReport, overwrite = TRUE)
            
            # Set up parameters to pass to Rmd document
            params <- list("title"=title(), "author"=author(), "email"=email(),
                           "domain1"=c(sum1a(), sum1b()),
                           "domain2"=c(sum2a(), sum2b(), sum2c.rater(), sum2c.stat(), sum2d(), sum2e()),
                           "domain3"=c(sum3a(), sum3b(), sum3c(), sum3d(), sum3e()),
                           "domain4"=c(sum4a(), sum4b(), sum4c(), sum4d(), sum4e()),
                           "domain5"=c(sum5a(), sum5b(), sum5c()),
                           "domain6"=c(sum6a(), sum6b()),
                           "domain7"=c(sum7a()),
                           "boilers"=c(noboilers, naboilers, strblank)
            )
            
            # Knit the document using params
            rmarkdown::render(tempReport, output_file = file,
                              params=params,
                              envir=new.env(parent = globalenv()) # Eval in child of global env to isolate Rmd code from app code
            )
        }
    )
    
}

shinyApp(ui, server)