complete <- function(directory, id = 1:322) {
    
    #Assumption the working directory is set to the directory containing the data folder
    
    setwd("d:/OneDrive/Data Science/2. R Programming/Week 2/")
    
    if (directory != "") {
        
        myWorkingDirectory <- c(getwd(), "/", directory, "/", sep = "")
        myWD <- paste(myWorkingDirectory, collapse = "")
        print(myWD)
            
        setwd(myWD)
        file_names <- list.files(myWD, full.names=T)[id]
     
            
        nrows <- sapply(file_names, function(f) sum(complete.cases(read.csv(f))))
        rowlabels <- nrows
        
        data.frame(id=sprintf('%3d', id), 
                   nobs=rowlabels,
                   row.names=NULL
        )
        
    }   
    
}