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
  temp_k <- fah_to_kelvin(temp)
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
