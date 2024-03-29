#' Make traversal from vector binary tree
#'
#' @description Generating a table of traversal from given vector binary tree, in order to construct correct
#' mapping relationships within double list, vector binary tree, array and tensor.
#' @param x A vector binary tree.
#'
#' @return Return a traversal table from the given vector binary tree.
#' @export trvs
#'
#' @examples
#' #Make vector binary tree:
#' colnamevbt <- dl2vbt(chrvec2dl(colnames(datatest)))
#'
#' #Construct traversal table:
#' trvs(colnamevbt)
#' @keywords Vector.Binary.Tree Trav.Table
trvs <- function(x){
  # input data diagnose
  if(!inherits(x, "Vector.Binary.Tree")){
    stop("x should be a Vector.Binary.Tree generated by arr2vbt(), ts2vbt() or dl2vbt().", call. = FALSE)
  }

  # execute x1 when x1 (str) exists
  exec <- function(x1=NULL){
    eval(parse(text=x1))
  }

  # save x2 (R object) as str without execute
  encode <- function(x2=NULL){
    deparse(substitute(x2))
  }

  pref <- encode(x$tree)
  suff <- paste("[[",1,"]]", sep = "", collapse = "")
  dims <- length(x$dims)

  i <- 1
  while (i <= dims) {
    if(i==1){
      layer1temp <- ""
    } else {
      assign(paste("layer", i, "temp", sep = ""), paste("[[",rep(2,(i-1)),"]]", sep = "", collapse = ""))
    }
    temp <- paste(pref, exec(paste("layer", i, "temp", sep = "")), suff, sep = "", collapse = "")
    assign(paste("L",i, sep = ""), exec(temp))
    i <- i + 1
  }

  trav <- prod(x$dims)

  i <- 1
  mlt.idx <- c(1:trav)

  while (i <= dims) {
    rpt_inner <- trav/prod(x$dims[1:i])
    rpt_outer <- trav/(rpt_inner*x$dims[i])
    val <- rep(rep(exec(paste("L",i,sep = "")), each=rpt_inner), rpt_outer)
    coo <- rep(rep(c(1:x$dims[i]), each=rpt_inner), rpt_outer)
    temp <- cbind(val, coo)
    mlt.idx <- cbind(mlt.idx, temp)
    i <- i + 1
  }
  mlt.idx <- mlt.idx[,-1]

  # in condition of one element in each layer of the tree
  if(is.matrix(mlt.idx) != TRUE){
    mlt.idx <- matrix(mlt.idx, nrow = 1)
  }

  ChrItem <- "Str"
  Coord <- c(1:dims)
  result <- list("ChrItem"=ChrItem, "Coord"=Coord)

  # in condition of one element in each layer of the tree
  if(length(mlt.idx[,1])==1){
    mlt.str <- mlt.idx[,(c(1:dims)*2-1)]
    mlt.coo <- as.numeric(mlt.idx[,c(c(1:dims)*2)])
    mlt.str <- matrix(mlt.str, nrow = 1)
    mlt.coo <- matrix(mlt.coo, nrow = 1)
  } else{
    mlt.str <- mlt.idx[,(c(1:dims)*2-1)]
    mlt.coo <- apply(mlt.idx[,c(c(1:dims)*2)],2,as.numeric)
  }

  i <- 1
  for (i in 1:trav) {
    str <- paste(mlt.str[i,], sep = "", collapse = "-")
    coo <- mlt.coo[i,]
    assign(paste("item", i, sep = ""), list("ChrItem"=str, "Coord"=coo))
    result <- rbind(result, exec(paste("item", i, sep = "")))
  }
  result <- result[-1,]

  # in condition of one element in each layer of the tree
  if(is.matrix(result)!=TRUE){
    result <- matrix(result, nrow = 1)
  }
  class(result) <- "Trav.Table"
  return(result)
}
