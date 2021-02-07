function y = dy_shapefun_quad1(vec_coeffs,vec_Xref)

% 2D shape function derivative with respect to y (for 8-node volumic meshes)

% shape function is N(x,y) = a + bx + cy + dxy

vec_OXref = [
             0 ;
             0 ;
             1 ;
             vec_Xref(1) ;
             ] ;
         
y = vec_coeffs' * vec_OXref ;