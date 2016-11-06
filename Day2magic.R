# arithmetic calculations
2 + 3

# assigning variable
x <- 3
y <- 4    # perks of using '<-' is that you can specify the direction it's working in

# plotting in R
x <- c(1,2,3)
y <- c(2,3,1)
plot(x,y)

# class of variables
class(x)
class(y)
length(x)
length(y)

# strings
str <- "This is my first script"
class(str)
length(str)

# clear my history
rm(list = ls())
ls() # this will?

# functions
?mean
?sd
?max

# total function
# name
# function statement
# some argument
# body
# return statement
my_sum <- function(input_1,input_2) {
  tot = input_1 + input_2
  return(tot) # return is optional
}

# assigning value
input_1 = 3
input_2 = 4
input_1 + input_2

# calling a function
my_sum(input_1, input_2)
my_sum(input_1 = 4, input_2 = 5)

# Native function in R
sum(input_1+input_2)

# how about converting fahrenheit to kelvin
fah_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9) + 273.15)
  return(kelvin)
}

# what about kelvin to celsius?
kel_to_celsius <- function(temp_k) {
  celsius <- (temp_k - 273.15)
  return(celsius)
}


# alternative "fah_to_celsius"
fah_to_celsius <- function(temp_k) {
  temp_k <- fah_to_kelvin(temp=32)
  celsius < kel_to_celsius(temp_k)
  return(celsius)
}

fah_to_kelvin(temp=32)

# write a function to convert "fah_to_celsius"
fah_to_celsius <- function(temp) {
  celsius <- ((temp - 32) * (5 / 9))
  return(celsius)
}

fah_to_celsius(temp=61)

# Clear functions fah_to_cel
rm(fah_to_celsius)
rm(kel_to_celsius)
rm(fah_to_kelvin)

# call fah_to_celsius_functions.R script
source("fah_to_cel_functions.R")
fah_to_kelvin(temp=32)
kel_to_celsius(0)
fah_to_celsius(0)

# Exercise 2
best_practice <- c("write", "programs", "for", "people", "not", "computers")
asterisk <- "***"

fence <- function(input_1, input_2) {
  result = c(input_2, input_1, input_2)
  return(result)
}

input_1 <- best_practice
input_2 <- asterisk

fence(input_1 = best_practice, input_2 = asterisk)



# Now doing something with real dataset
dir.create("data") # create a directory
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data/gapminder.csv")

dat <- read.csv("data/gapminder.csv", header=TRUE)
head(dat)
summary(dat)
str(dat)

# write function called analyse that takes country as argument and
# displays mean, min, and max lifeExp of that country
# subsetting data frame
country_name <- subset(dat, dat$country == thecountry)
head(country_name)
summary(country_name)

# calculate mean, min, and max of lifeExp
mean(country_name$lifeExp)
min(country_name$lifeExp)
max(country_name$lifeExp)

# function now
analyse <- function(thecountry) {
  country_name <- subset(dat, dat$country == thecountry)
  print(mean(country_name$lifeExp))
  print(min(country_name$lifeExp))
  print(max(country_name$lifeExp))
out <- c("Mean_LE" = mean(country_name$lifeExp), "Min_LE" = min(country_name$lifeExp), "Max_LE" = max(country_name$lifeExp))
# modify the analyse function to generate a plot with "year" on 
# x-axis and "lifeExp" on y-axis
plot (country_name$year, country_name$lifeExp, xlab = "Year", ylab = "Life Expectancy", main=thecountry)
print(out)
}

analyse(thecountry = "Albania")

# loop function - the tedious way
best_practice
best_practice_fun <- function(some_argument) {
  print(some_argument[1])
  print(some_argument[2])
  print(some_argument[3])
  print(some_argument[4])
  print(some_argument[5])
  print(some_argument[6])
}
best_practice_fun(best_practice)

#loop function - the for loop
best_practice
for (w in best_practice) {
  print(w)
}
# alternatively
best_practice_fun2 <- function(some_argument) {
  for (w in some_argument) {
    print(w)
  }
}

best_practice_fun2(best_practice)



# Generate a file that contains years "1952" and "1997" and name it
# as gapminder_52_97
# and another file that contains years "1966" and "2007" and name it
# as gapminder_66_07
#hint: use subset

summary(dat)
# subset(dat, dat$country == "Uganda")
gapminder_52_97 <- subset(dat, dat$year == 1952 | dat$year == 1997)
head(gapminder_52_97)
gapminder_67_07 <- subset(dat, dat$year == 1967 | dat$year == 2007)
head(gapminder_67_07)

# writing a dataset
write.csv(file = "data/gapminder_52_97.csv", gapminder_52_97, row.names = FALSE, quote = FALSE)
write.csv(file = "data/gapminder_67_07.csv", gapminder_67_07, row.names = FALSE, quote = FALSE)

# listing files with a pattern in a directory
list.files(path = "data", pattern = ".csv", full.names = TRUE)

# write a for loop to print each filename on a different line for
# the above output
filenames <- list.files(path = "data", pattern = ".csv", full.names = TRUE)
for (f in filenames) {
  print(f)
}

# using the function you wrote this morning to print out the results
# from multiple data-sets

analyse_data <- function(file, new) {
  file_out <- read.csv(file, header = TRUE)
  country_name <- subset(file_out, file_out$country == new)
  out2 <- c("Mean_LE" = mean(country_name$lifeExp), 
            "Min_LE" = min(country_name$lifeExp), 
            "Max_LE" = max(country_name$lifeExp))
  print(file)
  print(new)
  print(out2)
  plot(country_name$year, country_name$lifeExp, 
       xlab = "Year", ylab = "Life Expectancy", main=new)
  
}

analyse_all <- function(pattern, new) {
  filenames <- list.files(path = "data", pattern = pattern, full.names = TRUE)
  for (f in filenames) {
    print(f)
    analyse_data(f, "Uganda")
  }
}
analyse_all(".csv","Uganda")
