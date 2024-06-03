setwd("text")  # Set directory to "text" folder

library(dplyr)
library(gutenbergr)

books <- gutenberg_metadata  # Whole library / database

# Filter an author's works
# "Austen, Jane"; "Christie, Agatha"; "Dickens, Charles"; "Defoe, Daniel"
# "Doyle, Arthur Conan"; "Eliot, George"; "London, Jack";
# "Shakespeare, William"; "Twain, Mark"; "Wilde, Oscar"
author1 <- "Austen, Jane"
author_books <- books |> filter(author == author1 & language == "en")
# gutenberg_works(author == "Austen, Jane")

# Select the range of i
for (i in 1:10) {
  gutenberg_id <- author_books[i, "gutenberg_id"]
  title <- author_books[i, "title"]
  
  # Download text
  book_text <- gutenberg_download(gutenberg_id)
  
  # Export .txt file
  # Some characters (e.g. ":") are not allowed in file names
  writeLines(book_text$text,
             paste(author1, title, sep = " - ") |> paste0(".txt"))
}
