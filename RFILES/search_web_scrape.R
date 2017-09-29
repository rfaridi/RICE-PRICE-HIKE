library(xml2)
 library(rvest)

 urll="https://search.newyorkfed.org/board_public/search?start=10&Search=&number=10&text=inflation"

  urll %>% read_html()  %>% 
	     html_nodes("div#results a") %>%
		  html_attr("href")%>%
       .[!duplicated(.)]%>%lapply(function(x) read_html(x)%>%html_nodes("body"))%>%  
         Map(function(x,y) write_html(x,tempfile(y,fileext=".txt"),options="format"),.,
           c(paste("tmp",1:length(.))))

# Let's try the daily star example

url.ds <- "http://www.thedailystar.net/google/search"

url.ds %>% read_html()  %>% 
	     html_nodes("div")

# the above did not work

url.ds2  <- "https://www.google.com/search?client=ubuntu&hs=TYl&channel=fs&q=site%3Athedailystar.net+++++++rice+price&oq=site%3Athedailystar.net+++++++rice+price&gs_l=psy-ab.3...16995.18222.0.18631.5.4.1.0.0.0.146.384.0j3.3.0....0...1.1.64.psy-ab..2.0.0....0.bPguAviPE98"

url.ds2 %>% read_html()  %>% 
	     html_nodes("div#results a")

# the above did not produce any satisfactory result

# so let's try the site search style, the thing is url is strangee

	 # that also did not work

# so let me try the following 
	 # https://stackoverflow.com/questions/38932982/google-search-links-obtain-by-webscraping-in-r-are-not-in-required-format

library(rvest)
ht <- read_html('https://www.google.co.in/search?q=guitar+repair+workshop')
links <- ht %>% html_nodes(xpath='//h3/a') %>% html_attr('href')
gsub('/url\\?q=','',sapply(strsplit(links[as.vector(grep('url',links))],split='&'),'[',1))

# now let me see whether the above works in the case of google search

links  <-  url.ds2 %>% 
		read_html()  %>% 
			html_nodes(xpath='//h3/a') %>% html_attr('href')

links.clean <- gsub('/url\\?q=','',sapply(strsplit(links[as.vector(grep('url',links))],split='&'),'[',1))


links.clean %>% 
	    .[!duplicated(.)] %>% 
		    lapply(function(x) read_html(x)%>%
			        html_nodes("body")) %>% 
Map(function(x,y) write_html(x,tempfile(y,fileext=".txt"),options="format"),.,
           c(paste("tmp",1:length(.))))

.[!duplicated(.)]%>%lapply(function(x) read_html(x)%>%html_nodes("body"))%>%  
         Map(function(x,y) write_html(x,tempfile(y,fileext=".txt"),options="format"),.,
           c(paste("tmp",1:length(.))))


