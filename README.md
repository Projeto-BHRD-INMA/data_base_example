# Data base discussion

## Useful links

- (Prisma protocol)[http://www.prisma-statement.org/Protocols/]

## Data base example 

Example of relational data tables in DwC format. Input data is the result of a search in the GBIF plataform, for two fern species: *Asplenium triquetrum* and *Asplenium truncorum* using the `rgbif` package. 

All code is in R and each data table has its own id. Without any database structure, but data is already following the biodiversity standard and with version control.  

- code in `R` directory
- input data in `data` directory
- example of relational data tables in `example_data` directory

`example_data` data tables:

- location (idLoc)
- occurrence (idOcc)
- taxon (idTax)
