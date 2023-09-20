new.cluster.ids <- c("Exhausted CD8+ T","Treg","Exhausted CD8+ T","Effector CD4+ memory T"
                     ,"Exhausted CD8+ T","NKT","NKT","NKT","CD4+ cytotoxic T cell",
                     "NKT","NKT","NKT","NKT","NKT","Effector CD4+ memory T","NKT","NKT","NKT")
names(new.cluster.ids) <- levels(hms_cluster)
hms_cluster_id<- RenameIdents(hms_cluster, new.cluster.ids)
names(hms_cluster_id@meta.data)

table(hms_cluster_id$celltype)
table(Idents(hms_cluster_id), hms_cluster_id$celltype)
Cellratio <- prop.table(table(Idents(hms_cluster_id), hms_cluster_id$celltype), margin = 2)
Cellratio$Var2 <- factor(Cellratio$Var2, levels = c("nt1", "nt2", "nt3", "ad1", "ad2", "ad3", "ca1", "ca2", "ca3"))
Cellratio <- as.data.frame(Cellratio)
allcolour=c("#DC143C","#0000CD","#20B2AA","#FFA500","#9370DB","#98FB98","#F08080","#1E90FF","#7CFC00","#FFFF00",
            "#808000","#FF00FF","#FA8072","#7B68EE","#9400D3","#800080","#A0522D","#D2B48C","#D2691E","#87CEEB","#40E0D0","#5F9EA0",
            "#FF1493","#0000FF","#008B8B","#FFE4B5","#8A2BE2","#228B22","#E9967A","#4682B4","#32CD32","#F0E68C","#FFFFE0","#EE82EE",
            "#FF6347","#6A5ACD","#9932CC","#8B008B","#8B4513","#DEB887")
ggplot(Cellratio) + 
  geom_bar(aes(x = Var2, y = Freq, fill = Var1), stat = "identity", width = 0.7, size = 0.5, colour = '#222222') + 
  theme_classic() +
  labs(x = 'Sample', y = 'Ratio') +
  scale_fill_manual(values = allcolour) +
  theme(panel.border = element_rect(fill = NA, color = "black", size = 0.5, linetype = "solid")) +
  scale_x_discrete(labels = c("nt1", "nt2", "nt3", "ad1", "ad2", "ad3", "ca1", "ca2", "ca3"))