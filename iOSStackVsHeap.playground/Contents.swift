import UIKit

//MARK:- Stack Vs Heap Memory
//Classes (reference types) are allocated in the heap, value types (like Struct, String, Int, Bool, etc) live in the stack. See this topic for more detailed answers: Why Choose Struct Over Class?


/*
Source: https://stackoverflow.com/questions/27441456/swift-stack-and-heap-understanding#:~:text=Stack%20is%20used%20for%20static,stored%20in%20the%20computer's%20RAM%20.&text=Variables%20allocated%20on%20the%20heap,the%20size%20of%20virtual%20memory
*/

//**********************************************************
                //Stack and Heap Explanation
//**********************************************************

//Stack is used for static memory allocation and Heap for dynamic memory allocation, both stored in the computer's RAM .

//Variables allocated on the stack are stored directly to the memory, and access to this memory is very fast, and its allocation is determined when the program is compiled. When a function or a method calls another function which in turns calls another function, etc., the execution of all those functions remains suspended until the very last function returns its value. The stack is always reserved in a LIFO order, the most recently reserved block is always the next block to be freed. This makes it really simple to keep track of the stack. Freeing a block from the stack is nothing more than adjusting one pointer.


//Variables allocated on the heap have their memory allocated at run time, and accessing this memory is a bit slower, but the heap size is only limited by the size of virtual memory. Elements of the heap have no dependencies with each other and can always be accessed randomly at any time. You can allocate a block at any time and free it at any time. This makes it more complex to keep track of which parts of the heap are allocated or free at any given time.


//**********************************************************
                //Other Explanation
//**********************************************************
//Classes (reference types) are allocated in the heap - Memory allocated Dynamically


 //value types (like Struct, String, Int, Bool, etc) live in the stack - Memory allocated Statically

//Variables allocated on the stack are stored directly to the memory, and access to this memory is very fast, and its allocation is determined when the program is compiled
//**********************************************************
