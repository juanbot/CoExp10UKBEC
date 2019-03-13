
#' initDb - Initialization of the package so the 10 UKBEC networks can be used with
#' CoExpNets
#'
#'
#' @param mandatory If this parameter is `TRUE` then the networks will be added no matter whether they were already there.
#' 
#'
#' @return No value 
#' @export
#'
#' @examples
initDb = function(mandatory=F){
  the.dir = system.file("", "micro19K", package = "CoExp10UKBEC")
  tissues = c("CRBL", "FCTX", "HIPP", "MEDU", "OCTX", "PUTM", "SNIG", "TCTX", 
              "THAL", "WHMT")
  nets = residuals = NULL
  for(tissue in tissues){
    nets = c(nets, paste0("net",tissue,".12.signed.it.20.rds_cor_pca.rds"))
    residuals = c(residuals, paste0(tissue,".mic.expr.data.19K.rds"))
  }
  
  for(tissue in tissues){
    net = nets[which(tissues == tissue)]
    residual = residuals[which(tissues == tissue)]
    CoExpNets::addNet(which.one="10UKBEC",
                      tissue=tissue,
                      netfile=paste0(the.dir,"/",net),
                      ctfile=paste0(the.dir,"/",net,".celltype.csv"),
                      gofile=paste0(the.dir,"/",net,"_gprofiler.csv"),
                      exprdatafile=paste0(the.dir,"/",residual),
                      overwrite=mandatory)
  }
}

#' Title
#'
#' @param probes 
#'
#' @return
#' @export
#'
#' @examples
fromIlluminaProbe2GeneSymbol = function(probes){
  probesdata = read.csv(paste0(system.file("micro19K/", "", package = "CoExp10UKBEC"),
                                 "annot_19K.csv"),stringsAsFactors=F)
  return(probesdata$Gene_Symbol[match(probes,probesdata$XtID)])
}

reannotateCellType = function(){
  tissues = tissues = c("CRBL", "FCTX", "HIPP", "MEDU", "OCTX", "PUTM", "SNIG", "TCTX", 
                        "THAL", "WHMT")
  for(tissue in tissues){
    net = getNetworkFromTissue(which.one="10UKBEC",tissue=tissue)
    names(net$moduleColors) = fromIlluminaProbe2GeneSymbol(names(net$moduleColors))
    write.csv(genAnnotationCellType(net.in=net,return.processed=F),paste0("~/Dropbox/KCL/workspace/CoExp10UKBEC/inst/micro19K/",
                                                                          basename(getNetworkFromTissue(tissue=tissue,which.one="10UKBEC",only.file = T)),
                                                                          ".celltype.csv"))
  }
}
