#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <complex>

class coor
{
    public:
        coor(float x_in, float y_in, float z_in)
        {
            x = x_in;
            y = y_in;
            z = z_in;
        }

        float x, y, z;
};

double get_distance(std::vector<coor>& couple)
{
    float x1, y1, z1, x2, y2, z2;
    float dist_sq;

    x1 = couple[0].x;
    x2 = couple[1].x;
    y1 = couple[0].y;
    y2 = couple[1].y;
    z1 = couple[0].z;
    z2 = couple[1].z;
    
    dist_sq = pow(x2 - x1, 2) + pow(y2 - y1, 2) + pow(z2 - z1, 2);

    return sqrt(dist_sq);
}

int main(int argc, char* argv[])
{
    if (argc < 4) {
        std::cout << "Usage: ./calculate_distance input output start_frame" << std::endl;

        return -1;
    }

    std::ifstream coor_file;
    std::ofstream distance_file;
    std::string line, resname, ID, group1, group2;
    std::vector<coor> coor_couple;
    std::stringstream char_to_num(argv[3]);
    float x, y, z;
    double distance;
    int frame_number;
    /* read frame number from command line */
    char_to_num >> frame_number;

    std::cout << "Please enter point 1: ";
    std::cin >> group1;
    std::cout << "Please enter point 2: ";
    std::cin >> group2;

    coor_file.open(argv[1]);
    distance_file.open(argv[2]);

    while (std::getline(coor_file, line)) {
        std::stringstream iss(line);
        if (!(iss >> resname >> ID >> x >> y >> z)) {
            distance_file << frame_number++ << " ";
            continue;
        } else {
            if (ID == group1 || ID == group2) {
                coor_couple.push_back(coor(x, y, z));
            }

            if (coor_couple.size() == 2) {
                distance = get_distance(coor_couple);
                distance_file << distance << std::endl;
                coor_couple.clear();
            }
        }
    }

    coor_file.close();
    distance_file.close();
}
