data{
    int N;
    vector[N] x;
    vector[N] y;
}

parameters{
    real alpha;
    real beta;
    real gamma;
    real<lower=0, upper = 0.5> sigma;
}

model {
    alpha ~ normal(-240, 20);
    beta ~ normal(350, 30);
    gamma ~ normal(-0.17, 0.5);
    y ~ normal(alpha + beta*(x.^gamma), sigma);
}

generated quantities {
   real y_gen[N] = normal_rng(alpha + beta*(x.^gamma), sigma);
}