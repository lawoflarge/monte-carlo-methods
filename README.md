# Monte Carlo Methods: My MATLAB Solutions

This repository contains **my own MATLAB solution code** for the exercise sheets of a
university Monte Carlo Methods course I took. It is published as a personal reference
and portfolio of the simulation code I wrote.

## What is (and isn't) here

This repo contains only code and figures I authored myself.

Deliberately **excluded** for copyright and consent reasons:

- The course-provided problem sheets, lecture slides, and intro scripts.
- The course textbook.
- Any co-authored or classmate write-ups, scanned submissions, and bundled
  archives that re-packaged provided material.

No problem statements are reproduced here. The scripts are self-contained enough
to read on their own, but they were written against exercises whose text I do not
republish.

## Topics covered

The scripts work through a fairly standard Monte Carlo curriculum:

- **Basic simulation & estimation**: coin/duel simulations, plasmid models,
  Monte Carlo estimates with confidence intervals (CLT-based interval scripts).
- **Pseudo-random number generation**: linear/multiplicative congruential
  generators and chi-squared / goodness-of-fit testing of PRNGs.
- **Sampling non-uniform distributions**: inverse-transform sampling,
  acceptance-rejection (Cauchy, gamma), the Box-Muller and polar methods for
  normal variates, uniform sampling on discs, rings, and tori.
- **Numerical helpers**: Newton's method routines used to find
  acceptance-rejection envelope constants.
- **Monte Carlo integration & geometry**: random quadrilaterals, asteroid /
  rocket hitting-probability problems.
- **Variance reduction**: antithetic variates, control variates, and
  stratified sampling (train/tram waiting times, rainfall, uniform sums).
- **Applied Monte Carlo problems**: record statistics, umbrella / random-walk
  problems, and related estimators.

## Running the code

Everything is plain MATLAB. The `.m` scripts and functions run in
**MATLAB** (also mostly in **GNU Octave**). The two `.mlx` files are MATLAB
Live Scripts and open in the MATLAB Live Editor.

To run a given script, open it in MATLAB and execute it, or from the MATLAB
prompt:

```matlab
cd Sheets/Sheet5
gamma_mc
```

Some scripts call small helper functions kept in the same folder (e.g. `f.m`,
`g.m`, `CLT_interval.m`), so run them with that folder on the MATLAB path.

## License / use

This is my own coursework code, shared as-is for reference. No warranty.
