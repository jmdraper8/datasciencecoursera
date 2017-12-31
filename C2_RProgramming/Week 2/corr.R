corr <- function(directory, threshold = 0) {
    
    setwd("d:/OneDrive/Data Science/2. R Programming/Week 2/")
    
    if(grep("specdata", directory) == 1) {
        directory  <- c(getwd(), "/", directory, "/", sep = "")
        myWD <- paste(directory, collapse = "")
        setwd(myWD)
    }
    
    
   
    complete_table <- complete("specdata", 1:322)
    nobs <- complete_table$nobs
    ids <- complete_table$id[nobs > threshold]
    id_len <- length(ids)
    corr_vector <- rep(0, id_len)
    
    # find all files in the specdata folder
    all_files <- as.character( list.files(myWD) )
    file_paths <- paste(all_files, sep="")
    
    j <- 1
    for(i in ids) {
        
        current_file <- read.csv(file_paths[as.numeric(i)], header=T, sep=",")
        corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
        print(corr_vector[j])
        j <- j + 1
        
    }
    result <- corr_vector
    return(result)   
}