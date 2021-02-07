function [MatR_J,invJ,detJ,MatR_JJJ] = calc_J(MatR_D,vec_Xe)

% Computes an element's Jacobian matrix, its inverse, its determinant and a
% larger matrix used to transport some matrices from the reference element
% to the actual element. MatR_D is closely related to the gradient matrix,
% containing the derivatives of the shape functions, but rows are not
% ordered in the same way. 

MatR_Dx1 = MatR_D(1:3,:) ;
MatR_Dx2 = MatR_D(4:6,:) ;
MatR_Dx3 = MatR_D(7:9,:) ;

MatR_J = [ MatR_Dx1*vec_Xe , MatR_Dx2*vec_Xe , MatR_Dx3*vec_Xe ]' ;
invJ   = inv(MatR_J) ;
detJ   = det(MatR_J) ;

if detJ <= eps
    error('Jacobian is negative or zero')
end

MatR_JJJ = [ invJ       zeros(3,3) zeros(3,3) ;
             zeros(3,3) invJ       zeros(3,3) ;
             zeros(3,3) zeros(3,3) invJ        ] ;