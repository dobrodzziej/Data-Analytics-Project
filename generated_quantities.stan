data {
    int N;
    vector[N] x;
}

generated quantities {
    real alpha_l = normal_rng(18, 2);
    real beta_l = normal_rng(-0.55, 0.04);
    real sigma_l = normal_rng(1, 0.5);
    real y_l[N] = normal_rng(alpha_l + x*beta_l, sigma_l);

    real alpha_p = normal_rng(1, 0.2);
    real beta_p = normal_rng(35, 10);
    real gamma = normal_rng(1.6, 0.5);
    real sigma_p = normal_rng(1, 0.5);
    real y_p[N] = normal_rng(alpha_p + beta_p./(x.^gamma), sigma_p);
}