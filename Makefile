SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin

C := clang

PROGRAM := neofetch

CFLAGS := -Wall -g

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(C) $(CFLAGS) -c $< -o $@

$(BIN_DIR)/$(PROGRAM): $(OBJ_DIR)/*.o
	@mkdir -p $(BIN_DIR)
	$(C) $(CFLAGS) $(LDFLAGS) $(OBJ_DIR)/*.o -o $@

clean:
	@rm -rf $(OBJ_DIR)
	@rm -rf $(BIN_DIR)

all: $(BIN_DIR)/$(PROGRAM)

.PHONY: clean all
