# One-Loop Corrections in Einstein-Maxwell-Gauss-Bonnet

This repository contains Maple scripts reproducing the results presented in:
> Alejandro Alvarado, Andrés Anabalón, Mariano Chernicoff, Julio Oliva, Marcelo Oyarzo, Gabriel Ortega and Jorge Urbina, Logarithmic corrections to the entropy of near-extremal black holes in Einstein-Gauss-Bonnet, arXiv:2603.XXXXX [hep-th].

The nine Maple script are constructed to compute the bracket of the corrected operator linear in the temperature T for different modes. In particular, it computes:

- Tensor modes (`tensor.mpl`)
- Vector modes 1–6 (`kv01.mpl` … `kv06.mpl`)
- U(1) gauge modes (`U1.mpl`)
- Tensor combined with U(1) modes (`U1_tensor.mpl`)
- One vector combined with U(1) modes (`U1_vector.mpl`)

## Requirements
- Maple 2018+
- [GRTensorIII](https://github.com/grtensor/grtensor) package

## Installation
Clone the repository and ensure that GRTensorIII can be loaded in Maple with:
```maple
with(grtensor);
````

## Execution

Each script can be run individually from the terminal, e.g.:

```bash
maple -q tensor.mpl
```

To run all scripts sequentially, execute:

```bash
./run_all.sh
```
