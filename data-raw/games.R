# And this is Video game dataset for the gamestats package. just for notes

games <- data.frame(
  title = c(
    "The Legend of Zelda: Breath of the Wild",
    "Red Dead Redemption 2",
    "The Witcher 3: Wild Hunt",
    "God of War",
    "Elden Ring",
    "Minecraft",
    "Grand Theft Auto V",
    "Hollow Knight",
    "Stardew Valley",
    "Hades",
    "Cyberpunk 2077",
    "Dark Souls III",
    "Sekiro: Shadows Die Twice",
    "Celeste",
    "Disco Elysium",
    "Portal 2",
    "Mass Effect 2",
    "The Last of Us",
    "Undertale",
    "Baldur's Gate 3"
  ),
  genre = c(
    "Action-Adventure", "Action-Adventure", "RPG", "Action-Adventure",
    "RPG", "Sandbox", "Action-Adventure", "Metroidvania",
    "Simulation", "Roguelike", "RPG", "Action-RPG",
    "Action-Adventure", "Platformer", "RPG", "Puzzle",
    "RPG", "Action-Adventure", "RPG", "RPG"
  ),
  platform = c(
    "Nintendo Switch", "PS4/Xbox", "PC/PS4", "PS4",
    "PC/PS5", "PC/Console", "PC/PS4/Xbox", "PC/Switch",
    "PC/Switch", "PC/PS4", "PC/PS5", "PC/PS4",
    "PC/PS4", "PC/Switch", "PC", "PC/PS3",
    "PC/Xbox", "PS3/PS4", "PC", "PC/PS5"
  ),
  rating = c(
    97, 97, 93, 94, 96, 93, 96, 90,
    89, 93, 86, 89, 90, 94, 91, 95,
    96, 95, 92, 96
  ),
  avg_playtime_hours = c(
    50, 60, 100, 30, 80, 200, 40, 45,
    100, 25, 60, 40, 35, 12, 20, 10,
    35, 15, 8, 100
  ),
  year_released = c(
    2017, 2018, 2015, 2018, 2022, 2011, 2013, 2017,
    2016, 2020, 2020, 2016, 2019, 2018, 2019, 2011,
    2010, 2013, 2015, 2023
  ),
  developer = c(
    "Nintendo", "Rockstar", "CD Projekt Red", "Santa Monica Studio",
    "FromSoftware", "Mojang", "Rockstar", "Team Cherry",
    "ConcernedApe", "Supergiant Games", "CD Projekt Red", "FromSoftware",
    "FromSoftware", "Maddy Makes Games", "ZA/UM", "Valve",
    "BioWare", "Naughty Dog", "Toby Fox", "Larian Studios"
  ),
  stringsAsFactors = FALSE
)

# Thhis the dataset into the package
usethis::use_data(games, overwrite = TRUE)
