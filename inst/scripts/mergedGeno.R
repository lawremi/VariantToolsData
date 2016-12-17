## need to convert the merged genotypes GRanges to a VRanges

ref <- getSeq(TP53Genome(), mergedGenoP53)
vr <- VRanges(seqnames(mergedGenoP53), ranges(mergedGenoP53),
              ref = ref, alt = mergedGenoP53$alt)
mcols(vr) <- mcols(mergedGenoP53)[-1]

geno <- vr
geno$expected.freq <- (geno$freq.ceu.u + geno$freq.yri) / 2L
