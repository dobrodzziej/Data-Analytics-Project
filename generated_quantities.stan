data {
    int N;
    vector[N] x;
}

generated quantities {
    real alpha_l = normal_rng(25, 5);
    real beta_l = normal_rng(-2, 1);
    real sigma_l = normal_rng(0.5, 0.2);
    real y_l[N] = normal_rng(alpha_l + x*beta_l, sigma_l);

    real alpha_p = normal_rng(-100, 20);
    real beta_p = normal_rng(300, 30);
    real gamma = normal_rng(-0.2, 0.4);
    real sigma_p = normal_rng(2.5, 0.8);
    real y_p[N] = normal_rng(alpha_p + beta_p*(x.^gamma), sigma_p);
}