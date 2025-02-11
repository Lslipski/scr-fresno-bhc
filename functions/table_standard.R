


table_standard <- function(data) {
  
  tab <- data %>% 
    DT::datatable(extensions = 'Buttons',
                  options = list(
                    paging = TRUE,
                    searching = TRUE,
                    fixedColumns = TRUE,
                    autoWidth = TRUE,
                    ordering = TRUE,
                    dom = 'ftBlp',
                    buttons = c('copy', 'csv')
                  ),
                  class = "display")
  
  return(tab)
}