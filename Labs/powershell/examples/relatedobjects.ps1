param ($classname)
(gwmi -class $classname).getrelated()|
    % {new-object -typename psobject -property @{class=$_.__class;cimclassname=$_.cimclass.cimclassname;creationname=$_.creationclassname}}
