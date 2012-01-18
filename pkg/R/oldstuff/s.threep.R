s.threep <-
function(C10, C20, C30, In, k1, k2, k3, rf1, rf2, Tm){
        if(length(k1)==1) k1=rep(k1,times=length(Tm))
        if(length(k2)==1) k2=rep(k2,times=length(Tm))
        if(length(k3)==1) k3=rep(k3,times=length(Tm))
        C1t=NULL
        R1t=NULL
        C2t=NULL
        R2t=NULL
        C3t=NULL
        R3t=NULL
        
        for(i in 2:length(Tm)){
           C1t[1]=C10
           C2t[1]=C20
           C3t[1]=C30
           
           C1t[i]=C1t[i-1]+(In[i]-k1[i-1]*C1t[i-1])                  #Euler
           C2t[i]=C2t[i-1]+((1-rf1)*k1[i-1]*C1t[i-1]-k2[i-1]*C2t[i-1])
           C3t[i]=C3t[i-1]+((1-rf2)*k2[i-1]*C2t[i-1]-k3[i-1]*C3t[i-1])
           R1t[i]=rf1*k1[i-1]*C1t[i-1]
           R2t[i]=rf2*k2[i-1]*C2t[i-1]
           R3t[i]=k3[i-1]*C3t[i-1]
        
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
         
           }
        
    return(list(C1t=C1t,C2t=C2t,C3t=C3t,Ct=C1t+C2t+C3t,R1t=R1t,R2t=R2t,R3t=R3t,Rt=R1t+R2t+R3t))
}

