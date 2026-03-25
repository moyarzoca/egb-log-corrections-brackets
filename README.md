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
## Relation to the paper

This section explains the relation between Maple scripts in this repository and the paper arXiv:2603:XXXXX. The folder `load`, contains:

### Folder `load`
- `background.mpl` — Low-temperature background (Section III). Checks that the equations of motion are of order T^2.  
- `construct_pert_tensor.mpl` — Tensor modes (Section IV).  
- `construct_pert_vec.mpl` — Vector modes (Section IV). Requires one-forms defined in `sphere_killing_vectors.mpl` (e.g., `kv01.mpl`).  
- `construct_pert_U1.mpl` — U(1) gauge modes (Section IV).  
- Auxiliary scripts `check_normalization.mpl` and `check_normalization_U1.mpl` verify normalization for mode labels $n=1,\dots,10$.  

### Differential operators
- `operator.mpl`, `operator_interaction.mpl`, `operator_U1.mpl` — Define the differential operators in eqs. (67), (68), (69), respectively.  


### Outputs
All scripts save results in the `output/` folder in `.mpl` files. Variables include:

- `bracket_integrand_X` — Integrand $I(\eta, n)$ of the eigenvalue correction

$$\delta \lambda^X_{(n)} = \int_0^\infty I_X(\eta, n) d \eta$$

of the mode `X`, for any $n$.
- `series_integrand_X` — Series of the integrand.
- `correction_X` — Conjectures a recurrence for mode `X` based on the closed-form integrals of the first modes ($n=2,\dots,10$). This process is automated in `load/compute_correction.mpl`. It is important to remark that we have checked the conjecture for each mode.

