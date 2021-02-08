function MatR_Me = compute_Me_8(wg,pg,mat_coeffs,vec_Xe,rho)

% Some constants

Nddl_e = length(vec_Xe) ;
Nn_e = Nddl_e/3 ;

Id3 = eye(3,3) ;

% Initialization of the element mass matrix
       
MatR_Me = zeros(Nddl_e,Nddl_e) ;

% Assembly loop over the Gauss integration points

for nn = 1:size(pg,1)
    
    x = pg(nn,1) ;
    y = pg(nn,2) ;
    z = pg(nn,3) ;
    
    vec_Xref = [x;y;z] ;
    
    MatR_N = zeros(3,3*Nn_e) ;
    
    for ii = 1:Nn_e
        
        vec_coeffs = mat_coeffs(:,ii) ;
        
        MatR_N(:,(3*ii-2):(3*ii)) = shapefun1(vec_coeffs,vec_Xref)*Id3 ;
        
    end
    
    MatR_Dx1 = zeros(3,3*Nn_e) ;
    MatR_Dx2 = zeros(3,3*Nn_e) ;
    MatR_Dx3 = zeros(3,3*Nn_e) ;
    
    for ii = 1:Nn_e
        
        vec_coeffs = mat_coeffs(:,ii) ;
        
        MatR_Dx1(:,(3*ii-2):(3*ii)) = dx_shapefun1(vec_coeffs,vec_Xref)*Id3 ;
        MatR_Dx2(:,(3*ii-2):(3*ii)) = dy_shapefun1(vec_coeffs,vec_Xref)*Id3 ;
        MatR_Dx3(:,(3*ii-2):(3*ii)) = dz_shapefun1(vec_coeffs,vec_Xref)*Id3 ;
        
    end
    
    MatR_D = [ MatR_Dx1 ;
               MatR_Dx2 ;
               MatR_Dx3  ] ;
    
    [~,~,detJ,~] = calc_J(MatR_D,vec_Xe) ;        
    
    MatR_Me = MatR_Me + wg(nn)*rho*(MatR_N'*MatR_N)*detJ ;
    
end