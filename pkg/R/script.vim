set nobomb
set fileencoding=utf-8
%s/ü/\\\"u/g
%s/Ü/\\\"U/g

%s/ä/\\\"a/g
%s/Ä/\\\"A/g

%s/ö/\\\"o/g
%s/Ö/\\\"O/g

%s/ß/\\\ss{}/g
wq
