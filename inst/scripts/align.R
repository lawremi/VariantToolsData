library(gmapR)
param <- GsnapParam(TP53Genome(), unique_only = TRUE, molecule = "DNA",
                    batch = "4")
extdata.dir <- system.file("extdata", package="VariantToolsTutorial")
extdata.dir <- "../extdata"
first.fastq <- dir(extdata.dir, "first.fastq", full.names=TRUE)
last.fastq <- dir(extdata.dir, "last.fastq", full.names=TRUE)
output <- mapply(gsnap, first.fastq, last.fastq, MoreArgs=list(param))
