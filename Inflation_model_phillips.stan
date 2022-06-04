data{
    int N;
    vector[N] x;
    vector[N] y;
}

parameters{
    real alpha;
    real beta;
    real<lower=0, upper = 0.1> sigma;
}

model {
    y ~ normal(alpha + beta*(x.^e()), sigma);
}

generated quantities {
   real y_gen[N] = normal_rng(alpha + beta*(x.^e()), sigma);
}