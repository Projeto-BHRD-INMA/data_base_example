###########################################################
##### Example: gbif search and relational data ############
###########################################################
# Sara Mortara, first version for pci database meeting 

## loading packages ####
library(rgbif)
library(dplyr)

## basic search ####
sp <- c("Asplenium triquetrum", "Asplenium truncorum")

res <- list()

# gbif_search
for(i in 1:length(sp)){
res[[i]] <- occ_search(scientificName = sp[i], 
           limit=100, 
           return = 'data') 
}

resu <- bind_rows(res)

write.table(resu, 'data/01_gbif_search.csv', 
            col.names = TRUE, 
            row.names = FALSE,
            sep = ",")


