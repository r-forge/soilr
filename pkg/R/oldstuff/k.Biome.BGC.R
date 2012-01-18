k.Biome.BGC <-
function(kQ, Tday, Ws){
    Ts=exp(0.08755*(Tday-26))
    kL=kQ*Ts*Ws
    ks=0.00035*Ts*Ws
    return(list(kL=kL, ks=ks))
}

