
view_pdf: rice_price_hike.pdf
	  xdg-open $<


rice_price_hike.pdf : rice_price_hike.md
		      pandoc $<   --include-in-header=./INCLUDE/header.tex \
		      --latex-engine=xelatex    -o  $@   

