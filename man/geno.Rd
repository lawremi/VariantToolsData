\name{geno}
\alias{geno}
\docType{data}
\title{
  Reference genotypes
}
\description{
  Reference genotypes for NA12878 and NA19240, as called by the HapMap
  project, and the Broad GATK project.
}
\usage{data(geno)}
\format{
  A VRanges with the genotypes for NA12878 and NA19240 from the HapMap
  pilot project and the Broad/GATK calling of NA12878. The genotypes,
  stored in the "freq." columns, are represented by the alt frequency,
  so 0/0.5/1 for hom-ref/het/hom-alt. The "expected.freq" column
  indicates the alt frequency expected in the 50/50 mixture.
}
\source{
  The HapMap Pilot and Broad GATK projects.
}
\examples{
data(geno)
table(geno$expected.freq)
}
\keyword{datasets}
