\name{tallies}
\alias{tallies}
\docType{data}
\title{
  Tally VRanges
}
\description{
  Nucleotide tallies computed over the TP53 region (+/- 1Mb) for the
  50/50 NA12878/NA19240 mixture, separately for each replicate. Each
  replicate corresponds to a separate biochemical mixing.
}
\usage{data(tallies)}
\format{
  A VRangesList, each VRanges of which corresponds to one of the three
  biochemical replicates.
}
\source{
  Computed from the alignments of the FASTQ files found in the
  \file{inst/extdata} directory. Repeat regions (see \link{repeats})
  were excluded. For example, for one replicate,
  \preformatted{
      library(gmapR)
      extdata.dir <- system.file("extdata",
                                 package="VariantToolsData")
      bams <- BamFileList(tools::list_files_with_exts(extdata.dir, "bam"))
      data(repeats, package = "VariantToolsData")
      param <- TallyVariantsParam(TP53Genome(), mask = repeats,
                                  read_pos=TRUE, read_length=75L)
      tallies <- split(tallyVariants(bams, param), ~ sampleNames)
  }

  This assumes that the BAM files have been generated for the current
  version of the TP53 genome:
  \preformatted{
      param <- GsnapParam(TP53Genome(), unique_only = TRUE,
                          molecule = "DNA")
      first.fastq <- dir(extdata.dir, "first.fastq",
                         full.names=TRUE)
      last.fastq <- dir(extdata.dir, "last.fastq",
                        full.names=TRUE)
      output <- gsnap(first.fastq, last.fastq, param)
      bams <- as(output, "BamFileList")
  }
}
\references{
  Lawrence, M., Huntley, M. A., Stawiski, E., Owen, A., Wu, T. D.,
  Goldstein, L. D., Cao, Y., Degenhardt, J., Young, J., Guillory, J.,
  Heldens, S., Jackson, M., Seshagiri S., and Gentleman, R. (2015).
  Genomic variant calling: Flexible tools and a diagnostic data set.
  bioRxiv.
}
\examples{
data(tallies)
VariantTools::callVariants(tallies[[1L]])
}
\keyword{datasets}
