CXX=g++
CFLAGS=-Wall -Werror -O2
CD=calculate_distance
EC=extract_coor

SRC_DIR=./src
BIN_DIR=./bin

all: $(BIN_DIR)/$(CD) $(BIN_DIR)/$(EC)

$(BIN_DIR)/$(CD): $(SRC_DIR)/$(CD).cpp
	$(CXX) $(CFLAGS) $^ -o $@
$(BIN_DIR)/$(EC): $(SRC_DIR)/$(EC).cpp
	$(CXX) $(CFLAGS) $^ -o $@
clean:
	rm -f $(BIN_DIR)/$(CD) $(BIN_DIR)/$(EC)
