module type Monad = sig
  type 'a t
  val return : 'a -> 'a t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
end

(* The three monad laws are as follows:

Law 1: return x >>= f behaves the same as f x.

Law 2: m >>= return behaves the same as m.

Law 3: (m >>= f) >>= g behaves the same as m >>= (fun x -> f x >>= g). *)

(* These laws are mathematically saying the same things as the laws for skip, semicolon, and braces that we saw above: return is a left and right identity of >>=, and >>= is associative. Let’s look at each law in more detail.

Law 1 says that having the trivial effect on a value, then binding a function on it, is the same as just calling the function on the value. Consider the maybe monad: return x would be Some x, and >>= f would extract x and apply f to it. Or consider the Lwt monad: return x would be a promise that is already resolved with x, and >>= f would register f as a callback to run on x.

Law 2 says that binding on the trivial effect is the same as just not having the effect. Consider the maybe monad: m >>= return would depend upon whether m is Some x or None. In the former case, binding would extract x, and return would just re-wrap it with Some. In the latter case, binding would just return None. Similarly, with Lwt, binding on m would register return as a callback to be run on the contents of m after it is resolved, and return would just take those contents and put them back into an already resolved promise.

Law 3 says that bind sequences effects correctly, but it’s harder to see it in this law than it was in the version above with semicolon and braces. Law 3 would be clearer if we could rewrite it as

(m >>= f) >>= g behaves the same as m >>= (f >>= g).

But the problem is that doesn’t type check: f >>= g doesn’t have the right type to be on the right-hand side of >>=. So we have to insert an extra anonymous function fun x -> ... to make the types correct. *)

module type Monad = sig
  type 'a t
  val return : 'a -> 'a t
  val (>>=) : 'a t -> ('a -> 'b t) -> 'b t
end

module Maybe : Monad =
struct
  type 'a t = 'a option

  let return x = Some x

  let (>>=) m f =
    match m with
    | Some x -> f x
    | None -> None

end