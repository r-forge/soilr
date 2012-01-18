Q.model<-function(alpha, beta, e1, fc, fn, u0, r0, q, rho0, LFc, LFn, h, T, k1,tmax){


e=(10^(-10))+e1*(q/max(q))^alpha
u=u0*(q/max(q))^beta
k=((1-e)/e)*fc*u
k[1]= k1

tm<-seq(0,tmax,by=h)
Ct<-NULL
Nt<-NULL
rhoC<-NULL
rhor<-NULL
rhonm1=rho0
rnm1=LFn
for(i in 2:length(tm)){
    Ct[1]=sum(rho0)
    Nt[1]=r0*Ct[1]
    Lc1= -k*rhonm1
    Lc2= -k*(rhonm1+(h*Lc1/2))
    Lc3= -k*(rhonm1+(h*Lc2/2))
    Lc4= -k*(rhonm1+(h*Lc3))
    rho= rhonm1+(Lc1+2*Lc2+2*Lc3+Lc4)*h/6
    Ct[i]<-sum(rho)
    
    Ln1= ((-fc*u/e)*rnm1)+fn*u*rho
    Ln2= ((-fc*u/e)*(rnm1+(h*Ln1/2)))+fn*u*rho
    Ln3= ((-fc*u/e)*(rnm1+(h*Ln2/2)))+fn*u*rho
    Ln4= ((-fc*u/e)*(rnm1+(h*Ln3)))+fn*u*rho
    rn= rnm1+(Ln1+2*Ln2+2*Ln3+Ln4)*h/6
    Nt[i]=sum(rn, na.rm=T)

    rhonm1<-(T%*%rho) + LFc
    rnm1=(T%*%rn) + LFn
    }
return(list(Ct=Ct,Nt=Nt,k=k,rhoCf=rhonm1, rhoNf=rnm1, tm=tm))
}
