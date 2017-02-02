#include <iostream>
#include <igl/readOFF.h>
#include <igl/viewer/Viewer.h>
/*** insert any libigl headers here ***/

using namespace std;
using Viewer = igl::viewer::Viewer;

// Vertex array, #V x3
Eigen::MatrixXd V;
// Face array, #F x3
Eigen::MatrixXi F;
// Per-face normal array, #F x3
Eigen::MatrixXd FN;
// Per-vertex normal array, #V x3
Eigen::MatrixXd VN;
// Per-corner normal array, (3#F) x3
Eigen::MatrixXd CN;
// Vectors of indices for adjacency relations
std::vector<std::vector<int> > VF, VFi, VV;
// Integer vector of component IDs per face, #F x1
Eigen::VectorXi cid;
// Per-face color array, #F x3
Eigen::MatrixXd component_colors_per_face;

bool callback_key_down(Viewer& viewer, unsigned char key, int modifiers) {
    if (key == '1') {
        viewer.data.clear();
        viewer.data.set_mesh(V, F);
        // Add your code for computing vertex to face relations here;
        // store in VF,VFi.
    }

    if (key == '2') {
        viewer.data.clear();
        viewer.data.set_mesh(V, F);
        // Add your code for computing vertex to vertex relations here:
        // store in VV.
    }

    if (key == '3') {
        viewer.data.clear();
        viewer.data.set_mesh(V, F);
        FN.setZero(F.rows(),3);
        // Add your code for computing per-face normals here: store in FN.

        // Set the viewer normals.
        viewer.data.set_normals(FN);
    }

    if (key == '4') {
        viewer.data.clear();
        viewer.data.set_mesh(V, F);
        // Add your code for computing per-vertex normals here: store in VN.

        // Set the viewer normals.
    }

    if (key == '5') {
        viewer.data.clear();
        viewer.data.set_mesh(V, F);
        // Add your code for computing per-corner normals here: store in CN.

        //Set the viewer normals
    }

    if (key == '6') {
        viewer.data.clear();
        viewer.data.set_mesh(V, F);
        component_colors_per_face.setZero(F.rows(),3);
        // Add your code for computing per-face connected components here:
        // store the component labels in cid.

        // Compute colors for the faces based on components, storing them in
        // component_colors_per_face.

        // Set the viewer colors
        viewer.data.set_colors(component_colors_per_face);
    }

    if (key == '7') {
        Eigen::MatrixXd Vout=V;
        Eigen::MatrixXi Fout=F;
        // Add your code for sqrt(3) subdivision here.

        // Set up the viewer to display the new mesh
        V = Vout; F = Fout;
        viewer.data.clear();
        viewer.data.set_mesh(V, F);
    }

    return true;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        cout << "Usage ex1_bin mesh.obj" << endl;
        exit(0);
    }

    // Read mesh
    igl::readOFF(argv[1],V,F);

    // Show the mesh
    Viewer viewer;
    viewer.callback_key_down = callback_key_down;
    callback_key_down(viewer, '1', 0);

    viewer.launch();
}
