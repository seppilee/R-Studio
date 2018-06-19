df<-data.frame(Bleu=c(20.3, 19.4, 20.9, 20.3, 20.8, 22, 21.5,22.1, 24.7), MT=c("p","s","p","s","p","s","p","s","n"), Year=c("2013", "2013", "2014", "2014", "2015", "2015","2016","2016", "2016"))
df %>%
mutate(MT = fct_reorder(MT, Bleu)) %>%
ggplot(aes(x=Year, y=Bleu, group=MT, fill=factor(MT))) + 
geom_bar(stat="identity", position=position_dodge(), width=0.7) +
geom_text(aes(label=Bleu, y=Bleu+0.1), color="blue", position = position_dodge(0.9), vjust = 0) +
scale_fill_manual(values=c("forestgreen", "dodgerblue", "firebrick"), breaks=c("p","s", "n"), labels=c("phrased-based", "syntax-based", "neural-based")) +

ylim(0,30) +
theme_bw() +
labs(
  	title = "MT Performance(EN => DE(Newstest 2013))",
    x = "Year",
    y = "Bleu",
    fill = ""   
    ) +

theme(
  legend.box.background = element_rect(),
  legend.box.margin = margin(6, 6, 6, 6),
  legend.direction = "horizontal",
  legend.position="bottom",
  axis.title.x = element_text(size = 15, vjust=-.2),
  axis.title.y = element_text(size = 15, vjust=0.3),
  axis.text=element_text(size=8),axis.title=element_text(size=10),
  plot.title = element_text(size=20, hjust = 0.5)
) 
