library(shinydashboard)
library(shiny)

body <- dashboardBody (

	fluidRow (
			box (title="GENE NAME",width=4, textOutput('gene_name')),
                	box (title="GENE POPULARITY - 2018",width=4, dataTableOutput('YYpathway')),
                	box (title="PUBLICATION INCREASE - 2018",width=4, textOutput('pubIncrease'))
			),

	fluidRow (
	                box (title="FUNCTIONS (PATHWAYS)",width=6, dataTableOutput('pathways')),
        	        box (title="PROTEIN INTERACTIONS",width=6, dataTableOutput('ppi'))
                	),	

        fluidRow (
                        box (title="TISSUE EXPRESSION",width=12, dataTableOutput('tissues'))
                        ),

 	fluidRow (
	                box (title="TOP 100 PAPERS",width=6, dataTableOutput('top100papers')),
        	        box (title="TOP 20 PAPERS - 2018",width=6, dataTableOutput('top20papers'))
                	)
	)

ui <- dashboardPage (

	dashboardHeader(title="row layout"),
	dashboardSidebar(),
	body
	)

shinyApp (

	ui=ui, 
	server=function(input,output) { 
		output$gene_name <- renderText(entryName);
                output$pubIncrease <- renderText(increase);
		output$pathways <- renderDataTable (kegg.df);	
		output$ppi <- renderDataTable(ppi);
                output$tissues <- renderDataTable(tissue_exp);
		output$top100papers <- renderDataTable(PMCcited_ann.df);
		output$top20papers <- renderDataTable(top20_currentYear.df)
		} 
	)


