k.CENTURY <-
function(kmax, Tyr, Ws, Cs, Qs){
    Ts=exp((0.2/2.63)*(1-((45-Tyr)/(45-35))^2.63))*(45-Tyr)/(45-35)^0.2
    k1=kmax*Ts*Ws*Cs
    k2=kmax*Ts*Ws*Qs
    k3=kmax*Ts*Ws
    return(list(k1=k1, k2=k2, k3=k3))
}

