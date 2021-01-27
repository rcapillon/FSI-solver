function dispmesh_hexa20(T_E,T_X,colorstr,alpha)

Ne = size(T_E,1) ;

Xface_tri = zeros(3,24*Ne) ;
Yface_tri = zeros(3,24*Ne) ;
Zface_tri = zeros(3,24*Ne) ;

Xface_quad = zeros(4,6*Ne) ;
Yface_quad = zeros(4,6*Ne) ;
Zface_quad = zeros(4,6*Ne) ;

for ee = 1:Ne
    
    nodes     = T_E(ee,:)   ;
    
    Xface_quad_elt = [T_X(nodes([9 10 11 12]) ,1) , T_X(nodes([10 15 18 14]),1) , T_X(nodes([15 19 16 11]),1)  , ...
                      T_X(nodes([16 20 13 12]),1) , T_X(nodes([13 9 14 17]) ,1) , T_X(nodes([17 18 19 20]),1)] ;
    Yface_quad_elt = [T_X(nodes([9 10 11 12]) ,2) , T_X(nodes([10 15 18 14]),2) , T_X(nodes([15 19 16 11]),2)  , ...
                      T_X(nodes([16 20 13 12]),2) , T_X(nodes([13 9 14 17]) ,2) , T_X(nodes([17 18 19 20]),2)] ;
    Zface_quad_elt = [T_X(nodes([9 10 11 12]) ,3) , T_X(nodes([10 15 18 14]),3) , T_X(nodes([15 19 16 11]),3)  , ...
                      T_X(nodes([16 20 13 12]),3) , T_X(nodes([13 9 14 17]) ,3) , T_X(nodes([17 18 19 20]),3)] ;
    
    Xface_tri_elt = [T_X(nodes([1 9 12]) ,1) , T_X(nodes([2 9 10]) ,1) , T_X(nodes([3 10 11]),1) , T_X(nodes([4 11 12]),1)  , ...
                      T_X(nodes([2 10 14]),1) , T_X(nodes([3 10 15]),1) , T_X(nodes([7 15 18]),1) , T_X(nodes([6 14 18]),1)  , ...
                      T_X(nodes([3 11 15]),1) , T_X(nodes([4 11 16]),1) , T_X(nodes([8 16 19]),1) , T_X(nodes([7 15 19]),1)  , ...
                      T_X(nodes([8 16 20]),1) , T_X(nodes([5 13 20]),1) , T_X(nodes([1 12 13]),1) , T_X(nodes([4 12 16]),1)  , ...
                      T_X(nodes([1 9 13]) ,1) , T_X(nodes([2 9 14]) ,1) , T_X(nodes([6 14 17]),1) , T_X(nodes([5 13 17]),1)  , ...
                      T_X(nodes([5 17 20]),1) , T_X(nodes([6 17 18]),1) , T_X(nodes([7 18 19]),1) , T_X(nodes([8 19 20]),1)] ;
    Yface_tri_elt = [T_X(nodes([1 9 12]) ,2) , T_X(nodes([2 9 10]) ,2) , T_X(nodes([3 10 11]),2) , T_X(nodes([4 11 12]),2)  , ...
                      T_X(nodes([2 10 14]),2) , T_X(nodes([3 10 15]),2) , T_X(nodes([7 15 18]),2) , T_X(nodes([6 14 18]),2)  , ...
                      T_X(nodes([3 11 15]),2) , T_X(nodes([4 11 16]),2) , T_X(nodes([8 16 19]),2) , T_X(nodes([7 15 19]),2)  , ...
                      T_X(nodes([8 16 20]),2) , T_X(nodes([5 13 20]),2) , T_X(nodes([1 12 13]),2) , T_X(nodes([4 12 16]),2)  , ...
                      T_X(nodes([1 9 13]) ,2) , T_X(nodes([2 9 14]) ,2) , T_X(nodes([6 14 17]),2) , T_X(nodes([5 13 17]),2)  , ...
                      T_X(nodes([5 17 20]),2) , T_X(nodes([6 17 18]),2) , T_X(nodes([7 18 19]),2) , T_X(nodes([8 19 20]),2)] ;
    Zface_tri_elt = [T_X(nodes([1 9 12]) ,3) , T_X(nodes([2 9 10]) ,3) , T_X(nodes([3 10 11]),3) , T_X(nodes([4 11 12]),3)  , ...
                      T_X(nodes([2 10 14]),3) , T_X(nodes([3 10 15]),3) , T_X(nodes([7 15 18]),3) , T_X(nodes([6 14 18]),3)  , ...
                      T_X(nodes([3 11 15]),3) , T_X(nodes([4 11 16]),3) , T_X(nodes([8 16 19]),3) , T_X(nodes([7 15 19]),3)  , ...
                      T_X(nodes([8 16 20]),3) , T_X(nodes([5 13 20]),3) , T_X(nodes([1 12 13]),3) , T_X(nodes([4 12 16]),3)  , ...
                      T_X(nodes([1 9 13]) ,3) , T_X(nodes([2 9 14]) ,3) , T_X(nodes([6 14 17]),3) , T_X(nodes([5 13 17]),3)  , ...
                      T_X(nodes([5 17 20]),3) , T_X(nodes([6 17 18]),3) , T_X(nodes([7 18 19]),3) , T_X(nodes([8 19 20]),3)] ;
    
    Xface_tri(:,(24*ee-23):(24*ee)) = Xface_tri_elt ;
    Yface_tri(:,(24*ee-23):(24*ee)) = Yface_tri_elt ;
    Zface_tri(:,(24*ee-23):(24*ee)) = Zface_tri_elt ;
    
    Xface_quad(:,(6*ee-5):(6*ee)) = Xface_quad_elt ;
    Yface_quad(:,(6*ee-5):(6*ee)) = Yface_quad_elt ;
    Zface_quad(:,(6*ee-5):(6*ee)) = Zface_quad_elt ;
    
end

hold on
patch(Xface_tri,Yface_tri,Zface_tri,colorstr,'FaceAlpha',alpha) ;
patch(Xface_quad,Yface_quad,Zface_quad,colorstr,'FaceAlpha',alpha) ;
hold off

axis equal
view(3)