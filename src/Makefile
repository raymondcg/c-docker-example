# Make file started from: http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
CC=gcc
CFLAGS=-Wall -g -I.
ODIR=obj

LIBS=-lm

# Define all Headers
DEPS=hellomake.h

# Define all object files
_OBJ = hellomake.o hellofunc.o
OBJ = $(patsubst %, $(ODIR)/%,$(_OBJ))

# Rule to complie intermeditaries.
$(ODIR)/%.o: %.c $(DEPS)
	@echo "================="
	@echo "Compiling $<"
	$(CC) -c -o $@ $< $(CFLAGS)
	
# Rule to make the executable
hellomake: $(OBJ)
	@echo "================="
	@echo "Making Executable $<"
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)
	
# Ensures that make doesn't mess with any files named clean
.PHONY: clean

# Cleans up an object files
clean:
	rm -f $(ODIR)/*.o $~ core $(INCDIR)/*~