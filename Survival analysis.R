#survival analysis
setwd("U:/Yu Chenmin/07Scripts/R/")
Data = Data[,c('ToolType','ToolChangeReason_Decode','AchievedToolLife')]
write.csv(Data,'./Survival_Data.csv',row.names = F)
library(survival)
library(ggfortify)


Data1 = within(Data,{
  
  Event = NA
  
  Event[ToolChangeReason_Decode=='A_Achieve setting tool life'] = 0
  
  Event[ToolChangeReason_Decode!='A_Achieve setting tool life'] = 1
  
  
})

SampleData = Data1[Data1$ToolType %in% c('F019L0B373','F019L0B726','F019L0B720'),]

fit <- survfit(Surv(AchievedToolLife, Event) ~ ToolType, data = SampleData)

autoplot(fit, conf.int = FALSE, facets = TRUE, ncol = 1)

#test
#test2
