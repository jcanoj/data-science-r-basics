# library(plyr)

## Returns Hospital name with lowest 30-day death rate for a state

best <- function(state, outcome){
        
        ## Read outcome data
        df <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE, na.strings = "Not Available")
        
        ## Check that state and outcome are valid
        
        # heart attack is col 11; heart failure, col 17, and pneumonia col 23
        valid.outcomes <- c('heart attack' = 11, 'heart failure'=17, 'pneumonia'=23)
        
        if (!state %in% df$State | !outcome %in% names(valid.outcomes)){
                stop(print("invalid state or outcome"))
        }
        
        
        ## Return hospital name in that state with lowest 30-day death rate
        
        # Reduce the dataframe to the columns that we need
        # column 2 is the Hospital Name
        # column 7 is the State
        # na.omit delete observations with missing data
        df <- na.omit(df[,c(2,7,valid.outcomes[outcome])])
        names(df) <- c("Hospital", "State", "Outcome")
        
        df <- arrange(df, Outcome, State, Hospital)
        dfState <- df[df$State == state, ]
        
        # Return Best Hospital Name
        dfState$Hospital[1]
}


rankhospital <- function(state, outcome, num = "best"){
        
        ## Read outcome data
        df <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE, na.strings = "Not Available")
        
        ## Check that state and outcome are valid
        # heart attack is col 11; heart failure, col 17, and pneumonia col 23
        valid.outcomes <- c('heart attack' = 11, 'heart failure'=17, 'pneumonia'=23)
        
        if (!state %in% df$State | !outcome %in% names(valid.outcomes)){
                stop(print("invalid state or outcome"))
        }
        
        ## Return hospital name in that state with the given rank 30-day death rate
        df <- na.omit(df[,c(2,7,valid.outcomes[outcome])])
        names(df) <- c("Hospital", "State", "Outcome")
        df <- arrange(df, Outcome, State, Hospital)
        dfState <- df[df$State == state, ]
        
        return.Hospital <- function(rank){
                switch(as.character(rank),
                       best = dfState$Hospital[1],
                       worst = dfState$Hospital[nrow(dfState)],
                       dfState$Hospital[rank]
                       )
                
        }
        
        return.Hospital(num)
        
}

rankall <- function(outcome, num = 'best'){
        
        ## Read outcome data
        df <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE, na.strings = "Not Available")
        
        ## Check that state and outcome are valid
        valid.outcomes <- c('heart attack' = 11, 'heart failure'=17, 'pneumonia'=23)
        
        if (!outcome %in% names(valid.outcomes)){
                stop(print("invalid outcome"))
        }
        
        ## For each state, find the hospital of the given rank
        df <- na.omit(df[,c(2,7,valid.outcomes[outcome])])
        names(df) <- c("Hospital", "State", "Outcome")
        
        df <- arrange(df, Outcome, State, Hospital)
        
        dfSplit <- split(df, df$State)
        
        return.Hospital <- function(dataf, rank = num){
                switch(as.character(rank),
                       best = dataf$Hospital[1],
                       worst = dataf$Hospital[nrow(dataf)],
                       dataf$Hospital[rank]
                )
        }
        
        rankinglist <- sapply(dfSplit, return.Hospital)
        
        
        ## Return a data frame with the hospital names and the
        ## abbreviated state name
        
        data.frame (hospital = rankinglist, state = names(rankinglist))
}
                