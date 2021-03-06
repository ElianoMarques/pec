\name{predictLifeYearsLost}
\alias{predictLifeYearsLost}
\alias{predictLifeYearsLost.CauseSpecificCox}
\alias{predictLifeYearsLost.FGR}
\alias{predictLifeYearsLost.prodlim}
\alias{predictLifeYearsLost.rfsrc}
\alias{predictLifeYearsLost.riskRegression}
\title{Predicting life years lost (cumulative cumulative incidences) in competing
risk models.}
\usage{
predictLifeYearsLost(object, newdata, times, cause, ...)
}
\arguments{
  \item{object}{A fitted model from which to extract
  predicted event probabilities}

  \item{newdata}{A data frame containing predictor variable
  combinations for which to compute predicted event
  probabilities.}

  \item{times}{A vector of times in the range of the
  response variable, for which the cumulative incidences
  event probabilities are computed.}

  \item{cause}{Identifies the cause of interest among the
  competing events.}

  \item{\dots}{Additional arguments that are passed on to
  the current method.}
}
\value{
A matrix with as many rows as \code{NROW(newdata)} and as
many columns as \code{length(times)}. Each entry should be
a positive value and in rows the values should be
increasing.
}
\description{
Function to extract predicted life years lost from various
modeling approaches. The most prominent one is the
combination of cause-specific Cox regression models which
can be fitted with the function \code{cumincCox} from the
package \code{compRisk}.
}
\details{
The function predictLifeYearsLost is a generic function
that means it invokes specifically designed functions
depending on the 'class' of the first argument.

See \code{\link{predictSurvProb}}.
}
\examples{
library(pec)
library(riskRegression)
library(survival)
library(prodlim)
train <- SimCompRisk(100)
test <- SimCompRisk(10)
fit <- CSC(Hist(time,cause)~X1+X2,data=train,cause=1)
predictLifeYearsLost(fit,newdata=test,times=seq(1:10),cv=FALSE,cause=1)
}
\author{
Thomas A. Gerds \email{tag@biostat.ku.dk}
}
\seealso{
\code{\link{predictSurvProb}},
\code{\link{predictEventProb}}.
}
\keyword{survival}

