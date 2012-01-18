threep <-
function(C0, In, k1, k2, k3, a1, a2, a3, Tm){
        I1=In*a1
        I2=In*a2
        I3=In*a3
        C10=C0*a1
        C20=C0*a2
        C30=C0*a3
        
        pool1=singlep(C0=C10, In=I1, k=k1, Tm=Tm)
        pool2=singlep(C0=C20, In=I2, k=k2, Tm=Tm)
        pool3=singlep(C0=C30, In=I3, k=k3, Tm=Tm)
        
    return(list(Ct=pool1$Ct+pool2$Ct+pool3$Ct,Rt=pool1$Rt+pool2$Rt+pool3$Rt,C1t=pool1$Ct,C2t=pool2$Ct,C3t=pool3$Ct,R1t=pool1$Rt,R2t=pool2$Rt,R3t=pool3$Rt))
}

