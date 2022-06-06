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
    alpha ~ normal(25, 5);
    beta ~ normal(-2, 1);
    y ~ normal(alpha + x*beta, sigma);
}

generated quantities {
   real y_gen[N] = normal_rng(alpha + x*beta, sigma);
}