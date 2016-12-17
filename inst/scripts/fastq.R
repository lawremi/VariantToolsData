meta <- file.path("/gne/research/data/bioinfo/ngs_analysis/WGS/NGS323/merged",
                  sams)
design.5050 <- design$group == "50 YRI x 50 CEU"
bams.5050 <- as.character(design$bam[design.5050])
names(bams.5050) <- rownames(design)[design.5050]

library(org.Hs.eg.db)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
p53 <- gmapR:::getGeneRoi(TxDb.Hsapiens.UCSC.hg19.knownGene, org.Hs.eg.db,
                          "TP53")
seqlevels(p53) <- sub("chr", "", seqlevels(p53))
param <- ScanBamParam(which = p53, what = c("seq", "qual"))
gal <- lapply(bams.5050, readGappedAlignmentPairs, param = param)
first.gal <- lapply(gal, first)
last.gal <- lapply(gal, last)

dumpFastq <- function(ga, sam) {
  ga <- ga[width(mcols(ga)$seq) == 75L]
  rc <- as.vector(strand(ga) == "-")
  seq <- mcols(ga)$seq
  seq[rc] <- reverseComplement(seq[rc])
  qual <- mcols(ga)$qual
  qual[rc] <- reverse(qual[rc])
  writeFastq(ShortReadQ(seq, qual), paste0(sam, ".fastq"))
}
mapply(dumpFastq, first.gal, paste0(names(bams.5050), "-p53-first"))
mapply(dumpFastq, last.gal, paste0(names(bams.5050), "-p53-last"))
