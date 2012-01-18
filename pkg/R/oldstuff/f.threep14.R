f.threep14 <-
function(C10, C20, C30, In, k1, k2, k3, rf1, rf2, kf){
        if(length(k1)==1) k1=rep(k1,times=length(In))
        if(length(k2)==1) k2=rep(k2,times=length(In))
        if(length(k3)==1) k3=rep(k3,times=length(In))
        C1t=NULL
        R1t=NULL
        C2t=NULL
        R2t=NULL
        C3t=NULL
        F1t=NULL
        F2t=NULL
        F3t=NULL
        Ft=NULL
        R1Ft=NULL
        R2Ft=NULL
        RFt=NULL
        Fatm=(C14Atm[,2]/1000)+1
        yr=C14Atm[,1]
        
        
        for(i in 2:length(yr)){
           C1t[1]=C10
           C2t[1]=C20
           C3t[1]=C30
           F1t[1]= k1[1]/(k1[1]+lambda)
           F2t[1]= k2[1]/(k2[1]+lambda)
           F3t[1]= k3[1]/(k3[1]+lambda)
           
           C1t[i]=C1t[i-1]+(In[i]+k2[i-1]*C2t[i-1]*kf*(1-rf2)-k1[i-1]*C1t[i-1])                  #Euler
           C2t[i]=C2t[i-1]+((1-rf1)*k1[i-1]*C1t[i-1]+k3[i-1]*C3t[i-1]-k2[i-1]*C2t[i-1])
           C3t[i]=C3t[i-1]+((1-rf2)*(1-kf)*k2[i-1]*C2t[i-1]-k3[i-1]*C3t[i-1])
           R1t[i]=rf1*k1[i-1]*C1t[i-1]
           R2t[i]=rf2*k2[i-1]*C2t[i-1]
        
           #L11=In[i-1]-k1*C1t[i-1]                              #Runge-Kutta
           #L21=(1-rf)*k1*C1t[i-1]-k2*C2t[i-1]
           
           #L12=(In[i-1]+(In[i]-In[i-1])/2) - k1*(C1t[i-1]+L11/2)
           #L22=(1-rf)*k1*(C1t[i-1]+L11/2) - k2*(C2t[i-1]+L21/2)
           
           #L13=(In[i-1]+(In[i]-In[i-1])/2) - k1*(C1t[i-1]+L12/2)
           #L23=(1-rf)*k1*(C1t[i-1]+L12/2) - k2*(C2t[i-1]+L22/2)
           
           #L14=In[i]-k1*(C1t[i-1]+L13)
           #L24=(1-rf)*k1*(C1t[i-1]+L13) - k2*(C2t[i-1]+L23)
           
           #C1t[i]=C1t[i-1]+(L11+2*L12+2*L13+L14)/6
           #C2t[i]=C2t[i-1]+(L21+2*L22+2*L23+L24)/6
           #R1t[i]=rf*k1*C1t[i-1]
           #R2t[i]=k2*C2t[i-1]
           #R1t[i]=(In[i]-(L11+2*L12+2*L13+L14)/6)*rf
           #R2t[i]=(1-rf)*R1t[i]-(L21+2*L22+2*L23+L24)/6
           
           F1t[i]=(F1t[i-1]*C1t[i-1]*(1-k1[i-1]-lambda)+In[i]*Fatm[i]+((1-rf2)*kf*F2t[i-1]*C2t[i-1]*k2[i-1]))/C1t[i]
           F2t[i]=(F2t[i-1]*C2t[i-1]*(1-k2[i-1]-lambda)+(F1t[i-1]*C1t[i-1]*k1[i-1]*(1-rf1))+(F3t[i-1]*C3t[i-1]*k3[i-1]))/C2t[i]
           F3t[i]=(F3t[i-1]*C3t[i-1]*(1-k3[i-1]-lambda)+(F2t[i-1]*C2t[i-1]*k2[i-1]*(1-rf2)*(1-kf)))/C3t[i]
           
           R1Ft[i]=F1t[i]*R1t[i]
           R2Ft[i]=F2t[i]*R2t[i]
           Ft[i]=(F1t[i]*C1t[i] + F2t[i]*C2t[i] + F3t[i]*C3t[i])/(C1t[i]+C2t[i]+C3t[i])
           RFt[i]=(R1Ft[i] + R2Ft[i])/(R1t[i]+R2t[i])
           
           }
        
    return(list(year=yr,Ct=C1t+C2t+C3t,Rt=R1t+R2t,F1t=F1t, F2t=F2t, F3t=F3t,
                Ft=Ft, Del14C=(Ft-1)*1000, RFt=RFt, R14C=(RFt-1)*1000,C1t=C1t,C2t=C2t,C3t=C3t,
                R1t=R1t,R2t=R2t,Del14C1=(F1t-1)*1000,Del14C2=(F2t-1)*1000,Del14C3=(F3t-1)*1000,
                R14C1=((R1Ft/R1t)-1)*1000,R14C2=((R2Ft/R2t)-1)*1000))
}

