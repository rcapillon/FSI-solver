function y = dx_shapefun_quad1(vec_coeffs,vec_Xref)

% 2D shape function derivative with respect to x (for 8-node volumic meshes)

% shape function is N(x,y) = a + bx + cy + dxy

vec_OXref = [
             0 ;
             1 ;
             0 ;
             vec_Xref(2) ;
             ] ;
         
y = vec_coeffs' * vec_OXref ;