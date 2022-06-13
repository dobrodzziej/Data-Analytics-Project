data{
    int N;
    vector[N] x;
    vector[N] y;
}

parameters{
    real alpha;
    real beta;
    real<lower=0, upper = 1> sigma;
}

model {
    alpha ~ normal(18, 2);
    beta ~ normal(-0.55, 0.04);
    y ~ normal(alpha + x*beta, sigma);
}

generated quantities {
   real y_gen[N] = normal_rng(alpha + x*beta, sigma);
}