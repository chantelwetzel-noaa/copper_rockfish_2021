
# Based on ODFW Report by Hannah!
b0 = -20.617
b1 = 0.592
x = seq(5, 61, 2)

l_50 = -b0 / b1
p = exp(b0 + b1 * x) / (1 + exp(b0 + b1 * x))

library(r4ss)
wd = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c/0.0.0_init_model"
mod = SS_output(wd)

round(p - mod$biology$Mat_len, 3)
plot(x, p); lines(x, mod$biology$Mat_len, col = 'red') 

cbind(x, round(p, 4))

> round(p - mod$biology$Mat_len, 3)
 [1]  0.000  0.000  0.000  0.000  0.000  0.000  0.000  0.000  0.000  0.000
[11]  0.001  0.003  0.008  0.011 -0.017 -0.120 -0.158 -0.089 -0.035 -0.012
[21] -0.004 -0.001  0.000  0.000  0.000  0.000  0.000  0.000  0.000

slope = -0.60
mat = 1 / (1 + exp(slope*(x-34.83))) 
plot(x, p)
lines(x, mod$biology$Mat_len, col = 'red') 
lines(x, mat, col = 'blue') 




