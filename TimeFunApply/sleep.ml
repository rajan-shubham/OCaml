module type Monad = sig
    type 'a t 
    val return : 'a -> 'at 
    val (>>= ) : 'a t -> ('a -> 'bt) -> 'bt
    val convert : ('a -> 'b) -> ('a -> 'bt) -> 'bt
    val extract : 'at -> ('a * float)
    val return2 : 'a -> 'bt -> 'at
   end 
   
   module TimeMonad = struct 
    type 'a t = {v :'a; avgtime:float; tottime:float;runcount:int}
    let return x = {v=x; avgtime = 0.0 ; tottime = 0.0 ; runcount= 0} 
   
    let convert f = 
       fun x -> 
         let start = Unix.gettimeofday() in 
         let res = f x in 
         let stop = Unix.gettimeofday() in
         let tm = stop -. start in 
        {v = res ; avgtime = tm ; tottime =tm ; runcount = 1} 
    let extract {v;avgtime;tottime;runcount} = (v,avgtime) 
    let return2 i {v;avgtime;tottime; runcount} = 
      { v= i ; avgtime; tottime = tottime ; runcount = runcount}
   
    let (>>=) m f =
     let { v =avg;avgtime = oldavg; tottime = oldtot ; runcount =oldcount } = m in 
    let { v = res; avgtime = avg; tottime = tot ; runcount = count} = f avg in 
    let new_tot = oldtot +. tot in 
    let new_count = oldcount + count in 
    {v = res ; avgtime = (new_tot /. (float_of_int new_count));
    tottime = new_tot; runcount = new_count} 
   end
   
   open TimeMonad
   
   let sleeprand () = Unix.sleep (Random.int 4) ;;
   
   let final_avg f x n = 
    let start = return x in 
    let rec run n acc = 
      if n = 0 then extract acc 
      else run (n-1) (acc >>= fun x-> convert f x )
    in 
    run (n-1) start;;
   