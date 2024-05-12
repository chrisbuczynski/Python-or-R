# Wzór Blacka-Scholes
wycena_BS <- function(K,s,r,S0,T){

y1 <- (log(S0/K)+T*(r+(1/2)*(s^2)))/(s*sqrt(T))
y2 <- (log(S0/K)+T*(r-(1/2)*(s^2)))/(s*sqrt(T))
C <- S0*pnorm(y1)-K*exp(-T*r)*pnorm(y2)
return(C)}

# Przypadek numer 1
s <- seq(1e-3,1,0.1)
w1<- vector("numeric",length(s))
w1<- wycena_BS(K=80,s,r=0.01,S0=100,T=1)
w2<- vector("numeric",length(s))
w2<- wycena_BS(K=80,s,r=0.04,S0=100,T=1)
w3<- vector("numeric",length(s))
w3<- wycena_BS(K=80,s,r=0.08,S0=100,T=1)
matplot(s, cbind(w1, w2, w3),col=c("red", "green", "blue"), type="l",ylab="cena sprawiedliwa",xlab="s")
legend("bottomright",c("w1","w2", "w3"),fill=c("red","green","blue"),horiz = TRUE)

# Przypadek numer 2
r <- seq(1e-3,1,0.1)
y1<- vector("numeric",length(r))
y1<- wycena_BS(K=80,s=0.01,r,S0=100,T=1)
y2<- vector("numeric",length(r))
y2<- wycena_BS(K=80,s=0.3,r,S0=100,T=1)
y3<- vector("numeric",length(r))
y3<- wycena_BS(K=80,s=0.5,r,S0=100,T=1)
matplot(r, cbind(y1, y2, y3),col=c("red", "green", "blue"),type="l",ylab="cena sprawiedliwa",xlab="r")
legend("bottomright",c("y1","y2", "y3"),fill=c("red","green","blue"),horiz = TRUE)

# Przypadek numer 3
c1 <- function(K) return(wycena_BS(K,s=0.2,r=0.02,S0=100,T=1))
K <- seq(1e-3,1000,1)
plot(K, sapply(K,c1), type="l")

# Przypadek numer 4
c2 <- function(S0) return(wycena_BS(K=80,s=0.2,r=0.02,S0,T=1))
S0 <- seq(1e-3,1000,1)
plot(S0, sapply(S0,c2), type="l")

# Przypadek 5.1
s <- seq(1e-3,1,0.1)
w1<- vector("numeric",length(s))
w1<- wycena_BS(K=80,s,r=0.01,S0=100,T=15)
w2<- vector("numeric",length(s))
w2<- wycena_BS(K=80,s,r=0.04,S0=100,T=15)
w3<- vector("numeric",length(s))
w3<- wycena_BS(K=80,s,r=0.08,S0=100,T=15)
matplot(s, cbind(w1, w2, w3),col=c("red", "green", "blue"), type="l",ylab="cena sprawiedliwa",xlab="s")
legend("bottomright",c("w1","w2", "w3"),fill=c("red","green","blue"),horiz = TRUE)


# Przypadek numer 5.2
r <- seq(1e-3,1,0.1)
y1<- vector("numeric",length(r))
y1<- wycena_BS(K=80,s=0.01,r,S0=100,T=15)
y2<- vector("numeric",length(r))
y2<- wycena_BS(K=80,s=0.3,r,S0=100,T=15)
y3<- vector("numeric",length(r))
y3<- wycena_BS(K=80,s=0.5,r,S0=100,T=15)
matplot(r, cbind(y1, y2, y3),col=c("red", "green", "blue"),type="l",ylab="cena sprawiedliwa",xlab="r")
legend("bottomright",c("y1","y2", "y3"),fill=c("red","green","blue"),horiz = TRUE)

# Przypadek numer 5.3
c1 <- function(K) return(wycena_BS(K,s=0.2,r=0.02,S0=100,T=15))
K <- seq(1e-3,1000,1)
plot(K, sapply(K,c1), type="l")

# Przypadek numer 5.4
c2 <- function(S0) return(wycena_BS(K=80,s=0.2,r=0.02,S0,T=15))
S0 <- seq(1e-3,1000,1)
plot(S0, sapply(S0,c2), type="l")