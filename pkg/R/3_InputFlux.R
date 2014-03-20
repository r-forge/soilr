#
# vim:set ff=unix expandtab ts=2 sw=2:
setClass(
   Class="InputFlux",
   contains="VIRTUAL"
)
setMethod(
  f="InputFlux",
  signature(object="TimeMap"),
  def=function #create a TemporaryInputFlux from a TimeMap object
  ### The method is used to ensure backward compatibility with the now deprecated
  ### TimeMap class.
  ### The resulting TemporaryInputFlux is created by a call to
  ### the constructor TemporaryInputFlux(object) of that class.
  (object)
  {
    TemporaryInputFlux(object)
  }

)
setMethod(
  f="InputFlux",
  signature=signature(object="InputFlux"),
  def=function # pass through constructor
  ### This method handles the case that no actual construction is necessary since
  ### the argument is already of a subclass of InputFlux 
  ##<<details This is useful to simplify argument handling of functions which rely on 
  ##<<details the presence of some kind of an InputFlux 
  ##<<details Due to this method those functions can 
  ##<<details call InputFlux(something) without having to check if 
  ##<<details it is necessary.
  (object){
    object
    ### the unchanged argument
  }
)
