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

transformed parameters {
   vector[N] mu = alpha + x*beta;
}

model {
    alpha ~ normal(18, 2);
    beta ~ normal(-0.55, 0.04);
    y ~ normal(mu, sigma);
}

generated quantities {
    real y_gen[N];
    vector[N] log_lik;
    array[N] real y_hat;
    for (i in 1:N){
        y_gen[i] = normal_rng(mu[i], sigma);
        log_lik[i] = normal_lpdf(y[i] | mu[i], sigma);
		y_hat[i] = normal_rng(mu[i], sigma);
    }
}