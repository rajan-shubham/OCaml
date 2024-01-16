
let random_sleep () =
  let seconds = Random.int 2 in 
  Unix.sleep seconds;
  
  
  module type Monad = sig
  type 'a t 
  val return : 'a -> 'a t
  val (>>=) : 'a t -> ('a -> 'b t) -> 'b t 
  val convert : ('a -> 'b t) -> ('a -> 'b t)
  val extract : 'a t -> ('a * float)
  val return : 'a -> 'b t -> 'a t 
  end ;;
  
  
  module TimedMonad = struct
  type 'a t = { v: 'a; avgtime:float ; tottime:float;runcount:int }
  let return x = { v=x; avgtime = 0.0; tottime = 0.0 ; runcount = 0 }
  let convert f =
  fun x ->
  let start = Sys.time()in
  let res = f x in
  let stop = Sys.time() in
  let tm = stop -.start in
  {v= res; avgtime = tm; tottime = tm ; runcount=1}
  
  let excract {v;avgtime; tottime; runcount}=(v,avgtime)
   let return2 i { v; avgtime; tottime ; runcount} =
   {v=i; avgtime = avgtime; tottime = tottime;runcount = runcount}
  
  
   let (>>=) m f =
   let { v= arg; avgtime= oldavg; tottime = oldtot; runcount = oldcount}=
   m in let { v = res ; avgtime = avg; tottime = tot ; runcount= count} = f arg in
   let new_tot = oldtot +. tot in
   let new_count = oldcount + count in
   {v= res; avgtime= (new_tot /. (float_of_int new_count));
   tottime = new_tot; runcount = new_count}
  end;;
  
  
  let f = TimedMonad.convert random_sleep;;
  
  f ();;
  
  
  let avg10time count f n =
  let rec avg10t n acc = 
    match n with 
    |0 -> acc 
    |n -> avg10t (n-1) (TimedMonad.(>>=) (acc) (TimedMonad.convert f)) in 
    avg10t (count) (TimedMonad.return n);;
  
  
  
  
  (* let avgtime count f n =
    let rec avg  n acc = 
    if n > 0 then avg((TimedMonad.(>>=) (acc) (TimedMonad.convert f )) in 
    avg (count) (TimedMonad.return n) )(n-1)
  else acc ;; *)