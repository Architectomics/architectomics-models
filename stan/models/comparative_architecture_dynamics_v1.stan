data {
  int<lower=1> N;
  int<lower=1> K;
  matrix[N, K] X;
  vector[N] y_delta;
  vector<lower=0>[N] y_se;
  int<lower=1> D;
  array[N] int<lower=1, upper=D> domain_id;
  int<lower=1> T;
  array[N] int<lower=1, upper=T> topology_id;
  int<lower=1> C;
  array[N] int<lower=1, upper=C> clade_id;
}

parameters {
  real alpha;
  vector[K] beta;
  vector[D] domain_raw;
  vector[T] topology_raw;
  vector[C] clade_raw;
  real<lower=0> sigma_domain;
  real<lower=0> sigma_topology;
  real<lower=0> sigma_clade;
  real<lower=0> sigma_residual;
}

transformed parameters {
  vector[D] domain_effect = sigma_domain * domain_raw;
  vector[T] topology_effect = sigma_topology * topology_raw;
  vector[C] clade_effect = sigma_clade * clade_raw;
}

model {
  vector[N] mu;

  alpha ~ normal(0, 1);
  beta ~ normal(0, 0.75);
  domain_raw ~ std_normal();
  topology_raw ~ std_normal();
  clade_raw ~ std_normal();
  sigma_domain ~ normal(0, 0.5);
  sigma_topology ~ normal(0, 0.5);
  sigma_clade ~ normal(0, 0.5);
  sigma_residual ~ normal(0, 0.5);

  for (n in 1:N) {
    mu[n] = alpha
      + X[n] * beta
      + domain_effect[domain_id[n]]
      + topology_effect[topology_id[n]]
      + clade_effect[clade_id[n]];
  }

  for (n in 1:N) {
    y_delta[n] ~ normal(
      mu[n],
      sqrt(square(sigma_residual) + square(y_se[n]))
    );
  }
}

generated quantities {
  vector[N] mu;
  vector[N] y_rep;
  vector[N] log_lik;

  for (n in 1:N) {
    real sigma_total;
    mu[n] = alpha
      + X[n] * beta
      + domain_effect[domain_id[n]]
      + topology_effect[topology_id[n]]
      + clade_effect[clade_id[n]];
    sigma_total = sqrt(square(sigma_residual) + square(y_se[n]));
    y_rep[n] = normal_rng(mu[n], sigma_total);
    log_lik[n] = normal_lpdf(y_delta[n] | mu[n], sigma_total);
  }
}
