# stan/models

This directory will contain the primary Stan models for:

- comparative inference
- hierarchical effects
- counterfactual architecture simulation

Current scaffold:

- `comparative_architecture_dynamics_v1.stan`
  - Gaussian comparative-delta model with partial pooling across domain, topology, and clade.
  - Intended for normalized architecture-change evidence such as `dmin_over_L` deltas or related score shifts.
