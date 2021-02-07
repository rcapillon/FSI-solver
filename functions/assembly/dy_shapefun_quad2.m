function y = dy_shapefun_quad2(vec_coeffs,vec_Xref)

% 2D shape function derivative with respect to y (for 20-node volumic meshes)

% shape function is N(x,y) = a + bx + cy + dxy + ex^2 + fy^2 + gx^2y + hxy^2

vec_OXref = [
             0 ;
             0 ;
             1 ;
             vec_Xref(1) ;
             0 ;
             2*vec_Xref(2) ;
             vec_Xref(1)^2 ;
             2*vec_Xref(2)*vec_Xref(1) ;
             ] ;
         
y = vec_coeffs' * vec_OXref ;