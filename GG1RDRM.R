o1 = 2
u1 = 5 
o2 = 1
u2 = 4
N <- 10000

tLlegada <- rnorm(N,u1,o1) #tiempo de llegada 
tServicio <- rnorm(N,u2,o2) #tiempo de servicio

#tLlegada[1]<-0 ; tServicio[1]<- 0 #ajustamos los tiempo inicial a cero.

tllCliente <- cumsum(tLlegada)#momento en el que llegada cada cliente.

tabla1 <- data.frame(tLlegada,tllCliente)#creamo una tabla para visualizar datos
tabla1

iniServicio <- rep (0,N); iniServicio[1]<- tllCliente[1]
finServicio <- rep (0,N); finServicio[1]<- iniServicio[1]+tServicio[1]

for (n in 2:N) {
  iniServicio[n]=max(tllCliente[n],finServicio[n-1])
  finServicio[n]=iniServicio[n]+tServicio[n]
}
tabla1 <- data.frame(tLlegada,tllCliente,iniServicio,tServicio,finServicio)#creamo una tabla para visualizar datos
tabla1

tEstadia <- finServicio - tllCliente

tabla1 <- data.frame(tLlegada,tllCliente,iniServicio,tServicio,finServicio,tEstadia)#creamo una tabla para visualizar datos
tabla1

promMovil <- rep(0,N); promMovil<- tEstadia[1];

for (n in 2:N) {
  pm <- tEstadia[1:n]
  promMovil[n] <- mean(pm) 
}

tabla1 <- data.frame(tLlegada,tllCliente,iniServicio,tServicio,finServicio,tEstadia,promMovil)#creamo una tabla para visualizar datos
tabla1

plot(promMovil,type= "l", ylab= "Promedio movil",main = "Promedio Movil")
