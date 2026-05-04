#' here to Load the video games dataset
#'
#' @description Returns the built-in dataset of 20 popular video games
#' including ratings, genres, playtime, and more.
#'
#' @return A data frame with 20 rows and 7 variables:
#' \describe{
#'   \item{title}{Name of the game}
#'   \item{genre}{Genre of the game}
#'   \item{platform}{Platform the game is available on}
#'   \item{rating}{Metacritic rating out of 100}
#'   \item{avg_playtime_hours}{Average playtime in hours}
#'   \item{year_released}{Year the game was released}
#'   \item{developer}{Developer of the game}
#' }
#' @export
#' @examples
#' load_games()
load_games <- function() {
  gamestats::games
}

#' Get top N games by rating or playtime
#'
#' @param n Number of top games to return. Default is 5.
#' @param by Column to rank by: "rating" or "avg_playtime_hours". Default is "rating".
#'
#' @return A data frame of the top N games.
#' @export
#' @examples
#' top_games(5, by = "rating")
#' top_games(3, by = "avg_playtime_hours")
top_games <- function(n = 5, by = "rating") {
  data <- gamestats::games
  data <- data[order(data[[by]], decreasing = TRUE), ]
  head(data, n)
}

#' here this Summarize games by genre
#'
#' @description Groups the dataset by genre and returns summary statistics
#' including average rating, average playtime, and number of games per genre.
#'
#' @return A data frame summarizing stats by genre.
#' @export
#' @examples
#' genre_summary()
genre_summary <- function() {
  data <- gamestats::games
  genres <- unique(data$genre)
  result <- data.frame(
    genre = genres,
    avg_rating = sapply(genres, function(g) mean(data$rating[data$genre == g])),
    avg_playtime = sapply(genres, function(g) mean(data$avg_playtime_hours[data$genre == g])),
    num_games = sapply(genres, function(g) sum(data$genre == g)),
    stringsAsFactors = FALSE
  )
  result[order(result$avg_rating, decreasing = TRUE), ]
}

#' This Plot game ratings
#'
#' @description Creates a bar chart of video game ratings using ggplot2.
#'
#' @param n Number of games to display. Default is 10.
#'
#' @return A ggplot2 bar chart.
#' @export
#' @examples
#' plot_ratings()
#' plot_ratings(n = 5)
plot_ratings <- function(n = 10) {
  data <- gamestats::games
  data <- data[order(data$rating, decreasing = TRUE), ]
  data <- head(data, n)
  ggplot2::ggplot(data, ggplot2::aes(
    x = reorder(title, rating),
    y = rating,
    fill = genre
  )) +
    ggplot2::geom_bar(stat = "identity") +
    ggplot2::coord_flip() +
    ggplot2::labs(
      title = "Top Video Games by Rating",
      x = "Game",
      y = "Rating",
      fill = "Genre"
    ) +
    ggplot2::theme_minimal()
}

#' And here it creates a game report S3 object
#'
#' @description Creates a summary report for a specific game from the dataset.
#'
#' @param game_title The title of the game to report on.
#'
#' @return An S3 object of class "gamestats" containing game details.
#' @export
#' @examples
#' report <- game_report("Minecraft")
#' print(report)
#' summary(report)
game_report <- function(game_title) {
  data <- gamestats::games
  game <- data[data$title == game_title, ]
  if (nrow(game) == 0) {
    stop(paste("Game not found:", game_title))
  }
  structure(
    list(
      title = game$title,
      genre = game$genre,
      platform = game$platform,
      rating = game$rating,
      avg_playtime_hours = game$avg_playtime_hours,
      year_released = game$year_released,
      developer = game$developer
    ),
    class = "gamestats"
  )
}

#' printing method for gamestats objects
#'
#' @param x A gamestats S3 object.
#' @param ... Additional arguments (unused).
#'
#' @return Invisibly returns the object.
#' @export
print.gamestats <- function(x, ...) {
  cat("=== Game Report ===\n")
  cat("Title:      ", x$title, "\n")
  cat("Genre:      ", x$genre, "\n")
  cat("Platform:   ", x$platform, "\n")
  cat("Rating:     ", x$rating, "/100\n")
  cat("Playtime:   ", x$avg_playtime_hours, "hours\n")
  cat("Released:   ", x$year_released, "\n")
  cat("Developer:  ", x$developer, "\n")
  invisible(x)
}

#' And summary method for gamestats objects
#'
#' @param object A gamestats S3 object.
#' @param ... Additional arguments (unused).
#'
#' @return Invisibly returns the object.
#' @export
summary.gamestats <- function(object, ...) {
  cat("=== Game Summary ===\n")
  cat("Title:", object$title, "\n")
  cat("Rating:", object$rating, "/ 100\n")
  cat("Average Playtime:", object$avg_playtime_hours, "hours\n")
  cat("Genre:", object$genre, "\n")
  invisible(object)
}
