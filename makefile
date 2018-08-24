
######################################################################################################
# Compile App into object file
#
# Args:
#	arm-none-eabi-gcc 	- ARM Cross Compiler
#	-c					- compile and assemble, but do not link
#	-mcpu=cortex-m4		- specifies ARM Cortex M4 as the target microcontroller architecture
#	-mthumb				- use Thumb instruction set (required for Cortex M4)
#	entry.c				- input C file to be compiled
#	-o					- manually specify the name of the Object file output by compiler
#	entry.o				- name of output Object file
#
######################################################################################################
app_object_file:
	echo "*** Creating App object file ***"
	arm-none-eabi-gcc -c -mcpu=cortex-m4 -mthumb entry.c -o entry.o

######################################################################################################
# Assemble the assembly file
#
# Args:
#	arm-none-eabi-as 	- ARM Assembler
#	-mcpu=cortex-m4		- specifies ARM Cortex M4 as the target microcontroller architecture
#	startup_assembly.s	- Assembly file to be assembled
#	-o					- manually specify the name of the Object file output by assembler
#	startup_assembly.o	- name of output Object file
#
######################################################################################################
startup_object_file:
	@echo "*** Creating Startup object file  ***"
	arm-none-eabi-as -mcpu=cortex-m4 startup_assembly.s -o startup_assembly.o

######################################################################################################
# Link all 
#
# Args:
#	arm-none-eabi-ld 	- ARM Linker
#	-T [FILE]			- Read file (in this case, linker_file.ld)
#	linker_file.ld		- name of the linker file to use
#	entry.o				- name of a file (one of many) to link
#	startup_assembly.o	- name of a file (one of many) to link
#	-o					- manually specify the name of the output file
#	boot.elf			- name of the output .elf file
#
######################################################################################################
link_all_files:
	@echo "*** Linking all files ***"
	arm-none-eabi-ld -T linker_file.ld entry.o startup_assembly.o -o boot.elf


#########################################################
#		Build .elf/binary for target (STM32F334R8)		#
#########################################################
all: app_object_file 		\
	 startup_object_file	\
	 link_all_files			\


#############################################
#		Remove all build artifacts			#
#############################################
clean:
	rm -rf *.o
	rm -rf 	*.out
	rm -rf 	*.elf

























