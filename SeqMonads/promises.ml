(* Promises *)
(* Concurrency
Concurrent programs enable computations to overlap in duration, instead of being forced to happen sequentially.

Graphical user interfaces (GUIs), for example, rely on concurrency to keep the interface responsive while computation continues in the background. Without concurrency, a GUI would “lock up” until the current action is completed. Sometimes, because of concurrency bugs, that happens anyway—and it’s frustrating for the user!

A spreadsheet needs concurrency to re-compute all the cells while still keeping the menus and editing capabilities available for the user.

A web browser needs concurrency to read and render web pages incrementally as new data comes in over the network, to run JavaScript programs embedded in the web page, and to enable the user to navigate through the page and click on hyperlinks. *)

(* One of the primary jobs of an operating system (OS) is to provide concurrency. The OS makes it possible for many applications to be executing concurrently: a music player, a web browser, a code editor, etc. How does it do that? There are two fundamental, complementary approaches:

Interleaving: rapidly switch back and forth between computations. For example, execute the music player for 100 milliseconds, then the browser, then the editor, then repeat. That makes it appear as though multiple computations are occurring simultaneously, but in reality, only one is ever occurring at the same time.

Parallelism: use hardware that is capable of performing two or more computations literally at the same time. Many processors these days are multicore, meaning that they have multiple central processing units (CPUs), each of which can be executing a program simultaneously. *)


(* Threads *)

(* To make concurrent programming easier, computer scientists have invented many abstractions. One of the best known is threads. Abstractly, a thread is a single sequential computation. There can be many threads running at a time, either interleaved or in parallel depending on the hardware, and a scheduler handles choosing which threads are running at any given time. Scheduling can either be preemptive, meaning that the scheduler is permitted to stop a thread and restart it later without the thread getting a choice in the matter, or cooperative, meaning that the thread must choose to relinquish control back to the scheduler. The former can lead to race conditions, and the latter can lead to unresponsive applications. *)

(* Concretely, a thread is a set of values that are loaded into the registers of a processor. Those values tell the processor where to find the next instruction to execute, where its stack and heap are located in memory, etc. To implement preemption, a scheduler sets a timer in the hardware; when the timer goes off, the current thread is interrupted and the scheduler gets to run. *)

(* Promices *)

(* In the functional programming paradigm, one of the best known abstractions for concurrency is promises. Other names for this idea include futures, deferreds, and delayeds. All those names refer to the idea of a computation that is not yet finished: it has promised to eventually produce a value in the future, but the completion of the computation has been deferred or delayed. There may be many such values being computed concurrently, and when the value is finally available, there may be computations ready to execute that depend on the value. *)

(* This idea has been widely adopted in many languages and libraries, including Java, JavaScript, and .NET. Indeed, modern JavaScript adds an async keyword that causes a function to return a promise, and an await keyword that waits for a promise to finish computing. There are two widely-used libraries in OCaml that implement promises: Async and Lwt. Async is developed by Jane Street. Lwt is part of the Ocsigen project, which is a web framework for OCaml. *)

(* For now, we will mostly forget about concurrency. Later we’ll come back and incorporate it. But there is one part of the design for concurrency that we need to address now. When we later start using functions for OS-provided concurrency, such as concurrent reads and writes from files, there will need to be a division of responsibilities *)

(* The client code that wants to make use of concurrency will need to access promises: query whether they are resolved or pending, and make use of the resolved values.

The library and OS code that implements concurrency will need to mutate the promise—that is, to actually resolve or reject it. Client code does not need that ability. *)

(* We therefore will introduce one additional abstraction called a resolver. There will be a one-to-one association between promises and resolvers. The resolver for a promise will be used internally by the concurrency library but not revealed to clients. The clients will only get access to the promise. *)

(* For example, suppose the concurrency library supported an operation to concurrently read a string from the network. The library would implement that operation as follows: *)

(* Create a new promise and its associated resolver. The promise is pending.

Call an OS function that will concurrently read the string then invoke the resolver on that string.

Return the promise (but not resolver) to the client. The OS meanwhile continues to work on reading the string. *)
