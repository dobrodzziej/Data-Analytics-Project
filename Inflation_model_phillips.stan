data{
    int N;
    vector[N] x;
    vector[N] y;
}

parameters{
    real alpha;
    real beta;
    real gamma;
    real<lower=0, upper = 25> sigma;
}

model {
    alpha ~ normal(-100, 20);
    beta ~ normal(300, 30);
    gamma ~ normal(-0.2, 0.4);
    y ~ normal(alpha + beta*(x.^gamma), sigma);
}

generated quantities {
   real y_gen[N] = normal_rng(alpha + beta*(x.^gamma), sigma);
}