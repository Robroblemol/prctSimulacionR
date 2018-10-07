# prctSimulacionR by Roberto David Robles Molina
Practica de simulación taller de colas MM1 en R

Se crea dos variales aleatorias de tipo exponencial, la primara con la llegada de cada cliente y la segunada con el tiempo de servicio

```Lambda <- 0.2
miu <- 0.25
N <- 10000
tLlegada <- rexp(N,Lambda) #tiempo de llegada 
tServicio <- rexp(N,miu) #tiempo de servicio
```

Donde con cumsum se saca el valor acumunado de tiempo para la llegada de los clietnes

```tllCliente <- cumsum(tLlegada)#momento en el que llegada cada cliente```

Para el inicio y fin del servicio se ajustan manualmente el primer dato de cada uno. 
Donde el valor inicial del inicio de servivio es igual al tiempo de llegada y el valor final es la suma del valor inicial mas el tiempo de servicio

```
iniServicio <- rep (0,N); iniServicio[1]<- tllCliente[1]
finServicio <- rep (0,N); finServicio[1]<- iniServicio[1]+tServicio[1]
```

Ajustados los valores iniciales se realizan un ciclo for para los demas datos

```
for (n in 2:N) {
    iniServicio[n]=max(tllCliente[n],finServicio[n-1])
    finServicio[n]=iniServicio[n]+tServicio[n]
  }
 ```
 
 Luego sacomos el tiempo de estadia en el sistemas restando el tiempo fin del servicio con el tiempo llegada del cliente  
 
 ```tEstadia <- finServicio - tllCliente```
 
 Para sacar el promedio movil sacamos el promedio parcial de dada tiempo de estadia [1:N]

```
 promMovil <- rep(0,N); promMovil<- tEstadia[1];
 for (n in 2:N) {
  pm <- tEstadia[1:n]
  promMovil[n] <- mean(pm) 
}
```

Finalmente graficamos promedio movil

```plot(promMovil,type= "l", ylab= "Promedio movil",main = "Promedio Movil")```



