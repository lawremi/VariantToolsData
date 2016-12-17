\name{sumDepths}
\alias{sumDepths}

\title{Sum Replicate Depths}
\description{
  Finds the unique variants across every element of a list of VRanges,
  with depths computed by summing the depths over the elements. If a
  variant is not found in a sample, the depth is assumed to zero. That
  is a very dangerous assumption.
}
\usage{
sumDepths(x)
}

\arguments{
  \item{x}{
    A VRangesList, typically of replicates
  }
}

\value{
  A VRanges
}

\examples{
data(tallies)
sumDepths(tallies)
}

\author{
  Michael Lawrence
}
