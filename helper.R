
# load("/srv/shiny-server/growHT/Data/data_growht.RData")
 

suppressMessages({library("sitar")
  library("tidyverse")
  library("gamlss")  
})

################ plot types ####
# IAP_G_ht<-read.csv("./Data/IAPgirls_height.csv")
# IAP_B_ht<-read.csv("./Data/IAPboys_height.csv")
# girls_iap
girls_iap<-function(){
  par( cex.lab=1.5)
  plot(IAP_G_ht$Age, IAP_G_ht$H_50, col=1, lwd=2, type="l", xlim=c(5,18.5), ylim=c(95,200),xlab = "Age (years)", ylab= "Height (cm)")
  lines(IAP_G_ht$Age, IAP_G_ht$H_97, col="navy", lwd=2, lty=1)
  lines(IAP_G_ht$Age, IAP_G_ht$H_90, col="turquoise4", lwd=2, lty=1)
  lines(IAP_G_ht$Age, IAP_G_ht$H_75, col="green4", lwd=2, lty=1)
  lines(IAP_G_ht$Age, IAP_G_ht$H_25, col=7, lwd=2, lty=1)
  lines(IAP_G_ht$Age, IAP_G_ht$H_10, col="orangered", lwd=2, lty=1)
  lines(IAP_G_ht$Age, IAP_G_ht$H_3, col="red2", lwd=3, lty=1)
  grid(nx=NULL, ny=NULL)
  title("Indian height growth chart: Girls")
  legend(x = 6, y = 200, title ="Centiles", legend=c( 97, 90, 75, 50, 25, 10, 3), lty = c(1,1,1,1,1,1,1), col = c("navy","turquoise4","green4",1,7,"orangered","red2"), lwd=2, inset=0.04)
  
}


# boys_iap
boys_iap<-function(){
  par( cex.lab=1.5)
  plot(IAP_B_ht$Age, IAP_B_ht$H_50, col=1, lwd=2, type="l", xlim=c(5,18.5),ylim=c(95,200),xlab = "Age (years)", ylab= "Height (cm)")
  lines(IAP_B_ht$Age, IAP_B_ht$H_97, col="navy", lwd=2, lty=1)
  lines(IAP_B_ht$Age, IAP_B_ht$H_90, col="turquoise4", lwd=2, lty=1)
  lines(IAP_B_ht$Age, IAP_B_ht$H_75, col="green4", lwd=2, lty=1)
  lines(IAP_B_ht$Age, IAP_B_ht$H_25, col=7, lwd=2, lty=1)
  lines(IAP_B_ht$Age, IAP_B_ht$H_10, col="orangered", lwd=2, lty=1)
  lines(IAP_B_ht$Age, IAP_B_ht$H_3, col="red2", lwd=3, lty=1)
  grid(nx=NULL, ny=NULL)
  title("Indian height growth chart: Boys")
  legend(x = 6, y = 200, title ="centiles", legend=c( 97, 90, 75, 50, 25, 10, 3), lty = c(1,1,1,1,1,1,1), col = c("navy","turquoise4","green4",1,7,"orangered","red2"),  lwd=2,  inset=0.04)
}


#girls_gamlss
girls_gamlss <- function(){
  # par(mar = c(4,5,1,1) , cex = 1)
  par( cex = 1, cex.lab=1.5)
  plot(cent_girls$x,cent_girls$`0.4`, xlab = "Age (years)",
       ylab="Height (cm)", type="l", ylim = c(95,200), xlim=c(5,18.5), lwd= 2, col="darkred")
  lines(cent_girls$x,cent_girls$`2`, lwd= 2, col="red")
  lines(cent_girls$x,cent_girls$`10`, lwd= 2, col=7)  
  lines(cent_girls$x,cent_girls$`25`, lwd= 2, col="green4")
  lines(cent_girls$x,cent_girls$`50`, lwd= 2, col=1)
  lines(cent_girls$x,cent_girls$`75`, lwd= 2, col="green4")
  lines(cent_girls$x,cent_girls$`90`, lwd= 2, col=5)
  lines(cent_girls$x,cent_girls$`98`, lwd= 2, col=4)
  lines(cent_girls$x,cent_girls$`99.6`, lwd= 2, col="midnightblue")
  legend(x = 6, y = 200, title ="Centiles", legend=c(99.6, 98, 90, 75, 50, 25, 10, 2, 0.4), 
         lty = 1, col =c("midnightblue",4,5,"green4",1,"green4",7,"red","darkred"), lwd=2, cex = 1.3, inset=0.04)
   grid(nx=NULL, ny=NULL)
  title("Girls GAMLSS chart")
  
}

#boys_gamlss
boys_gamlss <- function(){
  # par(mar = c(4,5,1,1) , cex = 1, cex.lab=1.5)
  par( cex = 1, cex.lab=1.5)
  plot(cent_boys$x,cent_boys$`0.4`, xlab = "Age (years)",
       ylab="Height (cm)", type="l", ylim = c(95,200), xlim=c(5,18.5), lwd= 2, col="darkred")
  lines(cent_boys$x,cent_boys$`2`, lwd= 2, col="red2")
  lines(cent_boys$x,cent_boys$`10`, lwd= 2, col=7)  
  lines(cent_boys$x,cent_boys$`25`, lwd= 2, col="green4")
  lines(cent_boys$x,cent_boys$`50`, lwd= 2, col=1)
  lines(cent_boys$x,cent_boys$`75`, lwd= 2, col="green4")
  lines(cent_boys$x,cent_boys$`90`, lwd= 2, col=5)
  lines(cent_boys$x,cent_boys$`98`, lwd= 2, col=4)
  lines(cent_boys$x,cent_boys$`99.6`, lwd= 2, col="midnightblue")
  legend(x = 6, y = 200, title ="Centiles", legend=c(99.6, 98, 90, 75, 50, 25, 10, 2, 0.4), 
         lty = 1, col =c("midnightblue",4,5,"green4",1,"green4",7,"red","darkred"), lwd=2, cex = 1.3, inset=0.04)
  title("Boys GAMLSS chart")
  grid(nx=NULL, ny=NULL)
}


# Functions to plot sitar curves
# # girls_sitar
girls_sitar <- function(){
  # mar = c(4,5,1,1) 
  par( cex = 1,cex.lab=1.5)
  mplot(.x, .y, .id, data=sitar_girls_id,col = "grey", las = 1, lwd = 1, xlab = "Age (years)", ylab="Height (cm)", xlim=c(5,18.5), ylim = c(95,200)) #multiple plots
  grid(nx=NULL, ny=NULL)
  lines(sitar_girls,  las = 1, col="black",lwd=2.5)
  # grid(nx=NULL, ny=NULL)
  title("Girls SITAR curves")
}

boys_sitar <- function(){
  par( cex = 1,cex.lab=1.5)
  mplot(.x, .y, .id, data=sitar_boys_id,col = "grey", las = 1, lwd = 1, xlab = "Age (years)", ylab="Height (cm)", xlim=c(5,18.5), ylim = c(95,200)) #multiple plots
  grid(nx=NULL, ny=NULL)
  lines(sitar_boys,  las = 1, col="black",lwd=2.5)
  title("Boys SITAR curves")
}

