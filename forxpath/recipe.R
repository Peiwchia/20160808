rm(list=ls(all=TRUE))
library(XML)
library(bitops)
library(RCurl)
library(NLP)
#install.packages("NLP")
library(httr)

Sys.setlocale("LC_ALL", "cht")

alldata = read.csv('alldata.csv')
orgURL = 'https://icook.tw'
for( i in 1:length(alldata$X))
{
  pttURL <- paste(orgURL, alldata$path[i], sep='')
  urlExists = url.exists(pttURL)
  
  if(urlExists)
  {
    html = getURL(pttURL, ssl.verifypeer = FALSE, encoding='UTF-8')
    xml = htmlParse(html, encoding='UTF-8')
    ingredient = xpathSApply(xml, "//span[@class=\"pull-left ingredient-name\"]", xmlValue)
    viewcount = xpathSApply(xml, "//span[@class=\"views-count count-tooltip\"]", xmlValue)
    steps = xpathSApply(xml, "//li[@class=\"step\"]//div[@class=\"media-body\"]", xmlValue)

    name <- paste('./allText/c', i, '.txt', sep='')
    write(ingredient, viewcount, text, name)
  }
}