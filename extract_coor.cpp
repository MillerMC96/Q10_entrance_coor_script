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
    std::ifstream coor_buffer;
    std::string line;
    std::string type, resname, atom_name, chain_name, res_group;

    coor_buffer.open("coorbuffer.txt");

    while (std::getline(coor_buffer, line))
    {
        std::istringstream iss(line);
        if (!(iss >> type >> resname >> atom_name >> chain_name >> res_group))
            continue;
        std::cout << "OK!\n";
    }

    coor_buffer.close();
}
