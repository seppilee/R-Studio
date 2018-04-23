library(ggplot2)
# log file from opennmt
dataPPL <- read.csv("/Users/cuba/Documents/GitHub/R-Studio/ppl.csv")
	ppl <- aggregate(dataPPL$PPL, list(dataPPL$Epoch), min)
	vppl <- aggregate(dataPPL$VPPL, list(dataPPL$Epoch), min)
	
	ggplot(ppl,aes(Group.1, x)) +
	geom_point(col="blue", shape=22) +
	geom_line(aes(col="blue")) +
    geom_point(data=vppl, col="red", shape=23) +
    geom_line(data=vppl, aes(col="red")) +
    
    ylim(0,200) +
	   theme_bw() +

	labs(
	  	title = "Learning Curve",
	    x = "Epoch",
	    y = "PPL"
	   ) +

	theme(
	  legend.box.background = element_rect(),
	  legend.box.margin = margin(6, 6, 6, 6),
	  legend.justification=c(1,0), 
	  legend.position=c(0.8,0.5),
	  axis.title.x = element_text(size = 15, vjust=-.2),
	  axis.title.y = element_text(size = 15, vjust=0.3),
	  axis.text=element_text(size=8),axis.title=element_text(size=10),
	  plot.title = element_text(size=20, hjust = 0.5)
	) +
	
	scale_color_manual(name = "PPL(Perplexity)", labels = c("Training PPL", "Validation PPL"), values = c("blue", "red")) 

	