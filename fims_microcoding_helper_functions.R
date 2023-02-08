multiplesheets <- function(fname, list_name) {
#this function uses the readxl package to read the sheets inside an Excel document into a list of dfs, each called their sheet name
  #fname = file path to the Excel file
  #list_name = what you want the list of dfs to be called
  
  # getting info about all excel sheets
  sheets <- readxl::excel_sheets(fname)
  tibble <- lapply(sheets, function(x) readxl::read_excel(fname, sheet = x))
  data_frame <- lapply(tibble, as.data.frame)
  # assigning names to data frames
  names(data_frame) <- sheets
  assign(list_name, data_frame, envir = .GlobalEnv)
}
