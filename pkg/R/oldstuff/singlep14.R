singlep14 <-
function(C0, In, k){
        if(length(k)==1) k=rep(k,times=length(In))
        Ct=NULL
        Rt=NULL
        Ft=NULL
        RFt=NULL
        Fatm=(C14Atm[,2]/1000)+1
        yr=C14Atm[,1]
        
        for(i in 2:length(yr)){
                Ct[1]=C0
                                
                L1=In[i-1]-k[i-1]*Ct[i-1]                                           #Runge-Kutta method for carbon
                L2=(In[i-1]+(In[i]-In[i-1])/2) - (k[i-1]+(k[i]-k[i-1])/2)*(Ct[i-1]+L1/2)
                L3=(In[i-1]+(In[i]-In[i-1])/2) - (k[i-1]+(k[i]-k[i-1])/2)*(Ct[i-1]+L2/2)
                L4=In[i]-k[i]*(Ct[i-1]+L3)
                Ct[i]=Ct[i-1]+(L1+2*L2+2*L3+L4)/6
                Rt[i]=In[i-1]-(L1+2*L2+2*L3+L4)/6                              #Runge-Kutta method for respiration
                
                #Ct[i]=In[i]+Ct[i-1]*(1-k)                                       #Euler method for carbon
                #Rt[i]=Ct[i]*k                                                   #Euler method for respiration
            
                Ft[1]= k[1]/(k[1]+lambda)
                #LF1=((In[i-1]*Fatm[i-1])+((1-k-lambda)*Ft[i-1]*Ct[i-1]))/Ct[i-1]        #Runge-Kutta method for F. Warning: Do not activate, not working correctly!
                #LF2=((In[i-1]+(In[i]-In[i-1])/2)*(Fatm[i-1]+(Fatm[i]-Fatm[i-1])/2)+((1-k-lambda)*(Ft[i-1]+(LF1/2))*Ct[i-1]))/Ct[i-1]
                #LF3=((In[i-1]+(In[i]-In[i-1])/2)*(Fatm[i-1]+(Fatm[i]-Fatm[i-1])/2)+((1-k-lambda)*(Ft[i-1]+(LF2/2))*Ct[i-1]))/Ct[i-1]
                #LF4=((In[i]*Fatm[i])+((1-k-lambda)*(Ft[i-1]+LF3)*Ct[i]))/Ct[i]
                #Ft[i]= Ft[i-1] + (LF1+2*LF2+2*LF3+LF4)/6
                
                Ft[i]=(Ft[i-1]*Ct[i-1]*(1-k[i-1]-lambda)+In[i]*Fatm[i])/Ct[i]       #Euler method for F
            
                RFt[i]=Ft[i]
        }
    return(list(year=yr, Ct=Ct, Rt=Rt, Ft=Ft, RFt=RFt, Del14C=(Ft-1)*1000, R14C=(RFt-1)*1000))
}

