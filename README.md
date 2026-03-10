# architectomics-models

Stan-first inferential and counterfactual genome architecture models for Architectomics.

## Status

This repository is the initial bootstrap scaffold.

It is currently staged under the `agourakis82` account and is intended to move into the `Architectomics` GitHub organization once that organization exists.

## Purpose

`architectomics-models` is the inferential engine of the Architectomics program.

It is responsible for:

- hierarchical and comparative Bayesian models
- counterfactual genome architecture simulation
- posterior calibration and reporting
- model-level benchmarks against open tasks

## Planned Layout

- `stan/models/` Stan models
- `stan/data_contracts/` model input and output contracts
- `docs/` modeling notes, assumptions, and calibration design

## Next Steps

1. Define the first posterior evidence contract.
2. Build the first comparative hierarchical model.
3. Build the first architecture-dynamics simulator model.
