setGeneric(
    name="Delta14C",
    def=function( # convert its argument to a Delta14C representation
    ### Thfunction returns an object of the same type as its imput
    ### this can be a number a matrix or an object of class FcAtm
    FcAtm ##<< an object that contains data and a formatdescription.  So it can be converted into the AbsoluteFractionModern format if a conversion is implemented.
    ){
        standardGeneric("Delta14C")
    }
)
setGeneric(
    name="Delta14C_from_AbsoluteFractionModern",
    def=function( # convert its argument from an Absolute Fraction Modern to a Delta14C representation
    ### Thfunction returns an object of the same type as its imput
    ### this can be a number a matrix 
    AbsoluteFractionModern){
        standardGeneric("Delta14C_from_AbsoluteFractionModern")
    }
)
setGeneric(
    name="AbsoluteFractionModern",
    def=function( # convert its argument to an Absolute Fraction Modern representation
    ### The function returns an object of the same type as its imput
    ### this can be a number a matrix or an object of class FcAtm
    FcAtm ##<< an object that contains data and a formatdescription.  So it can be converted into the AbsoluteFractionModern format if a conversion is implemented.
    ){
        standardGeneric("AbsoluteFractionModern")
    }
)
setGeneric(
    name="AbsoluteFractionModern_from_Delta14C",
    def=function( # convert its argument to an Absolute Fraction Modern representation
    ### The function returns an object of the same type as its imput
    ### this can be a number a matrix 
    delta14C){
        standardGeneric("AbsoluteFractionModern_from_Delta14C")
    }
)
setGeneric(
    name="getFormat",
    def=function( # extract the format from an object that contains one
    ### The function returns a format string that describes the format the data is given in
    ### The more detailed information is to be found in the methods		 
    object ##<< usually an object of a subclass of TimeMap
    ){
        standardGeneric("getFormat")
    }
)
setMethod(
   f= "AbsoluteFractionModern_from_Delta14C",
      signature("numeric"),
      definition=function(# convert from Delta14C to Absolute Fraction Normal values  
	delta14C ##<< numeric containing the values in Delta14C format
	){
	### convert a number matrix of vector containing Delta14C values to the appropriate Absolute Fraction Modern values .
	fprime=(delta14C/1000)+1
	return(fprime)
	}
)
setMethod(
   f= "Delta14C_from_AbsoluteFractionModern",
      signature("numeric"),
      definition=function(# convert Absolute Fraction Normal values to Delta14C values 
	AbsoluteFractionModern ##<< numeric containing the values in Absolute Fraction Modern format
	){
	### convert a number matrix of vector containing Absolute Fraction Modern values to the appropriate Delta14C  .
	D14C=(AbsoluteFractionModern-1)*1000
	return(D14C)
	}
)
setMethod(
   f= "AbsoluteFractionModern_from_Delta14C",
      signature("matrix"),
      definition=function(# convert from Delta14C to Absolute Fraction Normal values  
	delta14C ##<< numeric containing the values in Delta14C format
	){
	### convert a number matrix of vector containing Delta14C values to the appropriate Absolute Fraction Modern values .
	fprime=matrix(
	    nrow=nrow(delta14C),
	    ncol=ncol(delta14C),
	    sapply(delta14C,AbsoluteFractionModern_from_Delta14C)
	)
	return(fprime)
	}
)
setMethod(
   f= "Delta14C_from_AbsoluteFractionModern",
      signature("matrix"),
      definition=function(# convert Absolute Fraction Normal values to Delta14C values 
	AbsoluteFractionModern ##<< numeric containing the values in Absolute Fraction Modern format
	){
	### convert a number matrix of vector containing Absolute Fraction Modern values to the appropriate Delta14C  .
	D14C=matrix(
	    nrow=nrow(AbsoluteFractionModern),
	    ncol=ncol(AbsoluteFractionModern),
	    sapply(AbsoluteFractionModern,Delta14C_from_AbsoluteFractionModern)
	)
	return(D14C)
	}
)
