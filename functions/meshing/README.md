# Meshing of a specific test-case geometry

A vertical solid rectangular plate is immersed in a box of fluid, joined at the base level.
The plate's height can be smaller, equal or larger than the fluid's.

Meshing is done using block elements. 
For pressure DOFs, linear 8-node blocks are used.
For velocity DOFs, quadratic 20-node blocks are used.

Gauss quadrature schemes are available with 8 or 27 quadrature points.

Connectivity tables are available, for both the 8-node and the 20-node meshes, for the solid and fluid domains.
2D connectivity tables (4-node and 8-node rectangular surface elements) are available for each face of the solid and fluid domains,
and for the whole fluid-structure interface.

# Functions

- generate_testcase_fsimesh.m : This function takes 6 arguments defining a box in terms of dimensions along each axis (*Lx*, *Ly*, *Lz*) and number of nodes along each axis (*Nx*, *Ny*, *Nz*). The box contains the whole fluid domain, but also part of, or possibly all of the solid domain. The box's coordinates are centered in the x- and y-directions, while the bottom of the box satisfies z = 0. In order to specify if the solid beam's dimension exceeds the dimensions of the box in the z-direction for example, the next 3 arguments (*Ne_beam_x*, *Ne_beam_y*, *Ne_beam_z*) allow the user to specify how many elements in each direction belong to the solid domain, assuming it is centered in the x- and y-directions with respect to the box, while it starts at z = 0 just like the box. The last argument (*isave*) can be set to 1 in order to save the output in a *.mat*-file. The output is a structure called *fsimesh* containing node coordinates tables, lists of nodes belonging to each outer face of the solid and fluid domains, 3D connectivity tables for the volumic meshes and 2D connectivity tables for the surfacic meshes of all outer faces of each domain, as well as specifically the interface between the fluid and solid domains. Connectivity tables are also given in terms of number of degrees of freedom, assuming 3 DOFs per node (which is used in the assembly of matrices related to the fluid velocity and the solid displacement). All tables are given for both the 8-node and the 20-node mesh.

- make_T_DOF.m : This function is used by the one above, converting connectivity tables written in terms of number of nodes into tables written in terms of number of degrees of freedom, assuming 3 DOFs per node.

# Sample figures

The fluid domain's outer dimensions are 1m in length, 0.5m in width and height.
The solid domain is roughly 0.1m, 0.3m and 0.67m in those directions, respectively.

- 8-node blocks sample mesh: 540 elements for the solid domain, 6120 elements for the fluid domain, 7880 nodes.

![8-node blocks sample mesh][figure1]

- 20-node blocks sample mesh: 540 elements for the solid domain, 6120 elements for the fluid domain, 30234 nodes. Extra nodes per element are represented with extra lines forming subtriangles on each face.

![20-node blocks sample mesh][figure2]

[figure1]: https://github.com/rcapillon/FSI-solver/blob/main/functions/meshing/sample_mesh_8.png "8-node blocks sample mesh"
[figure2]: https://github.com/rcapillon/FSI-solver/blob/main/functions/meshing/sample_mesh_20.png "20-node blocks sample mesh"
