# CmdStan Execution

The initial workflow assumes a local CmdStan installation and JSON-formatted model input.

## Compile

From the repository root:

```bash
export CMDSTAN_DIR=/path/to/cmdstan
make -C "$CMDSTAN_DIR" "$PWD/stan/models/comparative_architecture_dynamics_v1"
```

This produces the executable next to the Stan source:

```bash
./stan/models/comparative_architecture_dynamics_v1
```

## Sample

```bash
mkdir -p outputs

./stan/models/comparative_architecture_dynamics_v1 \
  sample num_warmup=500 num_samples=1000 random seed=42 \
  data file=stan/data_contracts/comparative_architecture_dynamics_v1.example.json \
  output file=outputs/comparative_architecture_dynamics_v1.csv
```

Useful optional flags:

- `num_chains=4`
- `num_threads=4`
- `adapt delta=0.9`
- `refresh=50`

## Input expectations

The initial model expects:

- one row per comparative architecture observation
- a centered and scaled design matrix `X`
- response `y_delta` on the same normalized scale across observations
- measurement uncertainty `y_se` for each row
- integer group identifiers for domain, topology, and clade

The example JSON is intentionally small and synthetic. Real pipelines should materialize the
same shape from reproducible upstream tables instead of editing JSON by hand.
