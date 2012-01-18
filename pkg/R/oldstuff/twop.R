twop <-
function(C0, In, k1, k2, a1, a2, Tm){
        I1=In*a1
        I2=In*a2
        C10=C0*a1
        C20=C0*a2
        
        pool1=singlep(C0=C10, In=I1, k=k1, Tm=Tm)
        pool2=singlep(C0=C20, In=I2, k=k2, Tm=Tm)
        
    return(list(Ct=pool1$Ct+pool2$Ct,Rt=pool1$Rt+pool2$Rt,C1t=pool1$Ct,C2t=pool2$Ct,R1t=pool1$Rt,R2t=pool2$Rt))
}

