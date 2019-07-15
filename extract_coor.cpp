#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <vector>

class coor
{
    public:
        coor(float x_in, float y_in, float z_in)
        {
            x = x_in;
            y = y_in;
            z = z_in;
        }
        /* coordinates */
        float x, y ,z;
};

class coor get_avg_coor(std::vector<coor>& input)
{
    float x, y, z;

    for (int i = 0; i < 3; i++) {
        x += input[i].x;
        y += input[i].y;
        z += input[i].z;
    }

    x /= 3;
    y /= 3;
    z /= 3;

    return coor(x, y, z);
}

int main(void)
{
    std::ofstream coor_output;
    std::ifstream coor_buffer;
    std::vector<coor> coor_group;
    std::vector<std::string> atoms;
    std::string line;
    std::string type, atom_number, atom_name, resname, chain_name, res_group;
    float x, y, z;

    coor_buffer.open("coorbuffer.txt");
    coor_output.open("coor_output.txt");

    while (std::getline(coor_buffer, line)) {
        std::istringstream iss(line);
        if (!(iss >> type >> atom_number >> atom_name >> resname >> chain_name 
            >> res_group >> x >> y >> z)) {
            continue;
        } else {
            if (resname == "ALA" || resname == "LEU") {
                for (int i = 0; i < 3; i++) {
                    std::getline(coor_buffer, line);
                    std::istringstream iss(line);
                    iss >> type >> atom_number >> atom_name >> resname >> 
                        chain_name >> res_group >> x >> y >> z;
                    coor_group.push_back(coor(x, y, z));
                }
                coor avg_coor = get_avg_coor(coor_group);
                std::cout << avg_coor.x << " " << avg_coor.y << " " << avg_coor.z << std::endl;
            }
        }
    }

    coor_buffer.close();
    coor_output.close();
}
