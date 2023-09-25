type suit = Clubs |Diamond |Hearts |Spades;;
type rank = Jack |Queen |King |Ace |Num of int;;
type card = suit * rank;;
type color = Red | Black;;
type move = Discard of card |Draw;;
exception IlleagalMove;;

let card_color (c:card) : color = match c with
|(Spades,_) |(Clubs,_) -> Black
|(Diamond,_) |(Hearts,_) -> Red;;

let card_val (c:card) : int = match c with
|(_,Ace) -> 11
|(_,Num n) -> n
|_ -> 10;;

let rec remove_card (db:card list) (c:card) (e:exn) : card list = match db with
|[] -> raise e
|hd::tl -> if hd = c then tl else hd::(remove_card tl c e);;

let rec all_same_color cards = match cards with
|[] -> true
|[cards] -> true
|card1 :: card2 :: tl -> if card_color card1 = card_color card2 then all_same_color (card2::tl) else false;;


(* let rec sum_cards (sumc:card list) (acc:int) = match sumc with
|[] -> acc 
|h::t -> sum_cards (t) (acc + card_val h);;
let sum_of_cards (sumc:card list) : int = sum_cards (sumc:card list) 0;; *)


let sum_cards cards = let rec helper r acc = match r with
|[] -> acc
|h::t -> helper (t) (acc + card_val h) in helper cards 0;;


let score held_cards goal = 
  let sum = sum_cards held_cards in if 
    all_same_color held_cards then (if sum > goal then 3 * (sum - goal) else (goal - sum)/2) else (sum - goal);;


let officiate (card_list:card list) (move_list:move list) (goal:int) : int = 
let rec play_game (held_cards:card list) (move:move list) : int = match move with
|[] -> score held_cards goal;
|move::remaining_moves ->
  let updated_state = match move with 
  |Discard c -> 
    let updated_held_cards = remove_card held_cards c IlleagalMove in 
    (updated_held_cards,remaining_moves)
  |Draw -> match card_list with
    |[] -> (held_cards,remaining_moves)
    |drawn_cards::remaining_cards -> let updated_held_cards = drawn_cards :: held_cards in (updated_held_cards,remaining_moves) in
    play_game (fst updated_state) (snd updated_state) in play_game [] move_list;;

Printf.printf("This code involves a SOLITAIRE CARD GAME .");;