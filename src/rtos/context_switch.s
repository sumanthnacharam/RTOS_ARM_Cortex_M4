.syntax unified
.cpu cortex-m4
.thumb

.global PendSV_Handler
.global SVC_Handler

.extern current_task
.extern next_task


/*
 * ----------------------------------------
 * Start First Task
 * ----------------------------------------
 */
.thumb_func
SVC_Handler:
    
    /*
     * current_task
     */

    LDR     r0, =current_task
    LDR     r1, [r0]

    /*
     * Load task stack pointer
     */

    LDR     r0, [r1]

    /*
     * Restore R4-R11
     */

    LDMIA   r0!, {r4-r11}

    /*
     * PSP now points to hardware frame
     */

    MSR     PSP, r0

    /*
     * Return to Thread mode using PSP
     */

    LDR     lr, =0xFFFFFFFD

    BX      lr


/*
 * ----------------------------------------
 * Context Switch
 * ----------------------------------------
 */
.thumb_func
PendSV_Handler:

    /*
     * Get current PSP
     */

    MRS     r0, PSP

    /*
     * Save R4-R11
     */

    STMDB   r0!, {r4-r11}

    /*
     * current_task->sp = r0
     */

    LDR     r1, =current_task

    LDR     r2, [r1]

    STR     r0, [r2]

    /*
     * current_task = next_task
     */

    LDR     r1, =next_task

    LDR     r2, [r1]

    LDR     r1, =current_task

    STR     r2, [r1]

    /*
     * Load next task SP
     */

    LDR     r0, [r2]

    /*
     * Restore R4-R11
     */

    LDMIA   r0!, {r4-r11}

    /*
     * Update PSP
     */

    MSR     PSP, r0

    /*
     * Return using PSP
     */

    ORR     lr, lr, #4

    BX      lr