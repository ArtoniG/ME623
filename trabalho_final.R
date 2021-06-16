
Fizemos um experimento aleatorizado com blocos completos generalizados (GCBD) de 1 tratamento com 3 níveis (0 minuto de molho, 30 minutos de molho e 2 horas de molho). Cada tulipa é uma unidade experimental e cada forno um bloco. Temos 12 tulipas por bloco, 4 tulipas para cada nível de tratamento e 4 tulipas não receberam suco (controle). O procedimento do experimento foi o seguinte:

Yijk
i = tratamento (1,2,3)
j = observacao (1,2,3,4)
k = bloco      (1,2,3)

tratamento <- rep(1:3,4)
bloco <- rep(1:3,each=12)
# rocato
RR <- c(12,15,16,11,13,14,12,14,15,11,13,14)
RB <- c(11,17,19,13,15,15,12,18,16,13,18,18)
RP <- c(5,11,14,7,14,17,7,10,14,8,14,16)

# brisa

BR <- c(8,10,11,6,8,10,6,8,11,6,9,10)
BB <- c(11,19,21,8,18,17,6,20,17,6,19,19)
BP <- c(3,9,9,3,9,14,3,7,9,6,9,14)

# pi

PR <- c(9,11,13,5,11,12,7,9,14,8,12,13)
PB <- c(9,17,20,10,14,15,11,16,14,11,17,18)
PP <- c(7,11,12,6,9,15,6,12,12,8,12,14)

m_R <- (RR+BR+PR)/3
m_B <- (RB+BB+PB)/3
m_P <- (RP+BP+PP)/3

dados <- data.frame(tratamento=as.factor(tratamento),
                    bloco=as.factor(bloco),
                    respostas=c(m_R,m_B,m_P))

model <- aov(respostas ~ tratamento * bloco, data = dados)
summary(model)
TukeyHSD(model)
