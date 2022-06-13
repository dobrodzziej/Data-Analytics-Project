data{
    int N;
    vector[N] x;
    vector[N] y;
}

parameters{
    real alpha;
    real beta;
    real gamma;
    real<lower=0, upper = 1> sigma;
}

model {
    alpha ~ normal(1, 0.2);
    beta ~ normal(35, 10);
    gamma ~ normal(1.6, 0.5);
    y ~ normal(alpha + beta./(x.^gamma), sigma);
}

generated quantities {
   real y_gen[N] = normal_rng(alpha + beta./(x.^gamma), sigma);
}