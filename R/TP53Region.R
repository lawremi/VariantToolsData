TP53Region <- function() {
    ##tp53 <- genes(Homo.sapiens:Homo.sapiens,
    ##              filter=list(gene_id="7157")) + 1e6
    tp53 <- GRanges("chr17:6565097-8590868:-")
    setNames(unstrand(tp53), "TP53")
}
