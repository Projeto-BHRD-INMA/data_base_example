# Database discussion

## Useful links

### General

- [Prisma protocol](http://www.prisma-statement.org/Protocols/): systematic review protocol
- [Data carpentry for Ecology](https://datacarpentry.org/ecology-workshop/): basic notions of database, R and SQL
- [Darwin Core](https://dwc.tdwg.org/): biodiversity data standard

### Plant databases

- [TRY](https://www.try-db.org/TryWeb/Home.php): plants' traits database
- [TreeCo](http://labtrop.ib.usp.br/doku.php?id=projetos:treeco:start): Neotropical Tree Communities database

## A very basic presentation


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
