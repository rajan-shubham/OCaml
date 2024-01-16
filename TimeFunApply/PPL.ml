
module TimeMonad = struct
  
   type 'a t = {v :'a; avgtime:float; tottime:float;runcount:int}
  
  
   let return x = {v=x; avgtime = 0.0 ; tottime = 0.0 ; runcount= 0}
  
   
   let convert f = 
     fun x -> 
       let start = Unix.time() in 
       let res = f x in 
       let stop = Unix.time() in
       let elapsed_time = stop -. start in 
       {v = res ; avgtime = elapsed_time ; tottime =elapsed_time ; runcount = 1} 
  
   
   let extract {v;avgtime;tottime;runcount} = (v,avgtime) 
  
   
   let return2 i {v;avgtime;tottime; runcount} = 
     { v= i ; avgtime; tottime = tottime ; runcount = runcount}
  
  
   let (>>=) m f =
     let { v =avg;avgtime = oldavg; tottime = oldtot ; runcount =oldcount } = m in 
     let { v = res; avgtime = avg; tottime = tot ; runcount = count} = f avg in 
     let new_total_time = oldtot +. tot in 
     let new_run_count = oldcount + count in 
     {v = res ; avgtime = (new_total_time /. (float_of_int new_run_count));
     tottime = new_total_time; runcount = new_run_count} 
  end
  
 
  open TimeMonad
  
  
  let random_sleep () = Unix.sleep (Random.int 4)
  
  
  let avg_run f x n = 
   let start = return x in 
   let rec run n acc = 
     if n = 0 then extract acc 
     else run (n-1) (acc >>= fun x-> convert f x )
   in 
   run (n-1) start
  