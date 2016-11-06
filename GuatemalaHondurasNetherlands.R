dat <- read.csv(file="data/gapminder.csv", header=TRUE)
head(dat)
summary(dat)
str(dat)


mycountries <- c("Guatemala", "Honduras", "Netherlands")
three_countries_fun <- function(mycountries) {
  for (w in mycountries) {
    print(w)
    country_name <- subset(dat, dat$country == w)
    plot(country_name$year, country_name$gdpPercap, 
         xlab = "Year", ylab = "GDP", main=w)
  }
}

three_countries_fun(mycountries)
