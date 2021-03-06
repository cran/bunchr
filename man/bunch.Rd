% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bunch.R
\name{bunch}
\alias{bunch}
\title{Bunching Analysis}
\usage{
bunch(earnings, zstar, t1, t2, Tax = 0, cf_start = NA, cf_end = NA,
  exclude_before = NA, exclude_after = NA, force_after = FALSE,
  binw = 10, poly_size = 7, convergence = 0.01, max_iter = 100,
  correct = TRUE, select = TRUE, draw = TRUE, nboots = 0, seed = NA,
  progress = FALSE, title = "Bunching Visualization",
  varname = "Earnings")
}
\arguments{
\item{earnings}{Vector of earnings, hopefully a very large one.}

\item{zstar}{Place of kink (critical earning point).}

\item{t1}{Marginal tax rate before kink.}

\item{t2}{Marginal tax rate after kink.}

\item{Tax}{"Penalty" tax for crossing zstar.}

\item{cf_start}{Number of bins before the kink bin where counter-factual
histogram should start.}

\item{cf_end}{Number of bins after the kink bin where counter-factual
histogram should start.}

\item{exclude_before}{Number of excluded bins before the kink bin.}

\item{exclude_after}{Number of excluded bins after the kink bin.}

\item{force_after}{For notch analysis, should \code{bunch} be forced to use
of the provided \emph{exclude_after} for the end of the bunching, rather than
trying to find the bin where the sum of the integral is zero? See details at
\code{\link{notch_estimator}} documentation.}

\item{binw}{Bin width.}

\item{poly_size}{Order of polynomial used to calculate counter-factual
histogram.}

\item{convergence}{Minimal rate of change of bunching estimate to stop
iterations.}

\item{max_iter}{Maximum number of iterations for bunching estimates.}

\item{correct}{Should the counter-factual histogram be corrected to compensate
for shifting left because of the notch? See details.}

\item{select}{Should model selection be used to find counter-factual
histogram? See details.}

\item{draw}{Should a graph be drawn?}

\item{nboots}{how many bootstraps should be run?}

\item{seed}{specify seed for bootstraps (earnings sampling).}

\item{progress}{Should a progress bar be desplayed?}

\item{title}{Title for Plot output}

\item{varname}{Name for running variable, to be desplayed in the plot}
}
\value{
\code{bunch} returns a list comprising of the parameters returned by
\code{kink_estimator} and \code{notch_estimator}. If bootstraps were asked for,
bootstrapped values are added to the list. Drawing of histograms is
suppressed when running the bootsraps.
}
\description{
Given a kinked or notched budget set, this function gets a vector of earnings
and analyzes bunching. The bunchr package has two main useful functions:
}
\details{
\code{bunch} checks if the specification has a kink, i.e. if the Tax
parameter is greater than zero. If so, it applies \code{notch_estimator}.
Otherwise, it applies \code{kink_estimator}.  Additionally, \code{bunch}
can bootstrap by sampling the earnings vector, returning a vector with
the estimated elasticities.
}
\examples{
# analyzing a kink
ability_vec <- 4000 * rbeta(100000, 2, 5)
earning_vec <- sapply(ability_vec, earning_fun, 0.2, 0, 0.2, 0, 1000)
# bunch_viewer(earning_vec, 1000, 20, 20, 1, 1, binw = 20)
estim <- bunch(earning_vec, 1000, 0, 0.2, Tax = 0, 20, 20, 1, 1,
binw = 20, draw=TRUE, nboots = 0, seed = 16)
estim$e

# analyzing a notch
earning_vec <- sapply(ability_vec, earning_fun, 0.2, 0.2, 0.2, 500, 1000)
bunch_viewer(earning_vec, 1000, 10, 40, 2, 22, binw = 50)
estim <- bunch(earning_vec, 1000, 0.2, 0.2, Tax = 500, 10, 40, 2, 22,
binw = 50, draw = FALSE, nboots = 0, seed = 16)
estim$e

}
\seealso{
\code{\link{kink_estimator}}, \code{\link{notch_estimator}}
}

