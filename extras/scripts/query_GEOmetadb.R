#get the brapa datasets
library(GEOmetadb)
geometadbfile <- getSQLiteFile()
con <- dbConnect(SQLite(), geometadbfile)
geo_tables <- dbListTables(con)

sql <- paste("SELECT DISTINCT gse.title,gse.gse",
             "FROM",
             "  gsm JOIN gse_gsm ON gsm.gsm=gse_gsm.gsm",
             "  JOIN gse ON gse_gsm.gse=gse.gse",
             "  JOIN gse_gpl ON gse_gpl.gse=gse.gse",
             "  JOIN gpl ON gse_gpl.gpl=gpl.gpl",
             "WHERE",
             "  gsm.molecule_ch1 like '%total RNA%' AND",
             "  gpl.organism LIKE '%Brassica rapa%'",sep=" ")
rs <- dbGetQuery(con,sql)
rs
dim(rs)