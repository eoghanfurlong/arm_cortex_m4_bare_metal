/* Directives required for Cortex-M4 */
.syntax unified
.cpu cortex-m4
.thumb


.section INTERRUPT_VECTOR, "x"  /* name of SECTION with executable code*/
.global _Reset                  

_Reset:                         /* Vector table */
    B   stack_top               /* Initial Stack Pointer value */
    B   Reset_Handler           /* Reset */
    B   .                       /* NMI (Non-Maskable Interrupt) */
    B   .                       /* Hard fault */
    B   .                       /* Memory management fault */
    B   .                       /* Bus fault */
    B   .                       /* Usage fault */
                                /* TODO: add the remaining vectors */

Reset_Handler:                 /* Called whenever a Reset exception occurs */
    LDR sp, =stack_top          /* set stack pointer (address declared in linker file) */
    BL      entry               /* branch to "entry()" function */
    B       .                   /* after entry() routine completes, this branches to itself and just hangs there */