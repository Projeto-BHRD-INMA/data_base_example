#########################################
##### creating separate data tables ####
########################################
# Sara Mortara, first version for pci database meeting 

# reading standard table output from 
sibbr <- read.csv("data/DwC_para_SiBBr.csv", 
                  stringsAsFactors = FALSE)
# reading output
resu <- read.csv("data/01_gbif_search.csv")

# vector w/ categories, each will be a different data.frame
categoria <- unique(sibbr$categoria) 
categoria

sibbr_cat <- list()
for(i in 1:length(categoria)){
  sibbr_cat[[i]] <- sibbr$termo[sibbr$categoria == categoria[i]] 
}

resu_list <- list()
for(i in 1:length(categoria)){
  resu_list[[i]] <- resu[, names(resu) %in% sibbr_cat[[i]]]
}

names(resu_list) <- categoria

# checking
sapply(resu_list, ncol)
sapply(resu_list, nrow)

names(resu_list)

##### creating the three spredsheets as example #####
## each data.frame w/ its id 

## occurrence table
occ <- bind_cols(idOcc =  paste("idOcc", sprintf('%02d', 1:nrow(resu)), sep = "_"),
                 resu_list$occurrence)

## location table
loc <- resu_list$locality %>%
  .[!duplicated(.['decimalLatitude', 'decimalLongitude',]),] %>%
  bind_cols(idLoc =  paste("idLoc", sprintf('%02d', 1:nrow(.)), sep = "_"),
            .)

head(loc)

## taxon table
tax <- resu_list$taxon %>%
  .[!duplicated(.$scientificName) 
      & !is.na(.$scientificName)
      & .$scientificName != "",] %>%
  bind_cols(idSp =  paste("idSp", sprintf('%02d', 1:nrow(.)), sep = "_"),
            .)

## making a list w/ all tables
data <- list(occurrence = occ, 
             location = loc, 
             taxon = tax)

# writing data in example_data dir 
#dir.create("example_data")

for(i in 1:length(data)) {
  write.table(data[[i]],
              paste0("example_data/", names(data)[i], ".csv"),
              col.names = TRUE,
              row.names = FALSE, 
              sep = ",")
}
