#install.packages("devtools")
#install_github("Rfacebook", "pablobarbera", subdir="Rfacebook")
library(Rfacebook)
token <- "EAACEdEose0cBANOpc6i5pv2oNq3IfNA7a8PWNO82LKlRdXNZCInltZAYjEHrzWwZAC5MmBZCQ21qZBDHhjN1V4AOWDGQmYTw7ZCZArlwl2dxshvpuPGjvIaEZCH6RZA2wgQzVnJBsqyOHcZA8N0Owyb9BnXokV6hAyW60TQtsT8mTmDQZDZD"
me <- getUsers("me", token, private_info = TRUE)
me$name
my_likes <- getLikes(user="me", token=token)
my_likes
