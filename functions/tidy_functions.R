Get_sequence <- function(AC_number) {
  if (is.na(AC_number) == TRUE) {NA} else {
    entrez_fetch(
      db = "nuccore",
      id = AC_number,
      rettype = "fasta_cds_na",
      retmode = "text"
    ) |>
      strsplit("]") |>
      unlist() |>
      tail(1) |>
      gsub(pattern = "\n", replacement = "",  x = _)
  }
}