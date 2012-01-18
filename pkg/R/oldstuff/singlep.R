singlep <-
function(C0, In, k, Tm){
        if(length(k)==1) k=rep(k,times=length(Tm))
        Ct=NULL
        Rt=NULL
        for(i in 2:length(Tm)){
                Ct[1]=C0
                                
                L1=In[i-1]-k[i-1]*Ct[i-1]
                L2=(In[i-1]+(In[i]-In[i-1])/2) - (k[i-1]+(k[i]-k[i-1])/2)*(Ct[i-1]+L1/2)
                L3=(In[i-1]+(In[i]-In[i-1])/2) - (k[i-1]+(k[i]-k[i-1])/2)*(Ct[i-1]+L2/2)
                L4=In[i]-k[i]*(Ct[i-1]+L3)
                Ct[i]=Ct[i-1]+(L1+2*L2+2*L3+L4)/6
                Rt[i]=In[i-1]-(L1+2*L2+2*L3+L4)/6
                #Rt[i]=k*Ct[i-1]
        }
        return(list(Ct=Ct, Rt=Rt))
}

