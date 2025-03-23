pdf(file="~/Desktop/output.pdf", width=9, height=4) # default is 7
im.multiframe(1,3)
plot(b2)
plot(b2, col=clcyan)
plot(b2, col=inferno(100))
dev.off()
