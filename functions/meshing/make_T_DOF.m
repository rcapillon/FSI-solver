function T_DOF = make_T_DOF(T_E)

T_DOF = zeros(size(T_E,1),3*size(T_E,2)) ;

T_DOF(:,(1:size(T_E,2))*3-2) = 3*T_E-2 ;
T_DOF(:,(1:size(T_E,2))*3-1) = 3*T_E-1 ;
T_DOF(:,(1:size(T_E,2))*3)   = 3*T_E ;