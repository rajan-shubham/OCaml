type student = {name: string; branch: string; rollNo: int;};;
let shubhamid:student = {name = "shubham"; branch = "BTech"; rollNo = 10000122035};;

let studentId studentrecord= match studentrecord with
| {name; branch; rollNo} -> Printf.printf "Name is : %s , Branch is %s , Roll no is : %d\n" studentrecord.name studentrecord.branch studentrecord.rollNo;;