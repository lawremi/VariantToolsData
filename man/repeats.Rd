\name{repeats}
\alias{repeats}
\docType{data}
\title{Simple repeats}
\description{
  Repeat regions from the RepeatMasker track of the hg19 UCSC genome
  browser database, subset to low complexity and simple repeats.
}
\usage{data(repeats)}
\format{
  A GRanges object with the repeat ranges, including variables
  classifying the repeats by name, class, and family, and information
  about the alignment of the repeat consensus to the genome.
}
\source{
  The "rmsk" table in the UCSC table browser (hg19). Click the
  "Describe Schema" button for details.
}
\examples{
data(repeats)
tab <- table(repeats$repFamily)
tab[tab > 0]
}
\keyword{datasets}
