library(ggplot2)

gcode <- c("F", "F", "L", "L", "S", "S", "S", "S", "Y", "Y", 
           "*", "*", "C", "C", "*", "W", "L", "L", "L", "L", "P", "P", "P", 
           "P", "H", "H", "Q", "Q", "R", "R", "R", "R", "I", "I", "I", "M", 
           "T", "T", "T", "T", "N", "N", "K", "K", "S", "S", "R", "R", "V", 
           "V", "V", "V", "A", "A", "A", "A", "D", "D", "E", "E", "G", "G", 
           "G", "G")

names(gcode) <- c("TTT", "TTC", "TTA", "TTG", "TCT", "TCC", 
                  "TCA", "TCG", "TAT", "TAC", "TAA", "TAG", "TGT", "TGC", "TGA", 
                  "TGG", "CTT", "CTC", "CTA", "CTG", "CCT", "CCC", "CCA", "CCG", 
                  "CAT", "CAC", "CAA", "CAG", "CGT", "CGC", "CGA", "CGG", "ATT", 
                  "ATC", "ATA", "ATG", "ACT", "ACC", "ACA", "ACG", "AAT", "AAC", 
                  "AAA", "AAG", "AGT", "AGC", "AGA", "AGG", "GTT", "GTC", "GTA", 
                  "GTG", "GCT", "GCC", "GCA", "GCG", "GAT", "GAC", "GAA", "GAG", 
                  "GGT", "GGC", "GGA", "GGG")

nuc <- c("A", "C", "G", "T")

snuc = c(as.vector(sapply(nuc, rep, 16)),
         rep(as.vector(sapply(nuc, rep, 4)), 4),
         rep(nuc, 16))

codons <- apply(matrix(snuc, ncol = 3), 1, function(i) paste(i, collapse = ""))    



nucdf <- data.frame(x = as.factor(rep(1L:64, 3)),
                    y = c(rep(1, 64), rep(2, 64), rep(3, 64)))

ggplot(nucdf, aes(x = x, y = y, fill = snuc)) + 
  geom_tile() +
  geom_abline(intercept = 1.5, slope = 0) +
  geom_abline(intercept = 2.5, slope = 0) +
  geom_abline(intercept = 3.5, slope = 0) +
  theme_bw() +
  scale_x_discrete(labels=unname(gcode[codons])) + 
  scale_fill_hue("Nucleotides", c=40, l=80) + 
  coord_polar() +
  theme(axis.ticks.y = element_blank(), axis.text.y = element_blank(),
        axis.title.y = element_blank(), axis.title.x = element_blank(),
        axis.text.x = element_text(size = 15),
        panel.border = element_blank(),
        panel.grid.major = element_line(color = "gray60", size = 0.3),
        panel.grid.major.y = element_blank())
