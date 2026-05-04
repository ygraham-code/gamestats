# gamestats 🎮

An R package for exploring, summarizing, and visualizing video game statistics.

## Installation

You can install the development version of gamestats from [GitHub](https://github.com/ygraham-code/gamestats) with:

```r
devtools::install_github("ygraham-code/gamestats")
```

## Features

-  Built-in dataset of 20 popular video games
-  Find top games by rating or playtime
-  Summarize games by genre
-  Visualize game ratings with charts
-  Generate detailed game reports

## Usage

```r
library(gamestats)

# Loading the dataset
load_games()

# Getting the top 5 rated games
top_games(5)

# Then Summarize by genre
genre_summary()

# Visualize the ratings
plot_ratings()

# And generate a game report
report <- game_report("Minecraft")
print(report)
```

## Dataset

The package includes a built-in dataset of 20 popular video games with:

- Title, genre, and platform
- Metacritic ratings out of 100
- Average playtime in hours
- Year released and developer

## License

MIT
