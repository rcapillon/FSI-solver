function y = shapefun_quad1(vec_coeffs,vec_Xref)

% shape function is N(x,y) = a + bx + cy + dxy

vec_OXref = [
             1 ;
             vec_Xref(1) ;
             vec_Xref(2) ;
             vec_Xref(1)*vec_Xref(2) ;
             ] ;
         
y = vec_coeffs' * vec_OXref ;