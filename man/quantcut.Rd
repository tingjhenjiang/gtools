% $Id$
%
\name{quantcut}
\alias{quantcut}

\title{ Create a Factor Variable Using the Quantiles of a Continuous Variable}
\description{
  Create a factor variable using the quantiles of a continous variable.
}
\usage{
quantcut(x, q=4, na.rm=TRUE, ...)
}
%- maybe also `usage' for other objects documented here.
\arguments{
  \item{x}{ Continous variable. }
  \item{q}{ Either a integer number of equally spaced quantile groups to
    create, or a vector of quantiles used for creating groups. Defaults to
    \code{q=4} which is equivalent to \code{q=seq(0, 1, by=0.25)}.
    See \code{\link{quantile}} for details. }
  \item{na.rm}{ Boolean indicating whether missing values should be
    removed when computing quantiles.  Defaults to TRUE.}
  \item{\dots}{ Optional arguments passed to \code{\link{cut}}. }
}
\details{

  This function uses \code{\link{quantile}} to obtain the specified
  quantiles of \code{x}, then calls \code{\link{cut}} to create a factor
  variable using the intervals specified by these quantiles.

  It properly handles cases where more than one quantile obtains the
  same value, as in the second example below.  Note that in this case,
  there will be fewer generated factor levels than the specified number
  of quantile intervals.
}
\value{
  Factor variable with one level for each quantile interval.
}

\author{Gregory R. Warnes \email{greg@warnes.net}}

\seealso{ \code{\link{cut}}, \code{\link{quantile}} }

\examples{

  ## create example data
  \testonly{
  set.seed(1234)
  }
  x <- rnorm(1000)

  ## cut into quartiles
  quartiles <- quantcut( x )
  table(quartiles)

  ## cut into deciles
  deciles.1 <- quantcut( x, 10 )
  table(deciles.1)
  # or equivalently
  deciles.2 <- quantcut( x, seq(0,1,by=0.1) )

  \testonly{
    stopifnot(identical(deciles.1, deciles.2))
  }

  ## show handling of 'tied' quantiles.
  x <- round(x)  # discretize to create ties
  stem(x)        # display the ties
  deciles <- quantcut( x, 10 )

  table(deciles) # note that there are only 5 groups (not 10)
                 # due to duplicates

}

\keyword{ manip  }

