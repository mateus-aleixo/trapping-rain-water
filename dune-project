(lang dune 3.8)

(name trapping_rain_water)

(generate_opam_files true)

(source
 (github mateus-aleixo/trapping-rain-water))

(authors "Mateus Aleixo")

(maintainers "Mateus Aleixo")

(license MIT)

(documentation https://url/to/documentation)

(package
 (name trapping_rain_water)
 (synopsis "Calculate the amount of trapped water in a histogram")
 (description
  "This OCaml code calculates the amount of trapped water in a histogram represented by an array of heights. It uses a two-pointer approach to traverse the histogram and determine the trapped water.")
 (depends ocaml dune)
 (tags
  ("array" "histogram" "water trapping")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
