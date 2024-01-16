(* first question*)
let random_sleep () =
  let seconds = Random.int 4 in 
  Unix.sleep seconds        
 (**)
 
 module TimedMonad = struct
 type 'a t = {v:'a; avgtime:float; tottime:float; runcount:int}
 
 let return x = {v=x; avgtime=0.0; tottime=0.0; runcount=0}
 
 let convert f = fun x -> let start = Sys.time() in let res = f x in let stop = Sys.time() in let  tm = stop -. start in {v=res; avgtime=tm; tottime=tm; runcount=1}
 
 let extract {v;avgtime; tottime; runcount} = (v, avgtime)
 
 let return2 i {v; avgtime; tottime; runcount} = {v=i; avgtime=avgtime; tottime=tottime; runcount=runcount}

 let (>>=) m f = 
 let {v=arg; avgtime=oldavg; tottime=oldtot; runcount=oldcount} = m in
 let {v=res; avgtime=avg; tottime=tot; runcount=count} = f arg in
 let new_tot = oldtot +. tot in
 let new_count = oldcount + count in
 {v=res; avgtime=(new_tot /. (float_of_int oldcount));
  tottime=new_tot; runcount=new_count}
end;;

let () =
 let timed_random_sleep = TimedMonad.convert random_sleep in
 let initial_state = TimedMonad.return () in
 let final_state = List.fold_left (fun acc _ -> TimedMonad.(acc >>= timed_random_sleep)) initial_state (List.init 10 (fun _ -> ())) in
 let _, avg_time = TimedMonad.extract final_state in
 Printf.printf "Average execution time: %.2f seconds\n" avg_time
;;