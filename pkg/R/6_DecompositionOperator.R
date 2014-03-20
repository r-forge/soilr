#
# vim:set ff=unix expandtab ts=2 sw=2:

setClass(# decomposition operator 
    Class="DecompositionOperator",
    ,
    contains="VIRTUAL"
)
setMethod(
  f="DecompositionOperator",
  signature=signature(object="DecompositionOperator"),
  def=function # pass through constructor
  ### This method handles the case that no actual construction is necessary since
  ### the argument is already of a subclass of DecompositionOperator 
  ##<<details This is useful to simplify argument handling of functions which rely on 
  ##<<details the presence of a DecompositionOperator. 
  ##<<details Due to this method those functions can always
  ##<<details call DecompositionOperator(something) without having to check if 
  ##<<details it is necessary.
  (object){
    object
    ### the unchanged argument
  }
)
setMethod(
  "DecompositionOperator",
  signature(object="matrix"),
  #valueClass="ConstantDecompositionOperator",
  def=function # creates a ConstanDecompositionOperator from a matrix
  ### The resulting operator is creted by a call to the constructor of class
  ### ConstantDecompositionOperator
  (object){
    ConstantDecompositionOperator(object)
  }
)
setMethod(
  f="DecompositionOperator",
  signature=signature(object="TimeMap"),
  #valueClass="LinearDecompositionOperator",
  def=function # creates a LinearDecompositionOperator from a TimeMap object
  ### The resulting operator is creted by a call to the constructor of class
  ### LinearDecompositionOperator
  ### The method is used to ensure backward compatibility with the now deprecated
  ### TimeMap class
  (object){
    LinearDecompositionOperator(object)
  }
)
