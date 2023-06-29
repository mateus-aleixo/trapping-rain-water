(* Calculate the amount of trapped water in a histogram represented by an array of heights *)
let trap (height : int array) : int =
  let n = Array.length height in
  (* Pointer for the left boundary *)
  let left = ref 0 in
  (* Pointer for the right boundary *)
  let right = ref (n - 1) in
  (* Variable to store the result *)
  let res = ref 0 in
  (* Maximum height encountered from the left *)
  let maxleft = ref 0 in
  (* Maximum height encountered from the right *)
  let maxright = ref 0 in
  while !left <= !right do
    if height.(!left) <= height.(!right) then (
      if height.(!left) >= !maxleft then
        (* Update maxleft *)
        maxleft := height.(!left)
      else
        (* Calculate trapped water and add to the result *)
        res := !res + !maxleft - height.(!left);
      (* Move the left pointer to the right *)
      left := !left + 1)
    else (
      if height.(!right) >= !maxright then
        (* Update maxright *)
        maxright := height.(!right)
      else
        (* Calculate trapped water and add to the result *)
        res := !res + !maxright - height.(!right);
      (* Move the right pointer to the left *)
      right := !right - 1)
  done;
  (* Return the final result *)
  !res

(* Read an array of integers from the user *)
let rec read_array :
    ?remaining_elements:int -> ?acc:int list -> unit -> int array =
 fun ?(remaining_elements = 0) ?(acc = []) () ->
  match remaining_elements with
  | 0 ->
      print_string "Enter the number of elements (1-20000): ";
      let num_elements = read_int () in
      if num_elements < 1 || num_elements > 20_000 then (
        print_endline
          "Invalid number of elements. Please enter a value between 1 and \
           20000.";
        (* Ask for input again *)
        read_array ())
      else (
        print_string "Enter the elements of the array (space-separated): ";
        let input = read_line () in
        let splitted = String.split_on_char ' ' input in
        try
          let converted = List.map int_of_string splitted in
          let valid_heights =
            List.for_all (fun h -> h >= 0 && h <= 100_000) converted
          in
          if List.length converted = num_elements && valid_heights then
            (* Convert the list to an array *)
            Array.of_list converted
          else
            let remaining = num_elements - List.length converted in
            if remaining > 0 then (
              print_endline
                ("Incomplete input. Please enter " ^ string_of_int remaining
               ^ " more element(s).");
              read_array ~remaining_elements:remaining ~acc:(converted @ acc) ())
            else (
              print_endline
                "Invalid input. Please make sure the number of elements \
                 matches the specified value, and all heights are within the \
                 range of 0 to 100000";
              (* Ask for input again *)
              read_array ())
        with Failure _ ->
          print_endline "Invalid input. Please enter space-separated integers.";
          (* Ask for input again *)
          read_array ())
  | remaining -> (
      print_string ("Enter " ^ string_of_int remaining ^ " more element(s): ");
      let input = read_line () in
      let splitted = String.split_on_char ' ' input in
      try
        let converted = List.map int_of_string splitted in
        let valid_heights =
          List.for_all (fun h -> h >= 0 && h <= 100_000) converted
        in
        if List.length converted = remaining && valid_heights then
          (* Convert the list to an array *)
          Array.of_list (converted @ acc)
        else
          let remaining = remaining - List.length converted in
          if remaining > 0 then (
            print_endline
              ("Incomplete input. Please enter " ^ string_of_int remaining
             ^ " more element(s).");
            read_array ~remaining_elements:remaining ~acc:(converted @ acc) ())
          else (
            print_endline
              "Invalid input. Please make sure all heights are within the \
               range of 0 to 100000";
            (* Ask for input again *)
            read_array ())
      with Failure _ ->
        print_endline "Invalid input. Please enter space-separated integers.";
        read_array ~remaining_elements:remaining ~acc ())

let () =
  (* Read the array input from the user *)
  let input = read_array () in
  (* Calculate the trapped water using the 'trap' function *)
  let result = trap input in
  (* Print the result *)
  Printf.printf "Trapped water: %d\n" result
