# EMvsNLM
A numerical comparison of EM algorithm vs nlm optimizer for fitting a folded normal distribution.

This repository contains processed data (originally used in Jung, S., Foskey, M., and Marron, J. S. (2011), “Principal arc analysis on
direct product manifolds,” The Annals of Applied Statistics, 5, 578–603), and Matlab and R codes. 

To test, run matlab_EM.m (in Matlab), then run r_nlm.r (in R), specifically in this order. 

### Data
- ymat.csv contains 15 variables, each with 56 observations. 
- ymat_t.csv is abs(ymat - 1.2).

 
