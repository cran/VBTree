% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vbtvisit.R
\name{vbtsub}
\alias{vbtsub}
\title{Using vector to generate sub tree from vector binary tree}
\usage{
vbtsub(x, inq)
}
\arguments{
\item{x}{The vector binary tree to be visited. Traversal is available by setting -1 in desired layer.}

\item{inq}{An integer vector to determine the visiting location. The length of \code{inq} should be the same
as the layers of visited vector binary tree. If any assignment in specificed layer exceeds its intrinsic
length of visited vector binary tree layer, all elements will be returned in this layer.}
}
\value{
Return a sub tree from visited vector binary tree, according to the argument \code{inq}.
}
\description{
Visit the vector binary tree and generate a sub tree from visited vector binary tree, through
specific assigment determined by the argument \code{inq}.
}
\examples{
#Make vector binary tree:
colnamevbt <- dl2vbt(chrvec2dl(colnames(datatest)))

#Generating sub tree by specific assignment:
vbtsub(colnamevbt, c(2, 3, 1, 1))

#Generating sub tree with traversal in the second layers:
vbtsub(colnamevbt, c(2, -1, 1, 1))

#Generating sub tree with invalid assignments in 1st and 3rd layers:
vbtsub(colnamevbt, c(4, 3, 7, 1))
}
\seealso{
\code{\link[VBTree:vbtinq]{vbtinq}}, \code{\link[VBTree:advbtinq]{advbtinq}}, \code{\link[VBTree:advbtsub]{advbtsub}}.
}
\keyword{Vector.Binary.Tree}
