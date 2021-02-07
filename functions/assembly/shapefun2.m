function y = shapefun2(vec_coeffs,vec_Xref)

% shape function is N(x,y,z) = a + bx + cy + dz + exy + fxz + gyz + hxyz + ix^2 + jy^2 + kz^2 + lyx^2 + mzx^2 + nxy^2 + ozy^2 + pxz^2 + qyz^2 + ryzx^2 + sxzy^2 + txyz^2

vec_OXref = [
             1 ;
             vec_Xref ;
             vec_Xref(1)*vec_Xref(2) ;
             vec_Xref(1)*vec_Xref(3) ;
             vec_Xref(2)*vec_Xref(3) ;
             vec_Xref(1)*vec_Xref(2)*vec_Xref(3) ;
             vec_Xref(1)^2 ;
             vec_Xref(2)^2 ;
             vec_Xref(3)^2 ;
             vec_Xref(1)^2*vec_Xref(2) ;
             vec_Xref(1)^2*vec_Xref(3) ;
             vec_Xref(2)^2*vec_Xref(1) ;
             vec_Xref(2)^2*vec_Xref(3) ;
             vec_Xref(3)^2*vec_Xref(1) ;
             vec_Xref(3)^2*vec_Xref(2) ;
             vec_Xref(1)^2*vec_Xref(2)*vec_Xref(3) ;
             vec_Xref(2)^2*vec_Xref(1)*vec_Xref(3) ;
             vec_Xref(3)^2*vec_Xref(1)*vec_Xref(2) ;
             ] ;
         
y = vec_coeffs' * vec_OXref ;