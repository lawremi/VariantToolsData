library(org.Hs.eg.db)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
p53 <- gmapR:::getGeneRoi(TxDb.Hsapiens.UCSC.hg19.knownGene, org.Hs.eg.db,
                          "TP53")
seqlevels(p53) <- sub("chr", "", seqlevels(p53))
library(VariantAnnotation)
param <- ScanVcfParam(which = p53, fixed = "ALT", info = NA, geno = NA)
vcf <- readVcf("~/share/tracks/00-All.vcf.gz", param, genome = "hg19")
rowData(vcf) <- gmapR:::translateToP53Genome(rowData(vcf))
fixed(vcf)$QUAL <- NA_integer_
fixed(vcf)$FILTER <- NA_character_
## writeVcf is BUSTED
writeVcf(vcf, "../extdata/dbsnp-p53.vcf")
