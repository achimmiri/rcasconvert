getsmiles<-function(getCAS)
{
  ###CAS: 328-50-7
  ### To call the function getsmiles("CAS: 328-50-7")
  getCAS1<-stringr::str_replace(getCAS,pattern='CAS:',replacement ="")
  getCAS2<-stringr::str_trim(getCAS1)
  ################################
  url<- "http://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/"
  out<-tryCatch({jsonlite::fromJSON(paste0(url,getCAS2, "/property/InChIKey"))}, error = function(x) {return(NA)})
  out1<-tryCatch({jsonlite::fromJSON(paste0(url,getCAS2, "/property/CanonicalSMILES"))}, error = function(x) {return(NA)})
  out2<-tryCatch({jsonlite::fromJSON(paste0(url,getCAS2, "/property/InChI"))}, error = function(x) {return(NA)})
  #################################https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/smiles/
  OSM<-tryCatch({out1$PropertyTable$Properties$CanonicalSMILES},error=function(cond){return(NA)})
  ################################
  return(tryCatch({OSM[1]},error=function(cond){return(NA)}))
  ########################################
}

