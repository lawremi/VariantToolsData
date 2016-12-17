source("align.R")

library(VariantTools)
param <- TallyVariantsParam(TP53Genome(), mask = repeats)
extdata <- system.file("extdata", package = "VariantToolsTutorial")
bams <- tools::list_files_with_exts(extdata, "bam")
tallies <- lapply(BamFileList(bams), tallyVariants, param)
names(tallies) <- sub("-.*", "", basename(bams))

tallies <- VRangesList(tallies)
## tallies <- stackSamples(vrl)

save(tallies, file="../data/tallies.rda")
