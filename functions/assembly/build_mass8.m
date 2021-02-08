function MatR_M = build_mass8(wg,pg,rho,T_X,T_E,T_DOF)

% Shape functions are : A + B x + C y + D z + E xy + F xz + G yz + H xyz

% Some constants

Ne   = size(T_E,1)        ;
Nddl_e = 3*size(T_E,2) ;

% Some tables to speed up assembly in the loop over elements

ind_i = 1:Nddl_e ;
ind_i = ind_i' ;

ind_I = repmat(ind_i,1,Nddl_e) ;

ind_j = 1:Nddl_e ; 

ind_J = repmat(ind_j,Nddl_e,1) ;

% Shape functions coefficients

mat_coeffs = shapecoeff(8) ;

% Initialization of the vectors used to stock the sparse matrix

V1 = zeros(Ne*24*24,1) ;
V2 = zeros(Ne*24*24,1) ;
V3 = zeros(Ne*24*24,1) ;

% Assembly loop over all elements

for ee = 1:Ne
    
    nX = T_E(ee,:)' ;
    
    vec_Xe_tmp = T_X(nX,:)' ;
    vec_Xe = vec_Xe_tmp(:) ;
            
    MatR_Me = compute_Me_8(wg,pg,mat_coeffs,vec_Xe,rho) ;
        
    V1((ee*Nddl_e*Nddl_e-(Nddl_e*Nddl_e-1)):(ee*Nddl_e*Nddl_e)) = T_DOF(ee,ind_I(:)) ;
    V2((ee*Nddl_e*Nddl_e-(Nddl_e*Nddl_e-1)):(ee*Nddl_e*Nddl_e)) = T_DOF(ee,ind_J(:)) ;
    V3((ee*Nddl_e*Nddl_e-(Nddl_e*Nddl_e-1)):(ee*Nddl_e*Nddl_e)) = MatR_Me(:) ;
        
end

MatR_M = sparse(V1,V2,V3) ;

% Symmetry of MatR_M is enforced

MatR_M = 0.5*(MatR_M + MatR_M') ;