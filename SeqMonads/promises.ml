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
