#include <iostream>
#include <sstream>
#include <fstream>
#include <string>

class coor
{
    /* coordinates */
    float x, y ,z;
};

int main(void)
{
    std::ofstream coor_output;
    std::ifstream coor_buffer;
    std::string line;
    std::string type, resname, atom_name, chain_name, res_group;
    float x, y, z;

    coor_buffer.open("coorbuffer.txt");
    coor_output.open("coor_output.txt");

    while (std::getline(coor_buffer, line))
    {
        std::istringstream iss(line);
        if (!(iss >> type >> resname >> atom_name >> chain_name >> res_group >> x >> y >> z))
            continue;
        std::cout << type << " " << resname << " " << atom_name << " " << chain_name << " " << res_group << std::endl;
    }

    coor_buffer.close();
}
