# Trapped Rain Water

This OCaml code calculates the amount of trapped water in a histogram represented by an array of heights. It uses a two-pointer approach to traverse the histogram and determine the trapped water.

## Prerequisites

- OCaml compiler and interpreter
- Dune build system

## Getting Started

1. Clone the repository or download the OCaml code file (`trapped_water.ml`).

2. Ensure that you have OCaml and Dune installed on your machine.
  - You can download OCaml from the official OCaml website: [https://ocaml.org/docs/install.html](https://ocaml.org/docs/install.html).
  - You can install Dune via opam, the OCaml package manager, by running: `opam install dune`

3. Open a terminal or command prompt and navigate to the directory where the `trapped_water.ml` file is located.

4. Build the project using Dune: `dune build`

5. Run the program: `dune exec trapping_rain_water`

6. Follow the prompts to enter the input for the histogram. First, enter the number of elements (between 1 and 20,000), and then enter the heights of the histogram elements (space-separated).

7. The program will calculate the amount of trapped water and display the result.

## Examples

Here are some examples of the program's usage:
```
Enter the number of elements (1-20000): 12
Enter the elements of the array (space-separated): 0 1 0 2 1 0 1 3 2 1 2 1 
Trapped water: 6
```
```
Enter the number of elements (1-20000): 6
Enter the elements of the array (space-separated): 4 2 0 3 2 5
Trapped water: 9
```

## Notes

- The program expects valid input. The number of elements should be between 1 and 20,000, and all heights should be non-negative integers not exceeding 100,000. Invalid input will result in an error message.
- The program uses a two-pointer approach to traverse the histogram and calculate the trapped water. It assumes that the histogram is represented by an array of integers.
- The trap function calculates the trapped water, while the read_array function is a helper function that reads the array input from the user.
- The code is written in OCaml and uses the Dune build system.
