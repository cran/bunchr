`bunchr`: Analyze bunching in a kink or notch setting
================
Itai Trilnick
2016-06-14

<!-- README.md is generated from README.Rmd. Please edit that file -->
The `bunchr` package is meant to help analyze bunching in a labor economics setting. `bunchr` allows easy viewing of bunching histograms, creation of counter-factual distributions, and estimation of the elasticity of earnings w.r.t. the net-of-tax rate in **kink** and **notch** settings. At the time of writing these lines, I am unaware of any other R package doing so. I hope to keep improving this package so it is useful to many researchers.

To validate the kink analysis, results from `bunchr` are compared with an existing *Stata* utility function that was used in a peer reviewed article by Chetty, Friedman, Olsen, and Pistaferry (see vignette). I am happy to to get comments and references to other codes for bunching analysis.

Below are a few words about bunching analysis, kinks, and notches. For more information, references, and examples, please see the package vignettes.

In many cases, tax and welfare programs have points where incentives change in such way that people are expected to bunch at one side of point. For example, people are expected to bunch at the point where income tax rates increase, creating a **kink** in agents' budget lines. In another case, beneficiaries of Social Security Disability Insurance in the US are not allowed to work and earn above a certain dollar amount, and those who cross that threshold risk losing their benefits. This creates a **notch** in beneficiaries' budget lines, and bunching is expected (and seen) at that earning level.

**Kinks** and **notches** create opportunities to measure the earning elasticity w.r.t the net-of-tax rate. This parameter is considered sufficient statistic for calculating welfare from changes in tax regimes and welfare programs, and could also be used to devise optimal tax rates.
