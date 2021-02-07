function y = shapefun_quad2(vec_coeffs,vec_Xref)

% shape function is N(x,y) = a + bx + cy + dxy + ex^2 + fy^2 + gx^2y + hxy^2

vec_OXref = [
             1 ;
             vec_Xref(1) ;
             vec_Xref(2) ;
             vec_Xref(1)*vec_Xref(2) ;
             vec_Xref(1)^2 ;
             vec_Xref(2)^2 ;
             vec_Xref(1)^2*vec_Xref(2) ;
             vec_Xref(2)^2*vec_Xref(1) ;
             ] ;
         
y = vec_coeffs' * vec_OXref ;