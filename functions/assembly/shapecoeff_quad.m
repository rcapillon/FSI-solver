function mat_coeffs = shapecoeff_quad(nn)

% 2D shape function coefficients on the reference element (4-node or 8-node)

if nn == 4
    
    xref = [ 
            -1  , -1  ;
             1  , -1  ;
             1  ,  1  ;
            -1  ,  1  ;
           ] ;
        
    R =  [ 
          1,xref(1,1),xref(1,2),xref(1,1)*xref(1,2) ;
          1,xref(2,1),xref(2,2),xref(2,1)*xref(2,2) ;
          1,xref(3,1),xref(3,2),xref(3,1)*xref(3,2) ;
          1,xref(4,1),xref(4,2),xref(4,1)*xref(4,2) ;
         ] ;
    
    
    Id4 = eye(4) ;
    
    mat_coeffs = R \ Id4 ;
    
end

if nn == 8
    
    xref = [ 
            -1  , -1  ;
             1  , -1  ;
             1  ,  1  ;
            -1  ,  1  ;
             0  , -1  ;
             1  ,  0  ;
             0  ,  1  ;
            -1  ,  0  ;
            ] ;
    
    
    R = [ 
         1,xref(1,1),xref(1,2),xref(1,1)*xref(1,2),xref(1,1)^2,xref(1,2)^2,xref(1,2)*xref(1,1)^2,xref(1,1)*xref(1,2)^2 ;
         1,xref(2,1),xref(2,2),xref(2,1)*xref(2,2),xref(2,1)^2,xref(2,2)^2,xref(2,2)*xref(2,1)^2,xref(2,1)*xref(2,2)^2 ;
         1,xref(3,1),xref(3,2),xref(3,1)*xref(3,2),xref(3,1)^2,xref(3,2)^2,xref(3,2)*xref(3,1)^2,xref(3,1)*xref(3,2)^2 ;
         1,xref(4,1),xref(4,2),xref(4,1)*xref(4,2),xref(4,1)^2,xref(4,2)^2,xref(4,2)*xref(4,1)^2,xref(4,1)*xref(4,2)^2 ;
         1,xref(5,1),xref(5,2),xref(5,1)*xref(5,2),xref(5,1)^2,xref(5,2)^2,xref(5,2)*xref(5,1)^2,xref(5,1)*xref(5,2)^2 ;
         1,xref(6,1),xref(6,2),xref(6,1)*xref(6,2),xref(6,1)^2,xref(6,2)^2,xref(6,2)*xref(6,1)^2,xref(6,1)*xref(6,2)^2 ;
         1,xref(7,1),xref(7,2),xref(7,1)*xref(7,2),xref(7,1)^2,xref(7,2)^2,xref(7,2)*xref(7,1)^2,xref(7,1)*xref(7,2)^2 ;
         1,xref(8,1),xref(8,2),xref(8,1)*xref(8,2),xref(8,1)^2,xref(8,2)^2,xref(8,2)*xref(8,1)^2,xref(8,1)*xref(8,2)^2 ;
        ] ;
    
    
    Id8 = eye(8) ;
    
    mat_coeffs = R \ Id8 ;
    
end