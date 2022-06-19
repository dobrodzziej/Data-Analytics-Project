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

transformed parameters {
   vector[N] mu = alpha + beta./(x.^gamma);
}

model {
    alpha ~ normal(1, 0.2);
    beta ~ normal(35, 10);
    gamma ~ normal(1.6, 0.5);
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