# architectomics-models

Stan-first inferential and counterfactual genome architecture models for Architectomics.

## Status

This repository is the initial bootstrap scaffold.

The first Stan model scaffold is now in place for comparative architecture-dynamics work.

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

## Initial Scaffold

The first model pass is centered on one partially pooled comparative model:

- `stan/models/comparative_architecture_dynamics_v1.stan`

It expects centered and scaled comparative observations where each row represents a
genome-architecture contrast or intervention-derived delta. The paired example contract lives at:

- `stan/data_contracts/comparative_architecture_dynamics_v1.example.json`

CmdStan-oriented execution notes live at:

- `docs/cmdstan_execution.md`

## Next Steps

1. Add posterior evidence output contracts and summary schemas.
2. Expand the comparative model family beyond Gaussian delta outcomes.
3. Introduce a simulator-facing intervention model once the platform repo can stage those inputs.
