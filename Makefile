CXX=g++
OUTPUT_OPTIONS=-MMD -MP -o  $@

LIBS= -lglfw -lvulkan -lm
 
TARGET = sdlopengl 
 

COMPILE.c = $(CXX) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c 

 

SRC=$(main *.cpp)

OBJ=$(patsubst %.cpp, %.o, $(srcfiles))

DEP=$(SRC:.cpp=.d)

 

#.PHONY: clean

#all: $(TARGET)

sdlopengl: main.o # This line will compile to .o every .cpp which need to be (which have been modified)
	$(CXX) -o vulkantest main.o $(LIBS)

main.o: main.cpp
	$(CXX) -std=c++17 -c main.cpp $(LIBS) 
	./compileshaders.sh
#$(OBJ): $(SRC)
#	$(CXX) $(OUTPUT_OPTIONS) $(LDLIBS) $(SRC)

	
-include $(DEP)


clean:

	rm -f $(OBJ) $(DEP) main.o vulkantest
