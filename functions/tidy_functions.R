Get_sequence <- function(AC_number) { # Gets nucleotide sequences from Genbank Accession number
  if (is.na(AC_number) == TRUE) {NA} else {
    entrez_fetch(
      db      = "nuccore",
      id      = AC_number,
      rettype = "fasta_cds_na",
      retmode = "text"
    ) |>
      strsplit("]") |>
      unlist() |>
      tail(1) |>
      gsub(pattern = "\n", replacement = "",  x = _)
  }
}

write_to_fasta <- function(tib) { # Writes each column from tib as a .fa file
  for (column in colnames(tib)[-1]) {
    sink(here("output", paste0(column, ".fasta")))
    for (i in 1:dim(tib[, column])[1]) {
      paste0(">", tib$Species[i], "\n")|> cat(append = TRUE)
      if (is.na(tib[i, column]) == TRUE) {
        paste0("\n")|> cat(append = TRUE)
      } else {
        paste0(tib[i, column], "\n")|> cat(append = TRUE)
      }
    }
    sink()
  }
}
