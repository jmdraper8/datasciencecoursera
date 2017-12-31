pollutantmean <- function(directory, pollutant, id = 1:322) {
    
    #Assumption the working directory is set to the directory containing the data folder
    
    setwd("d:/OneDrive/Data Science/2. R Programming/Week 2/")
    
    if (directory != "") {

        myWorkingDirectory <- c(getwd(), "/", directory, "/", sep = "")
        myWD <- paste(myWorkingDirectory, collapse = "")
        print(myWD)
        
        
        if (pollutant == "sulfate" | pollutant == "nitrate") {
            
            setwd(myWD)
            file_names <- list.files(myWD, full.names=T)[id]
            

            your_data_frame <- do.call(rbind,lapply(file_names,read.csv))
            
            numdata <- your_data_frame[sapply(your_data_frame, is.numeric)] 
            
            results <- colMeans(numdata, na.rm = TRUE)
            
            if (pollutant == "sulfate") {
                
                print(results[1])
                
            } else if ( pollutant == "nitrate") {
                
                print(results[2])
                
            }
            
        } else {
            
            print(cat("ERROR: Invalid pollutant entered, valid options are sulfate or nitrate. pollutant: ", pollutant, sep = ""))
            
        }
                
    } else {
        print(cat("ERROR: Invalid directory entered. directory: ", directory, sep = ""))
    }

    
}