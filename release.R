#!/usr/bin/Rscript
# vim:set ff=unix expandtab ts=2 sw=2:
#hgl=system("hg status --all . |grep -v \"^I.*\\|^?.*\\|^D\\|\\.svn\" | awk '{print $2}'",intern=TRUE)

########################main############################################
# find the files that are no longer part of the hg repository and remove them from the svn part
#old=setwd("../RPackages/SoilR/pkg/")
#rmlist=system("hg st |awk '/^\\!/{print $2}'",intern=TRUE)
#del_svn(rmlist)

# find the files that svn cannot find any longer (because they were removed by hg before)
old=setwd("pkg/")
rmlist=system("svn st |awk '/^\\!/{print $2}'",intern=TRUE)
del_svn(rmlist)
setwd(old)

old=setwd("pkg")
# add those files that are in the hg repo but not yet in svn
hgl=system("hg status --all . |grep -v \"^I.*\\|^?.*\\|^D\\|\\.svn\" | awk '{print $2}'",intern=TRUE)
addSvn(".",hgl)
setwd(old)


#remove files we dont want to export from the svn repo
source("helperFunctions.R")
unnecessaryTrunks<- setdiff(existentRdTrunks(),union(dataRdTrunks(),exportedRdTrunks()))
print(exportedRdTrunks())
filenames <- lapply(unnecessaryTrunks,rdStr)

old=setwd("pkg/man")
del_svn(filenames)
setwd(old)


