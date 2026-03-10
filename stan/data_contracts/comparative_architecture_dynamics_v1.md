# comparative_architecture_dynamics_v1

This contract feeds the initial comparative architecture-dynamics Stan model.

## Semantics

Each observation is a comparative evidence row rather than a raw genome row. A row may represent:

- a matched genome contrast
- a within-clade architecture comparison
- a simulated intervention relative to a baseline architecture state

The response is a normalized architecture delta such as a standardized shift in
`dmin_over_L`, orbit-ratio deviation, or a composite architecture score.

## Fields

- `N`
  - number of comparative observations
- `K`
  - number of centered and scaled fixed-effect predictors in `X`
- `X`
  - `N x K` design matrix with no intercept column
- `y_delta`
  - observed normalized architecture change for each row
- `y_se`
  - nonnegative observation-level uncertainty on the same scale as `y_delta`
- `D`
  - number of genome-domain groups
- `domain_id`
  - integer domain index in `1..D` for each row
- `T`
  - number of topology groups
- `topology_id`
  - integer topology index in `1..T` for each row
- `C`
  - number of clade groups
- `clade_id`
  - integer clade index in `1..C` for each row

## Expected preprocessing

- Center and scale continuous predictors before materializing `X`.
- Keep `y_delta` and `y_se` on the same normalized scale.
- Encode group ids densely from `1`.
- Use a separate manifest or dataset card to map integer ids back to external labels.

## Example predictor set

The bundled example uses four predictors:

1. `log_length_bp_z`
2. `gc_fraction_z`
3. `ori_ter_confidence_z`
4. `mobile_element_density_z`

Those names are illustrative. The model contract is stable as long as the staged data preserves
column order and records that mapping outside Stan.
