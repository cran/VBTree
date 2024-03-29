% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/advbtvisit.R
\name{advbtinq}
\alias{advbtinq}
\title{Using double list to visit vector binary tree}
\usage{
advbtinq(x, inq)
}
\arguments{
\item{x}{The vector binary tree to be visited. Traversal is acheivable through invalid assignment in desired layer.}

\item{inq}{An integer double list to determine the location to be visited. The length of \code{inq} should be the same
as the layers of visited vector binary tree, while all elements in vector in each layer of \code{inq} should not over
the intrinsic length of visited vector binary tree layer, otherwise all elements will be returned in this layer.}
}
\value{
Return a double list according to the argument \code{inq}.
}
\description{
Advanced visiting for the vector binary tree. Return a double list by specific assigment determined by
the argument \code{inq}.
}
\examples{
#Make vector binary tree:
colnamevbt <- dl2vbt(chrvec2dl(colnames(datatest)))

#Visit by specific assignment:
visit <- list(c(2), c(3:6), c(2,4), 1)
advbtinq(colnamevbt, visit)

#Traversal of the second layers:
visit <- list(c(2), colnamevbt$dims[2]+1, c(2,4), 1)
advbtinq(colnamevbt, visit)

#Invalid assignments in 1st and 3rd layers:
visit <- list(c(3), c(3:6), c(5), 1)
advbtinq(colnamevbt, visit)
}
\seealso{
\code{\link[VBTree:vbtinq]{vbtinq}}, \code{\link[VBTree:vbtsub]{vbtsub}}, \code{\link[VBTree:advbtsub]{advbtsub}}.
}
\keyword{Double.List}
\keyword{Vector.Binary.Tree}
