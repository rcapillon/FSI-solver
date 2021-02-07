function MatR_Ke = compute_Ke_20(wg,pg,mat_coeffs,vec_Xe,MatR_matprop)

% Some constants

Nddl_e = length(vec_Xe) ;
Nn_e = Nddl_e/3 ;

Id3 = eye(3,3) ;

% Some constant matrices used in the computation

b = sqrt(2)/2 ;

MatR_G = [ 1 0 0 0 0 0 0 0 0 ;
           0 0 0 0 1 0 0 0 0 ;
           0 0 0 0 0 0 0 0 1 ;
           0 0 0 0 0 b 0 b 0 ;
           0 0 b 0 0 0 b 0 0 ;
           0 b 0 b 0 0 0 0 0  ] ;

MatR_P = [ 1 0 0 0 0 0 0 0 0 ;
           0 0 0 1 0 0 0 0 0 ;
           0 0 0 0 0 0 1 0 0 ;
           0 1 0 0 0 0 0 0 0 ;
           0 0 0 0 1 0 0 0 0 ;
           0 0 0 0 0 0 0 1 0 ;
           0 0 1 0 0 0 0 0 0 ;
           0 0 0 0 0 1 0 0 0 ;
           0 0 0 0 0 0 0 0 1  ] ;
       
% Initialization of the element stiffness matrix

MatR_Ke = zeros(Nddl_e,Nddl_e) ;

% Assembly loop over the Gauss integration points

for nn = 1:size(pg,1)
    
    x = pg(nn,1) ;
    y = pg(nn,2) ;
    z = pg(nn,3) ;
    
    vec_Xref = [x;y;z] ;
    
    MatR_Dx1 = zeros(3,3*Nn_e) ;
    MatR_Dx2 = zeros(3,3*Nn_e) ;
    MatR_Dx3 = zeros(3,3*Nn_e) ;
    
    for ii = 1:Nn_e
        
        vec_coeffs = mat_coeffs(:,ii) ;
        
        MatR_Dx1(:,(3*ii-2):(3*ii)) = dx_shapefun2(vec_coeffs,vec_Xref)*Id3 ;
        MatR_Dx2(:,(3*ii-2):(3*ii)) = dy_shapefun2(vec_coeffs,vec_Xref)*Id3 ;
        MatR_Dx3(:,(3*ii-2):(3*ii)) = dz_shapefun2(vec_coeffs,vec_Xref)*Id3 ;
        
    end
    
    MatR_D = [ MatR_Dx1 ;
               MatR_Dx2 ;
               MatR_Dx3  ] ;
    
    [~,~,detJ,MatR_JJJ] = calc_J(MatR_D,vec_Xe) ;
    
    MatR_Grad = MatR_JJJ * MatR_P * MatR_D ;
        
    MatR_B   = MatR_G * MatR_Grad ;
    
    MatR_Ke = MatR_Ke + wg(nn)*MatR_B'*MatR_matprop*MatR_B*detJ ;
    
end