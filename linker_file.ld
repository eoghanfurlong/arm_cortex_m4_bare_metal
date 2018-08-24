/***********************************************************/
/****                   Memory Areas                    ****/
/***********************************************************/
MEMORY
{
    FLASH (rx)      : ORIGIN = 0x08000000,  LENGTH = 64K
    RAM   (rwx)     : ORIGIN = 0x20000000,  LENGTH = 12K
}


/***********************************************************/
/****    Startup code to be executed on first entry     ****/
/***********************************************************/
ENTRY( _Reset )      /* refers to _Reset vector table in assembly file */

/***********************************************************/
/****           Start of stack (top of RAM)             ****/
/***********************************************************/
stack_top = 0x20003000;     /* this is the end of the very last byte of RAM - stack expands downwards */


/***********************************************************/
/****      Sections within the above Memory Areas       ****/
/***********************************************************/
SECTIONS
{
    /*************    Flash    *************/
    /* all of the code and constants (all the things that won't change) */
    .text :
    {
        startup_assembly.o (INTERRUPT_VECTOR)       /* place the interrupt vector table setup at this location */
        . = ALIGN(4);                               /* the section is aligned to a 4 byte boundary */   
    } > FLASH


    /* strings and global variables defined as const */
    .rodata :
    {
        . = ALIGN(4);                               /* the section is aligned to a 4 byte boundary */

    } > FLASH



    /*************    RAM    *************/
    /* initialised global variables */
    .data :
    {
        . = ALIGN(4);                               /* the section is aligned to a 4 byte boundary */

    } > RAM


    /* undefined/uninitialised variables and globals */
    .bss :
    {
        . = ALIGN(4);                               /* the section is aligned to a 4 byte boundary */

    } > RAM
}



/***********************************************************/
/****                       Notes                       ****/
/***********************************************************/
/*
    - make sure the SECTION declarations have a space between the section name and the semi-colon

*/









