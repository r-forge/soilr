k.Forest.BGC <-
function(Tday, Ws){
    Ts=(sum(Tday/365))/50
    kL=0.5*(Ts+Ws)/2
    ks=0.03*kL
    return(list(kL=kL, ks=ks))
}

