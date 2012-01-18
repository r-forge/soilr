k.RothC <-
function(Tmonth, Ws, Ss, kmax){
    Ts=(47.9)/(1+exp(106/(Tmonth+18.3)))
    k=1-exp(-Ts*Ws*Ss*kmax/12)
    return(k)
}

