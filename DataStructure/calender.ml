type weekday = Mon | Tue | Wed | Thu | Fri | Sat | Sun
type date = { dayofmonth:int; monthnum:int; year:int }

let is_leap_year year =
  (year mod 4 = 0 && year mod 100 <> 0) || (year mod 400 = 0);;
(**)
let days_in_month leap_year month =
  match month with
  | 1 | 3 | 5 | 7 | 8 | 10 | 12 -> 31
  | 4 | 6 | 9 | 11 -> 30
  | 2 -> if leap_year then 29 else 28
  | _ -> failwith "Invalid month number";;

let date2daynum d =
  let rec count_days_in_month leap_year current_month =
    if current_month = d.monthnum then
      d.dayofmonth
    else
      count_days_in_month leap_year (current_month + 1) + days_in_month (is_leap_year d.year) current_month
  in
  count_days_in_month (is_leap_year d.year) 1;;
(**)
let weekday_generator base_date base_weekday : (date -> weekday) =
  let rec count_days_in_month leap_year current_month =
    if current_month = base_date.monthnum then
      base_date.dayofmonth
    else
      days_in_month (is_leap_year base_date.year) current_month + count_days_in_month (is_leap_year base_date.year) (current_month + 1)
  in
  let base_day_number = count_days_in_month (is_leap_year base_date.year) 1 in

  fun d ->
    let day_number = count_days_in_month (is_leap_year d.year) 1 + d.dayofmonth in
    let day_difference = (day_number - base_day_number + 7) mod 7 in

    match base_weekday with
    | Mon -> List.nth [Mon; Tue; Wed; Thu; Fri; Sat; Sun] day_difference
    | _ -> List.nth [Tue; Wed; Thu; Fri; Sat; Sun; Mon] day_difference

let () =
  let d2 = { dayofmonth = 1; monthnum = 1; year = 2024 } in
  let base_weekday = Mon in
  let weekday_function = weekday_generator d2 base_weekday in

  let example_date = { dayofmonth = 8; monthnum = 1; year = 2024 } in
  let result_weekday = weekday_function example_date in
  Printf.printf "Weekday for the given date: %s\n" (match result_weekday with Mon -> "Mon" | Tue -> "Tue" | Wed -> "Wed" | Thu -> "Thu" | Fri -> "Fri" | Sat -> "Sat" | Sun -> "Sun");
(**)
let calgen year =
  let leap_year = is_leap_year year in
  let days_in_year = if leap_year then 366 else 365 in

  let base_date = { dayofmonth = 1; monthnum = 1; year } in
  let base_weekday = Mon in
  let weekday_function = weekday_generator base_date base_weekday in

  let calendar = Hashtbl.create days_in_year in

  for day_num = 1 to days_in_year do
    let current_date = { dayofmonth = day_num; monthnum = base_date.monthnum; year } in
    let current_weekday = weekday_function current_date in
    Hashtbl.add calendar current_date current_weekday;
  done;

  calendar
(**)
let () =
  let year = 2024 in
  let calendar = calgen year in

  for day_num = 1 to (if is_leap_year year then 366 else 365) do
    let current_date = { dayofmonth = day_num; monthnum = 1; year } in
    let current_weekday = Hashtbl.find calendar current_date in
    Printf.printf "%s: %s\n" (match current_weekday with Mon -> "Mon" | Tue -> "Tue" | Wed -> "Wed" | Thu -> "Thu" | Fri -> "Fri" | Sat -> "Sat" | Sun -> "Sun") (string_of_date current_date);
  done;

and string_of_date { dayofmonth; monthnum; year } =
  Printf.sprintf "%04d-%02d-%02d" year monthnum dayofmonth

