
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
    nets = c(nets, paste0("net",tissue,".12.signed.it.20.rds_cor_pca"))
    residuals = c(residuals, paste0(tissue,".mic.expr.data.19K.rds"))
  }
  
  for(tissue in tissues){
    net = nets[which(tissues == tissue)]
    residual = residuals[which(tissues == tissue)]
    CoExpNets::addNet(which.one="CoExp10UKBEC",
                      tissue=tissue,
                      netfile=net,
                      ctfile=paste0(the.dir,"/",net,".USER_terms.csv"),
                      gofile=paste0(the.dir,"/",net,"_gprofiler.csv"),
                      exprdatafile=paste0(the.dir,"/",
                                          residual),
                      overwrite=mandatory)
  }
}
