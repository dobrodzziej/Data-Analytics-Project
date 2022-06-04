data{
    int N;
    vector[N] x;
    vector[N] y;
}

parameters{
    real alpha;
    real beta;
    real gamma;
    real delta;
    real<lower=0, upper=1> sigma;
}

model {
    y ~ normal(alpha + x*beta + x.^2*gamma + x.^3*delta, sigma);
}

generated quantities {
   real y_gen[N] = normal_rng(alpha + x*beta + x.^2*gamma + x.^3*delta, sigma);
}