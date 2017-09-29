rph=rice_price_hike



view_pdf: $(rph).pdf
	  xdg-open $<

view_html: $(rph)_data.html
	  xdg-open $<

$(rph).pdf : $(rph).md
		      pandoc $<   --include-in-header=./INCLUDE/header.tex \
		      --latex-engine=xelatex    -o  $@   

$(rph)_data.html: $(rph)_data.md
		    pandoc  $<  -o $@

$(rph)_data.md: $(rph)_data.Rmd
		    Rscript -e    "knitr::knit('$<','$@')"
		      
		      

