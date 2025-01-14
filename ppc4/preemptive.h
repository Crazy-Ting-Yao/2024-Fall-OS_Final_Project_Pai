
#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4 /* not including the scheduler */
/* the scheduler does not take up a thread of its own */


#define CNAME(s) _ ## s
// create a counting semaphore s that is initialized to n
#define SemaphoreCreate(s, n) \
        s = n   \
        
// signal() semaphore s
#define SemaphoreSignal(s)  \
    {                       \
        __asm        \
        INC CNAME(s) \
        __endasm;     \
    } 

 // do (busy-)wait() on semaphore s
#define SemaphoreWaitBody(S, label) \
    {                \
        __asm \
            label: \
            MOV A, CNAME(S) \
            JZ label \
            JB ACC.7, label \
            dec  CNAME(S) \
        __endasm;       \
    }

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);

#endif // __COOPERATIVE_H__