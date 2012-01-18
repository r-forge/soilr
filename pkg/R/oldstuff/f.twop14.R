f.twop14 <-
function(C10, C20, In, k1, k2, rf){
        if(length(k1)==1) k1=rep(k1,times=length(In))
        if(length(k2)==1) k2=rep(k2,times=length(In))
        C1t=NULL
        C2t=NULL
        Rt=NULL
        F1t=NULL
        F2t=NULL
        Ft=NULL
        R1Ft=NULL
        R2Ft=NULL
        RFt=NULL
        Fatm=(C14Atm[,2]/1000)+1
        yr=C14Atm[,1]
        
        
        for(i in 2:length(yr)){
           C1t[1]=C10
           C2t[1]=C20
           F1t[1]= k1[1]/(k1[1]+lambda)
           F2t[1]= k2[1]/(k2[1]+lambda)
           
           C1t[i]=C1t[i-1]+(In[i]+k2[i-1]*C2t[i-1]-k1[i-1]*C1t[i-1])                  #Euler
           C2t[i]=C2t[i-1]+((1-rf)*k1[i-1]*C1t[i-1]-k2[i-1]*C2t[i-1])
           Rt[i]=rf*k1[i-1]*C1t[i-1]
           
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
           
           F1t[i]=(F1t[i-1]*C1t[i-1]*(1-k1[i-1]-lambda)+In[i]*Fatm[i]+(F2t[i-1]*C2t[i-1]*k2[i-1]))/C1t[i]
           F2t[i]=(F2t[i-1]*C2t[i-1]*(1-k2[i-1]-lambda)+(F1t[i-1]*C1t[i-1]*k1[i-1]*(1-rf)))/C2t[i]
           Ft[i]=(F1t[i]*C1t[i] + F2t[i]*C2t[i])/(C1t[i]+C2t[i])
           RFt[i]=F1t[i]*Rt[i]
           
           }
        
    return(list(year=yr,Ct=C1t+C2t,Rt=Rt,F1t=F1t, F2t=F2t,
                Ft=Ft, Del14C=(Ft-1)*1000, RFt=RFt, R14C=(RFt-1)*1000,C1t=C1t,C2t=C2t,
                Del14C1=(F1t-1)*1000,Del14C2=(F2t-1)*1000))
}

