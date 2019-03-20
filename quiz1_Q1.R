Pfunction <- function(CV,FV,n,y){
  pn=-y[n]*n
  P2=FV*exp(pn)
  p1=0
  for (j in 1:n) {pj=-y[j/2]*(j/2)
    P1 <- CV*exp(pj)+p1
  }
  P=P1+P2
  return(p)
}
