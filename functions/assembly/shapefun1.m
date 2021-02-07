function y = shapefun1(vec_coeffs,vec_Xref)

% shape function is N(x,y,z) = a + bx + cy + dz + exy + fxz + gyz + hxyz

vec_OXref = [
             1 ;
             vec_Xref ;
             vec_Xref(1)*vec_Xref(2) ;
             vec_Xref(1)*vec_Xref(3) ;
             vec_Xref(2)*vec_Xref(3) ;
             vec_Xref(1)*vec_Xref(2)*vec_Xref(3)
            ] ;

y = vec_coeffs' * vec_OXref ;