k.Linkages <-
function(AET, LN, H, N, C){
    kL=-log(1-(0.9804+0.09352*AET+(0.4956-0.001927*AET)*(LN))/100)
    kS=H*(-0.000379*(N/C)/(-0.02984+(N/C)))/N
    return(list(kL=kL, kS=kS, kt=0.2, ksw=0.1, klw=0.03, kdw=0.05))
}

