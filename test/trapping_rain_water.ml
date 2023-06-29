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

(* Test cases *)
let test_cases =
  [
    (* Test case 1: Empty array *)
    ([||], 0);
    (* Test case 2: No trapped water *)
    ([| 1; 2; 3; 4; 5 |], 0);
    (* Test case 3: Water trapped in the middle *)
    ([| 3; 0; 1; 3; 0; 5 |], 8);
    (* Test case 4: Water trapped at both ends *)
    ([| 5; 0; 1; 2; 0; 3; 0; 4 |], 18);
    (* Test case 5: Water trapped with uneven heights *)
    ([| 4; 2; 0; 3; 2; 5 |], 9);
  ]

(* Run the test cases *)
let run_tests () =
  List.iteri
    (fun i (input, expected) ->
      let result = trap input in
      if result = expected then Printf.printf "Test case %d: Passed\n" (i + 1)
      else
        Printf.printf "Test case %d: Failed (Expected: %d, Actual: %d)\n"
          (i + 1) expected result)
    test_cases

let () = run_tests ()
