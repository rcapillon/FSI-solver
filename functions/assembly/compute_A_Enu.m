function MatR_A = compute_A_Enu(E,nu)

% Computes the elasticity matrix of a linear elastic material with Young's
% Modulus E and Poisson's ratio nu.

lambda = E*nu/((1+nu)*(1-2*nu)) ;

mu = E/(2*(1+nu)) ;

MatR_A = zeros(6,6) ;
MatR_A(1:3,1:3) = lambda ;
MatR_A = MatR_A + diag(2*mu*ones(6,1)) ;