function y = dz_shapefun1(vec_coeffs,vec_Xref)

% 3D shape function derivative with respect to z (for 8-node volumic meshes)

% shape function is N(x,y) = a + bx + cy + dz + exy + fxz + g + hxy^2

vec_OXref = [
             0 ;
             0 ;
             0 ;
             1 ;
             0 ;
             vec_Xref(1) ;
             vec_Xref(2) ;
             vec_Xref(1)*vec_Xref(2) ;
             ] ;
         
y = vec_coeffs' * vec_OXref ;