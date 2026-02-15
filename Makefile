#Jumpstarted with Claude.AI

# Define variables
CXX = g++ # Use g++ for C++ projects
SRC = main.cpp
TARGET = mygame
RAYLIB_PATH = external/raylib# Set this to your raylib directory

# Compiler flags:
# -Wall: enable all warnings
# -std=c++17: specify C++ standard
# -I$(RAYLIB_PATH)/src: include raylib header path
CXXFLAGS = -Wall -std=c++17 -I$(RAYLIB_PATH)/include Iexternal/nbnet

# Linker flags:
# -L$(RAYLIB_PATH)/src: link library path
# -lraylib: link the raylib library
# Additional system-specific libraries may be needed (e.g., -lGL -lm -lpthread -ldl on Linux)
LDFLAGS = -L$(RAYLIB_PATH)/lib -lraylib -lopengl32 -lgdi32 -lwinmm -lws2_32

# Platform specific flags (example for Linux/macOS, Windows with MinGW needs different flags)
# You often need to add system libraries for OpenGL, audio, etc.
# Check the official raylib examples makefiles for comprehensive lists
ifeq ($(OS), Linux)
    LDFLAGS += -lGL -lm -lpthread -ldl -lrt -lX11
endif
ifeq ($(OS), Darwin) # macOS
    LDFLAGS += -framework CoreVideo -framework IOKit -framework Cocoa -framework GLUT -framework OpenGL
endif

# Default target
all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $< -o $@ $(LDFLAGS)

# Run the executable
run: $(TARGET)
	./$(TARGET)

# Clean up
clean:
	rm -f $(TARGET)
