rm(list=ls(all=TRUE))
library(XML)
library(bitops)
library(RCurl)
library(httr)

orgURL = 'https://icook.tw/categories/18?page='
#orgURL = 'https://www.ptt.cc/bbs/StupidClown/index.html'

startPage = 1
endPage = 10
alldata = data.frame()
for( i in startPage:endPage)
{
  icookURL <- paste(orgURL, i, '&ref=homepage', sep='')
  urlExists = url.exists(icookURL)
  
  if(urlExists)
  {
    html = getURL(icookURL, ssl.verifypeer = FALSE)
    xml = htmlParse(html, encoding ='utf-8')
    title = xpathSApply(xml, "//div[@class='media-body card-info']/a//text()", xmlValue)
    path = xpathSApply(xml, "//div[@class='media-body card-info']/a//@href")
    like = xpathSApply(xml, "//li[@class='fav-count recipe-favorites']", xmlValue)
    tempdata = data.frame(title, path, like)
  }
  alldata = rbind(alldata, tempdata)
  
  print(i)
}

#allDate = levels(alldata$date)
#res = hist(as.numeric(alldata$date), nclass=length(allDate), axes=F) 
#axis(1, at=1:length(allDate), labels=allDate)
#axis(2, at=1:max(res$counts), labels=1:max(res$counts))

write.csv(alldata,"alldata.csv")

