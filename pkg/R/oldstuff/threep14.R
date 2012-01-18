threep14 <-
function(C0, I1, I2, I3, k1, k2, k3, a1, a2, a3){
        C10=C0*a1
        C20=C0*a2
        C30=C0*a3
        
        pool1=singlep14(C0=C10, In=I1, k=k1)
        pool2=singlep14(C0=C20, In=I2, k=k2)
        pool3=singlep14(C0=C30, In=I3, k=k3)
        Ft=(pool1$Ft*pool1$Ct + pool2$Ft*pool2$Ct + pool3$Ft*pool3$Ct)/(pool1$Ct+pool2$Ct+pool3$Ct)
        RFt=(pool1$RFt + pool2$RFt + pool3$RFt)/(pool1$Rt+pool2$Rt+pool3$Rt)
        
    return(list(year=pool1$year,Ct=pool1$Ct+pool2$Ct+pool3$Ct,Rt=pool1$Rt+pool2$Rt+pool3$Rt,F1t=pool1$Ft, F2t=pool2$Ft, F3t=pool3$Ft,
                Ft=Ft, Del14C=(Ft-1)*1000, RFt=RFt, R14C=(RFt-1)*1000,C1t=pool1$Ct,C2t=pool2$Ct,C3t=pool3$Ct,
                R1t=pool1$Rt,R2t=pool2$Rt,R3t=pool3$Rt,Del14C1=(pool1$Ft-1)*1000,Del14C2=(pool2$Ft-1)*1000,Del14C3=(pool3$Ft-1)*1000,
                R14C1=((pool1$RFt/pool1$Rt)-1)*1000,R14C2=((pool2$RFt/pool2$Rt)-1)*1000,R14C3=((pool3$RFt/pool3$Rt)-1)*1000))
}

