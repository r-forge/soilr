from C14example import *
class C14exampleFromDelta14C(C14example):
    def __init__(self,name,matrix,iv,inputrates,c14fraction):
        super(C14example,self).__init__(name,matrix,iv,inputrates)
        self.name=name+"_c14_fromDelta14C"
        self.c14fraction=c14fraction
        self.trunk="runit.automatic.c14_fromDelta14C."+name
        self.addanls14()
####################################################################################
    def addanls14(self):
        fC14= self.c14fraction
	AFM=fC14/1000.0+1.0
	super(C14exampleFromDelta14C,self).addanls14_fromAbsoluteFractionModern(AFM)
	
####################################################################################
    def setUpVars(self):
        pp=super(C14example,self)
        Text=pp.setUpVars()
        Text+="\
   Fc=new(\"FcAtm\",t_start,t_end,function(t){"+str(self.c14fraction)+"},format=\"Delta14C\")\n\
   th=5730\n\
   k=log(0.5)/th\n"
        return(Text)
