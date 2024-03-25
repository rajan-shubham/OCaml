(* Promises *)
(* Concurrency
Concurrent programs enable computations to overlap in duration, instead of being forced to happen sequentially.

Graphical user interfaces (GUIs), for example, rely on concurrency to keep the interface responsive while computation continues in the background. Without concurrency, a GUI would “lock up” until the current action is completed. Sometimes, because of concurrency bugs, that happens anyway—and it’s frustrating for the user!

A spreadsheet needs concurrency to re-compute all the cells while still keeping the menus and editing capabilities available for the user.

A web browser needs concurrency to read and render web pages incrementally as new data comes in over the network, to run JavaScript programs embedded in the web page, and to enable the user to navigate through the page and click on hyperlinks. *)

(* One of the primary jobs of an operating system (OS) is to provide concurrency. The OS makes it possible for many applications to be executing concurrently: a music player, a web browser, a code editor, etc. How does it do that? There are two fundamental, complementary approaches:

Interleaving: rapidly switch back and forth between computations. For example, execute the music player for 100 milliseconds, then the browser, then the editor, then repeat. That makes it appear as though multiple computations are occurring simultaneously, but in reality, only one is ever occurring at the same time.

Parallelism: use hardware that is capable of performing two or more computations literally at the same time. Many processors these days are multicore, meaning that they have multiple central processing units (CPUs), each of which can be executing a program simultaneously. *)
