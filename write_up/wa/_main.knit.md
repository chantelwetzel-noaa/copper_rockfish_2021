---
geometry: margin=1in
month: "March"
year: "2021"
preamble: |
output: sa4ss::techreport_pdf
bibliography: sa4ss.bib
lang: en
papersize: a4
---



<!--chapter:end:00a.Rmd-->

---
author:
  - name: Chantel R. Wetzel
    code: 1
    first: C
    middle: R
    family: Wetzel
  - name: Brian J. Langseth
    code: 1
    first: B
    middle: J
    family: Langseth
  - name: Jason M. Cope
    code: 1
    first: J
    middle: M
    family: Cope
  - name: Tien-Shui Tsou
    code: 2
    first: T
    middle: ''
    family: Tsou
  - name: Kristen E. Hinton
    code: 2
    first: K
    middle: E
    family: Hinton
author_list: Wetzel, C.R., B.J. Langseth, J.M. Cope, T. Tsou, K.E. Hinton
affiliation:
  - code: 1
    address: Northwest Fisheries Science Center, U.S. Department of Commerce, National
      Oceanic and Atmospheric Administration, National Marine Fisheries Service, 2725
      Montlake Boulevard East, Seattle, Washington 98112
  - code: 2
    address: Washington Department of Fish and Wildlife, 600 Capital Way North, Olympia,
      Washington 98501
address:
  - ^1^Northwest Fisheries Science Center, U.S. Department of Commerce, National Oceanic
    and Atmospheric Administration, National Marine Fisheries Service, 2725 Montlake
    Boulevard East, Seattle, Washington 98112
  - ^2^Washington Department of Fish and Wildlife, 600 Capital Way North, Olympia,
    Washington 98501
---

<!--chapter:end:00authors.Rmd-->

---
title: Status of copper rockfish (_Sebastes caurinus_) in U.S. waters off the coast of Washington in 2021 using catch and length data
---

<!--chapter:end:00title.Rmd-->

\pagebreak
\pagenumbering{roman}
\setcounter{page}{1}
\renewcommand{\thetable}{\roman{table}}
\renewcommand{\thefigure}{\roman{figure}}


<!--chapter:end:01a.Rmd-->



<!--chapter:end:01executive.Rmd-->



\vspace{40cm}

_These materials do not constitute a formal publication and are for information only. They are in a pre-review, pre-decisional state and should not be formally cited (or reproduced). They are to be considered provisional and do not represent any determination or policy of NOAA or the Department of Commerce._


\pagebreak
\setlength{\parskip}{5mm plus1mm minus1mm}
\pagenumbering{arabic}
\setcounter{page}{1}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\setcounter{table}{0}
\setcounter{figure}{0}

\setlength\parskip{0.5em plus 0.1em minus 0.2em}

<!--chapter:end:10a.Rmd-->

# Introduction

## Basic Information

This assessment reports the status of copper rockfish (*Sebastes caurinus*) off the Washington coast using data through 2020.


 
Copper rockfish is a medium- to large-sized nearshore rockfish found from Mexico to Alaska.  The core range is comparatively large, from northern Baja Mexico to the Gulf of Alaska, as well as in Puget Sound.   Copper rockfish have historically been a part of both commercial (mainly in the live-fish fishery in recent years) and recreational fisheries throughout its range. 

Copper rockfish are commonly found in waters less than 130 meters in depth in nearshore kelp forests and rocky habitat [@love_milton_probably_1996]. The diets of copper rockfish consist primarily of crustaceans, mollusks, and fish [@lea_biological_1999; @bizzarro_diet_2017-1]. The body coloring or copper rockfish varies across the coast with northern fish often exhibiting dark brown to olive  with southern fish exhibiting yellow to olive-pink variations in color [@miller_guide_1972] which initially led to them being designated as two separate species (*S. caurinus* and *S. vexillaris*). 

Numerous genetic studies have been performed looking for genetic variation in copper rockfish with variable outcomes. Genetic work has revealed significant differences between Puget Sound and coastal stocks of copper rockfish [@dick_replicate_2014]. Stocks along the West Coast have not been determined to be genetically distinct populations but significant population sub-division has been detected, indicating limited oceanographic exchange among geographically proximate locations [@buonaccorsi_population_2002; @johansson_influence_2008]. A specific study examining copper rockfish populations off the coast of Santa Barbara and Monterrey California identified a genetic break between the north and south with moderate differentiation [@sivasundar_life_2010].

Copper rockfish is a relatively long-lived rockfish and are estimated to live at least 50 years [@love_milton_probably_1996]. Copper rockfish was determined to have the highest vulnerability (V = 2.27) of any West Coast groundfish stock evaluated in a productivity susceptibility analysis [@cope_approach_2011].  

## Historical and Current Fishery Information

Off the coast of Washington State copper rockfish is primarily caught in the recreational/sport fishery with very little mortality from commercial fishing (Table \ref{tab:allcatches} and Figure \ref{fig:catch}). Copper rockfish has been a target of recreational fishing as early as 1934 with catches stabilizing around 2,500 - 3,000 fish per year starting around 1980 with the exception of select years with high (2005) or low catches (2015). Copper rockfish is landed as part of the live fish fisheries in other areas off the West Coast (e.g., Oregon and California), however, live fish fisheries are prohibited in Washington waters. 

The primary region of recreational fishing off the Washington coast occurs in the central to northern regions. These areas have rocky habitat that rockfish species such as copper rockfish are associated with in comparison to the southern coast of Washington which consists primarily of soft and sandy substrate.  The stock off the Washington coast was assessed as a separate stock from other populations off the West Coast based on three factors: 1) suspected limited flow of fish between Washington and Oregon given the substrate separation, 2) the different exploitation patterns within Washington waters compared to Oregon and California, and 3) the quantity of length data in Washington compared to other areas.   


## Summary of Management History and Performance

Copper rockfish is managed by the Pacific Fishery Management Council (PFMC) as a part of the Nearshore Rockfish North and Nearshore Rockfish South complexes.  The North and South areas are split at N. 40$^\circ$ 10' Lat. N. off the West Coast. The complex is managed based on a complex level overfishing limit (OFL) and annual catch limit (ACL). The OFL and ACL values for the complex are determined by summing the species specific OFLs and ACLs managed within the complex. Removals for species within the Nearshore complex are managed and tracked against the complex total OFL and ACL, rather than on a species by species basis.

Copper rockfish was most recently assessed in 2013 as two stocks, one south of Point Conception in California and one north of Point Conception to the Washington/Canadian border.  The 2013 assessment estimated the substocks in each area to be above the management target of 40 percent of unfished conditions with the southern area being assessed at 75 percent of unfished and the northern population at 48 percent of unfished. The OFLs and the ACLs from each assessed area were modified to match the management boundary of North and South of N. 40$^\circ$ 10' Lat. N.
The OFL and ACLs for copper rockfish North of 40$^\circ$ 10' Lat. N. management area, the state-specific ACL allocation (26 percent for Washington, Groundfish Management Team, pers. comm.), and the total removals are shown in Table \ref{tab:ofl}.

<!--chapter:end:11introduction.Rmd-->

# Data

A description of each data source is provided below (Figure \ref{fig:data-plot}).

<!--chapter:end:20data.Rmd-->

## Fishery-Dependent Data


### Commercial Data

State description of recreational removal data --- To be provided by Kristen.

There is very limited commercial fishery removals of copper rockfish off the Washington coast (Table \ref{tab:allcatches} and Figure \ref{fig:catch}). Across all model years there were less than 2 mt removed by the commercial fishery. The commercial catches were provide directly by Washington Department of Fish and Wildlife (WDFW). Given the limited observed removals by the commercial fleet, the historical discards (discards prior to 2002) were assumed to be nominal and were not accounted for in the model.  In recent years, 2002-2019, the coastwide discards observed by the West Coast Groundfish Observer Program (WCGOP) were attributed to each state based on the proportion of commercial removals by state.  The commercial discards allocated to Washington were relatively minor (less than 0.02 mt total since 2002).  There were no length data available for copper rockfish in Pacific Fisheries Information Network (PacFIN) for use in this assessment.  


### Recreational / Sport Data

State description of recreational removal data --- To be provided by Kristen.

The recreational removals were provided by WDFW and consisting of both landings and estimated discard mortality. The first year of recreational removals in the model was 1935 and are the primary source of fishing mortality for copper rockfish (Figure \ref{fig:catch}). Removals were specified in numbers of fish (1,000s) and were converted to metric tons internally to the model  (Table \ref{tab:nums-mt}). The recreational removals generally increased over-time, spiked in 2005 to an all time high, and have been roughly between 2,000 and 3,000 fish per year, excluding 2019.  

Length compositions for the recreational fleet were available in 1979, 1981, 1982, 1983, and then each year from 1995 - 2020 (Table \ref{tab:len-samps}). The number of length observations by year were quite variable ranging between 3 - 463 samples per year (Figure \ref{fig:wa-len-data}). The size of sexed and unsexed fish observed by the recreational fleet were primarily between 30 - 45 cm (Figure \ref{fig:wa-len-agg}).  The mean length observed by year had limited variation with year with a marginally smaller mean length between 35 - 40 cm until 2010 after which the mean length increased slightly to range around 40 cm (Figure \ref{fig:mean-len-data}).     





<!--chapter:end:21f-.Rmd-->

## Fishery-Independent Data

There were no fishery-independent data sources that are commonly incorporated in West Coast groundfish stock assessements, as required by the Terms of Reference for Stock Synthesis catch and length (SS-CL) assessments, available for copper rockfish off the Washington coast.

<!--chapter:end:21s-.Rmd-->

## Biological Data

### Natural Mortality


Hamel [-@hamel_method_2015] developed a method for combining meta-analytic approaches relating the $M$ rate to other life-history parameters such as longevity, size, growth rate, and reproductive effort to provide a prior on $M$. In that same issue of *ICES Journal of Marine Science*, Then et al. [-@then_evaluating_2015-1] provided an updated data set of estimates of $M$ and related life history parameters across a large number of fish species from which to develop an $M$ estimator for fish species in general. They concluded by recommending $M$ estimates be based on maximum age alone, based on an updated Hoenig non-linear least squares estimator $M=4.899A^{-0.916}_{max}$. The approach of basing $M$ priors on maximum age alone was one that was already being used for West Coast rockfish assessments. However, in fitting the alternative model forms relating $M$ to $A_{\text{max}}$, Then et al. [-@then_evaluating_2015-1] did not consistently apply their transformation. In particular, in real space, one would expect substantial heteroscedasticity in both the observation and process error associated with the observed relationship of $M$ to $A_{\text{max}}$. Therefore, it would be reasonable to fit all models under a log transformation. This was not done. Re-evaluating the data used in Then et al. [-@then_evaluating_2015-1] by fitting the one-parameter $A_{\text{max}}$ model under a log-log transformation (such that the slope is forced to be -1 in the transformed space Hamel [-@hamel_method_2015]), the point estimate for $M$ is:

\begin{centering}

$M=\frac{5.4}{A_{\text{max}}}$

\end{centering}

\vspace{0.5cm}

The above is also the median of the prior. The prior is defined as a log normal distribution with mean $ln(5.4/A_{\text{max}})$ and SE = 0.438. Using a maximum age of 50, the point estimate and median of the prior is 0.108 per year  

The maximum age was selected based on available age data from all West Coast data sources and literature values.  The oldest aged rockfish was 51 years with two observations, off the coast of Washington and Oregon in 2019.  The maximum age in the model was set at 50 years.  This selection was consistent with the literature examining the longevity of  copper rockfish [@love_milton_probably_1996] and was supported by the observed ages which had multiple observations of fish between 44 and 51 years of age.  

### Length-Weight Relationship


The length-weight relationship for copper rockfish was estimated outside the model using all coastwide biological data available from fishery-independent data sources (Figure \ref{fig:len-weight-survey}). The estimated length-weight for female fish was 9.56e-06$L$^3.19^ and males at 1.08e-05$L$^3.15^ where $L$ is length in cm (Figures \ref{fig:len-weight}).

### Growth (Length-at-Age)


The length-at-age was estimated for male and female copper rockfish using data collected from fishery-dependent data sources off the coast of Oregon and Washington, collected between 1998-2019 (Table \ref{tab:len-at-age-samps}).  The fishery-dependent had limited observations of young fish (less that 4 years of age) which presented challenges for estimating growth. Attempting to estimate growth in the absence of data to inform the rate of growth ($k$) and the size-at-age 0 ($t_0$) could result in biased estimates of all parameters including the size-at-maximum length ($L_{\infty}$). A published growth study for copper rockfish by Lea [-@lea_biological_1999] had numerous observations of young fish and also reported the mean length, the number of observations, and the standard deviation of the length observations by age. These pieces of information were used to simulate length-at-age data that would be representative of the study's data for fish less than 5 years of age. The simulated data for young fish appeared consistent with older fish observed off the Oregon and Washington coast (Figure \ref{fig:len-age-data}). This combined data set was used to estimate growth curves for male and female copper rockfish that were used in this assessment.  Ideally growth would be estimated using data collected from similar sources. However, the bias from using data from different sources was considered to be less than the bias that may arise from estimating growth from observation that did not cover the range of ages. Future research should be conducted to collect a range of lengths by area which would allow for estimates of copper rockfish growth.   

The estimated growth used in this assessment had females reach marginally larger asymptotic sizes compared to males. Sex-specific growth parameters were estimated at the following values:

\begin{centering}

Females $L_{\infty}$ = 48.4 cm; $k$ = 0.206

Males $L_{\infty}$ = 47.2 cm; $k$ = 0.231

\end{centering}

\vspace{0.5cm}

These values were fixed within the base model for male and female copper rockfish. While the growth differences between sexes was limited for copper rockfish, sex-specific parameterization was used in the hopes that it would allow the length data to the most informative within the assessment. The coefficient of variation (CV) around young and old fish was fixed at a value of 0.10 for both sexes. The length-at-age curve with the CV around length-at-age by sex is shown in Figure \ref{fig:len-age-ss}.  

In contrast, the length-at-age values cited in the 2013 data-moderate assessment [@cope_data-moderate_2013] for copper rockfish (although not directly used by the data-moderate model) were from Lea [-@lea_biological_1999]. The $L_{\infty}$ from the Lea study were quite a bit larger for both sexes than those estimated for this assessment using recent length and age data off the coast of Oregon and Washington. In the Lea [-@lea_biological_1999] young fish were well sampled, however, there were very few observations of fish older than 12 years of age (less than 5 total) which appears to have led to a poorly informed estimate of $L_{\infty}$.   

### Maturation and Fecundity


Maturity-at-length based on the work of Hannah [-@hannah_length_2014] which estimated the 50 percent size-at-maturity of 34.8 cm and slope of -0.6 off the coast of Oregon with maturity asymptoting to 1.0 for larger fish (Figure \ref{fig:maturity}).  

The fecundity-at-length was based on research Dick et al. [-@dick_meta-analysis_2017]. The fecundity relationship for copper rockfish was estimated equal to 3.362e-07$L$^3.68^ in millions of eggs where $L$ is length in cm. Fecundity-at-length is shown in Figure \ref{fig:fecundity}.

Table \ref{tab:growth-tab} shows the length-at-age, weight-at-age, maturity-at-age, and spawning output (the product of fecundity and maturity) assumed in the base model.

### Sex Ratio


There was limited sex specific observations by length or age for all biological data sources (Figures \ref{fig:len-sex-ratio} and \ref{fig:age-sex-ratio}). The sex ratio of young fish was assumed to be 1:1. 

<!--chapter:end:22biology.Rmd-->

# Assessment Model

## Summary of Previous Assessments 


Copper rockfish was last assessed in 2013 [@cope_data-moderate_2013]. The stock was assessed using extended depletion-based stock reduction analysis (XDB-SRA) a data-moderate approach which incorporated catch and index data with priors on select parameters: natural mortality, stock status in a specified year, productivity, and the relative status of maximum productivity. Copper rockfish was assessed as two separated stocks, the area south of Point Conception off the California coast and the area north of Point Conception to the Washington/Canadian border. The 2013 assessment estimated the stock south of Point Conception at 75 percent of unfished spawning biomass and the stock north of Point Conception at 48 percent of unfished spawning biomass. 

### Bridging Analysis

A direct bridging analysis was not conducted because the previous assessment was structured to include the area from north of Point Conception to the Washington/Canadian border.  


## Model Structure and Assumptions

The assessment of copper rockfish in Washington waters was assessed using a two-sex model with sex specific life history parameters.  The model assumed two fleets: 1) recreational and 2) commercial fleets with recreational removals beginning in 1935. Selectivity was specified using the double normal parameterization within Stock Synthesis for the recreational fleet where selectivity was fixed to be asymptotic with the ascending slope and size of maximum selectivity parameters estimated.  The commercial fleet selectivity was assumed to be the same as the recreational fleet due to a lack of length data to estimate a fleet specific selectivity curve.  Recruitment was specified to be deterministic due to limited composition data. 

### Modeling Platform and Structure

Stock Synthesis version 3.30.16 was used to estimate the parameters in the model. The R package r4ss, version 1.38.0, along with R version 4.0.1 were used to investigate and plot model fits. 

### Priors


Prior were used to determine fixed parameter values for natural mortality and steepness in the base model.  The prior distribution for natural mortality was based on the Hamel [-@hamel_method_2015] meta-analytic approach with  an assumed maximum age of 50 years. The prior assumed a log normal distribution for natural mortality. The log normal prior has a median of 0.108 and a standard error of 0.438. 

The prior for steepness assumed a beta distribution with mean of 0.72 and standard error of 0.15. The prior parameters are based on the Thorson-Dorn rockfish prior (commonly used in past West Coast rockfish assessments) conducted by James Thorson (personal communication, NWFSC, NOAA) which was reviewed and endorsed by the Scientific and Statistical Committee (SSC) in 2017. However, this approach was subsequently rejected for future analysis in 2019 when the new meta-analysis resulted in a mean value of approximately 0.95. In the absence of a new method for generating a prior for steepness the default approach reverts to the previously endorsed method, the 2017 value.

### Data Weighting

Length compositions from the recreational fleet were the only composition data fit in the model. In the absence of index or commercial composition data, no data weighting was performed in the base model. Sensitivities were performed using the three data weighting approaches that are commonly applied for West Coast groundfish stock assessments: Francis method [@francis_data_2011], McAllister and Ianelli method,also known as Harmonic Mean weighting [@mcallister_bayesian_1997], and the Dirichlet-Multinomial method [@thorson_model-based_2017].


### Estimated and Fixed Parameters

There were 3 estimated parameters in the base model. These included one parameter for $R_0$ and 2 parameters for recreational selectivity (Table \ref{tab:params}). Selectivity in the recreational fleet was fixed asymptotic with only the peak the and the ascending slope estimated.  Dome-shaped selectivity was explored for the recreational fleet. Older and larger copper rockfish may be found deeper waters and may move into areas that limit their availability to fishing gear. However, limited support for dome-shaped selectivity for the recreational fleet was found and the selectivity was fixed to be asymptotic.  The commercial selectivity was set equal to the recreational selectivity due to a lack of composition data to support fleet specific estimation. 

Fixed parameters in the model were as follows. Steepness was fixed at  the mean of the prior. Natural mortality was fixed at 0.108 yr^-1^ for females and males, which is the median of the prior. The standard deviation of recruitment deviates was fixed at 0 and recruitment was assumed deterministic. Maturity-at-length was fixed as described above in Section \ref{maturation-and-fecundity}. Length-weight parameters were fixed at estimates using all length-weight observations described above in Section \ref{length-weight-relationship}. The length-at-age was fixed at sex-specific externally estimated values described above in Section \ref{growth-length-at-age}.


## Model Selection and Evaluation

The base assessment model for copper rockfish was developed to balance parsimony and realism, and the goal was to estimate a spawning output trajectory for the population of copper rockfish off the Washington coast. The model contains many assumptions to achieve parsimony and uses many different sources of data to estimate reality. A series of investigative model runs were done to achieve the final base model.



<!--chapter:end:30model.Rmd-->

## Base Model Results

The base model parameter estimates along with approximate asymptotic standard errors are shown in Table \ref{tab:params} and the likelihood components are shown in Table \ref{tab:likes}. Estimates of stock size and status over time are shown in Table \ref{tab:timeseries}. 


### Parameter Estimates

Estimated parameter values are provided in Table \ref{tab:params}. The model estimated 3 total parameters: $R_0$ and two parameters associated with the recreational fleet selectivity.  The $R_0$ was estimated at 2.03. The selectivity curve was estimated for the recreational fleet (Figure \ref{fig:selex}). The selectivity was fixed to be asymptotic, reaching maximum selectivity for fish at 37 cm.  The selectivity for the commercial fleet was assumed to be equal to the recreational fleet selectivity due to no available commercial length data.


### Fits to the Data

Fits to the length data are shown based on the Pearson residuals-at-length, the annual mean lengths, and aggregated length composition data for the recreational fleet. The Pearson residuals show a pattern of greater observations of all sexes (unsexed, males, and females) that start around 1995 and appear to move through the length data by year, possibly indicating a strong or multiple strong recruitments entering the population (Figure \ref{fig:rec-pearson}). The base model did not estimate annual recruitment deviations due to limited length data across recent years which may have allowed the model to better fit these data. The assessment of copper rockfish off the Oregon coast which did include annual recruitment deviations estimated multiple strong recruitments in 1995 and 1997 indicating that oceanographic forces that drive recruitment success or failure may be shared across Oregon and Washington.  The mean lengths across years with data was relatively stable ranging roughly between 35 and 42 cm by year (Figure \ref{fig:rec-mean-len-fit}). 

Detailed fits to the length data by year are provided in [Appendix A](#append_a). Aggregate fits by fleet are shown in Figure \ref{fig:agg-len-fit}.  There are a few things that stand out when examining the aggregated length composition data. The estimated fits to the data by sex matches the general shape of the aggregated lengths, however, the model expects a higher proportion of the largest fish relative to the data.  This may indicate that the true selectivity of the recreational fleet may have some level of reduced selectivity of the largest fish (dome-shaped) but the selectivity in the model was fixed to be asymptotic to follow the pre-specified terms of reference for a length-based assessment which specifies that at least one fleet in the model should have asymptotic selectivity. Sensitivities examining dome-shaped and estimating annual recruitment deviations were performed and presented in the [Sensitivity Analyses](#sensitivity-analyses) section below. 

### Population Trajectory

The predicted spawning output (in millions of eggs) is given in Table \ref{tab:timeseries} and plotted in Figure \ref{fig:ssb}. The predicted spawning output from the base model generally showed a slow decline over the time series with the spawning output stabilizing in recent years. The total biomass shows a similar slow decline across the modeled years (Figure \ref{fig:tot-bio}).

The 2020 spawning output relative to unfished equilibrium spawning output is above the target of 40 percent of unfished spawning output (0.42, Figure \ref{fig:depl}). Approximate confidence intervals based on the asymptotic variance estimates show that the uncertainty in the estimated spawning output is limited. The standard deviation of the log of the spawning output in 2020 is 0.1.

The stock-recruit curve resulting from a value of steepness fixed at  is shown in Figure \ref{fig:bh-curve}. The estimated annual recruitment is shown in  Figure \ref{fig:recruits}


### Reference Points

Reference points were calculated using the estimated selectivity and catch distributions among fleets in the most recent year of the model (2020, Table \ref{tab:referenceES}). Sustainable total yields are estimated to be 2.24 mt when using an $SPR_{50\%}$ reference harvest rate. The spawning output equivalent to 40 percent of unfished ($SB_{40\%}$) was estimated to be 3.41 millions of eggs. 

The 2020 spawning output relative to unfished equilibrium spawning output is above the target of 40 percent of unfished spawning output in 2020 ((0 percent, Figure \ref{fig:depl}). The fishing intensity, $1-SPR$, has bounced above and below the harvest rate limit ($SPR_{50\%}$) in recent years (Table \ref{tab:timeseries} and Figure \ref{fig:1-spr}). Table \ref{tab:referenceES} shows the full suite of estimated reference points for the base model and Figure \ref{fig:yield} shows the equilibrium curve based on a steepness value fixed at 0.72.

<!--chapter:end:33results.Rmd-->

## Model Diagnostics

### Convergence

Proper convergence was determined by starting the minimization process from dispersed values of the maximum likelihood estimates to determine if the model found a better minimum. Starting parameters were jittered by 10 percent. This was repeated 100 times with 94 out of 100 runs returned to the base model likelihood. A better, lower negative log-likelihood, model fit was not found. The model did not experience convergence issues when provided reasonable starting values. Through the jittering done as explained and likelihood profiles, we are confident that the base model as presented represents the best fit to the data given the assumptions made. There were no difficulties in inverting the Hessian to obtain estimates of variability, although much of the early model investigation was done without attempting to estimate a Hessian. 

### Sensitivity Analyses

A number of sensitivity analyses were conducted.  The majority of the sensitivities conducted was a single exploration from the base model assumptions and/or data, and were not performed in a cumulative fashion.

\begin{enumerate}

  \item Estimate female natural mortality ($M$).
  
  \item Estimate female growth coefficient ($k$).

  \item Estimate female $L_{\infty}$. 
    
  \item Estimate annual recruitment deviations. 

  \item Estimate annual recruitment deviations while allowing for a dome-shaped selectivity curve. 
  
  \item Data weighting according to the McAllister-Ianelli (MI DW) method using the weighting values shown in Table \ref{tab:dw}. 

  \item Data weighting according to the Francis method using the weighting values shown in Table \ref{tab:dw}. 
  
  \item Data weighting according to the Dirichlet-Multinomial (DM DW) method where the estimated parameters are shown in Table \ref{tab:dw}. 
  
\end{enumerate}

Likelihood values and estimates of key parameters from each sensitivity are available in Table \ref{tab:sensitivities}.  Plots of the estimated time-series of spawning biomass and relative spawning biomass are shown in Figures \ref{fig:sens-ssb} and \ref{fig:sens-depl}.

The two sensitivities that had the largest impact relative to the base model were the ones that estimated annual recruitment deviations alone or combined to estimate dome-shaped selectivity (Figures \ref{fig:sens-ssb} and \ref{fig:sens-depl}). The time series of each of these sensitivities resulted in large scale swings in spawning output across time. The estimates or recruitment deviations had a string of average estimates during the late 1990s and early 2000s then switching to a period of low recruitment success in recent years (Figure \ref{fig:sens-recr}). The recruitment deviation estimates were likely being driven by subtle shifts in the mean lengths being observed across time (Figure \ref{fig:mean-len-data}). The pattern of recruitment deviations estimated was extreme for the Washington area model but the general pattern showed some coherence with the recruitment deviations peaks estimated in the separate Oregon area model. The Oregon base model which had larger length sample sizes relative to the Washington base model, estimated above average recruitment in the late 1990s which led to an increase in spawning output during the 2000s similar to what was observed in this sensitivity for the Washington model.  This may indicate that copper rockfish off the coast of Oregon and Washington experience similar drivers in recruitment.     

A sensitivity run allowing dome-shaped selectivity with deterministic recruitment was also performed but not shown here due to the model failing to estimate a reasonable biomass scale (hit the upper bound of log($R_0$) of 20). 

The sensitivities exploring data weighting using the Francis or MI methods matched the base model as expected given that there was only one source of data used in the model. In contrast, the DM method resulted in a stock size and status less than the base model.  It is unclear why this difference in results across data weighting arose.  


### Likelihood Profiles

Likelihood profiles were conducted for $R_0$, steepness, maximum length, and female natural mortality values separately. These likelihood profiles were conducted by fixing the parameter at specific values and estimated the remaining parameters based on the fixed parameter value.

In regards to values of $R_0$, the negative log-likelihood was minimized at approximately log($R_0$) of 2.03 (Figure \ref{fig:r0-profile}). Increasing the $R_0$, relative to the value estimated, results in an increase in stock scale and status (Figures \ref{fig:r0-ssb} and \ref{fig:r0-depl}). 

For steepness, the negative log-likelihood supported values at the upper bound of 1.0 (Figure \ref{fig:h-profile}).  Assuming higher or lower steepness values impacted the estimated unfished spawning output but had less impact on the final spawning output (Figure \ref{fig:h-ssb}). The estimated relative final stock status ranged between around the minimum threshold (0.25) to above the management target depending upon assuming a lower or higher steepness value (Figure \ref{fig:h-depl}).

The negative log-likelihood profile across female natural mortality supported values greater than the fixed value of 0.108 (Figure \ref{fig:m-profile}). The estimate stock trajectories assuming lower or higher natural mortality values impacted the estimated unfished spawning output and resulted in stock statuses within the management precautionary zone (between 0.25 - 0.40) and above (Figures \ref{fig:m-ssb} and  \ref{fig:m-depl}). 

A profile across a range of female $L_{\infty}$ values was also conducted (Figure \ref{fig:linf-profile}).  The negative log-likelihood showed support for values between 46 and 47 cm. The $L_{\infty}$ value for female fish in the model was fixed at 48.43 based on length-at-age data collected off the Oregon and Washington coast. The stock scale and status is quite variable across alternative $L_{\infty}$ values where assuming lower values resulted in sharp increases in stock scale and status (Figure \ref{fig:linf-ssb} and \ref{fig:linf-depl}).

A profile across a range of female $k$ values was also conducted (Figure \ref{fig:k-profile}).  The negative log-likelihood showed support for values between 0.11 and 0.13. The $k$ value for female fish in the model was fixed at 0.206 based on length-at-age data collected off the Oregon and Washington coast. The stock scale and status increases under lower $k$ values where assuming higher values resulted in decreases in stock scale and status (Figure \ref{fig:k-ssb} and \ref{fig:k-depl}).

### Length-Based Spawner-per-Recruit Analysis

An exploratory length-based spawner-per-recruit analysis which assumes asymptotic selectivity and deterministic recruitment to produce independent estimates by year of selectivity and spawner-per-recruit (SPR) effort based on the observed recreational lengths. This analysis indicated that copper rockfish were 50 percent selected generally between 30 - 35 cm (excluding 2018) with full selection between 35 - 40 cm  (Figure \ref{fig:lbspr}). The median estimates of SPR by year ranged between 0.60 - 0.75 between 2016 - 2020. This type of analysis can provide insight on the fishing effort based on life history and observed length data in the absence of an integrated assessment model.  The estimates of the SPR harvest rate by year was used to provide an external estimate of stock status for a Simple Stock Synthesis sensitivity.   

### Simple Stock Synthesis

A Simple Stock Synthesis (SSS) was run to compare the results from the base model with a simpler modeling approach.  SSS samples via Monte Carlo from three key parameter distributions: natural mortality, steepness, and stock status in a specific year.  The mean and median of the priors assumed in the base model were used to create sampling distributions for natural mortality and steepness.  Two alternative assumptions regarding the distribution of current stock status were explored. SSS applies parameter draws from each of the three parameters within the model and then estimates an $R0$ value based on the fixed removals and drawn parameters.   

\begin{enumerate}

	\item Current stock status based on the estimate from the base model (SS-CL):
	\begin{itemize}
		\item Number of draws = 1000,
		\item $M$ = lognormal distribution ($\mu$ = 0.108, $\sigma$ = 0.22),
		\item $h$ = truncated beta ($\alpha$ = 0.72, $\beta$ = 0.15, a = 0.20, b = 1.0), and
		\item Fraction unfished in 2020 = beta($\alpha$ = 0.40, $\beta$ = 0.20)
	\end{itemize}	  
	\item Current stock status based on LB-SPR estimates: 
		\begin{itemize}
		\item Number of draws = 1000,
		\item $M$ = lognormal ($\mu$ = 0.108, $\sigma$ = 0.22),
		\item $h$ = truncated beta ($\alpha$ = 0.72, $\beta$ = 0.15, a = 0.20, b = 1.0), and
		\item Fraction unfished in 2020 = beta($\alpha$ = 0.60, $\beta$ = 0.20)	
	\end{itemize}

\end{enumerate}

The median of unfished spawning output, spawning output 2021, fraction unfished in 2021, the OFL in 2023, and the ABC in 2023 based on the 2021 fraction unfished of 60 percent is shown in in Table \ref{tab:SSS-60}. The prior distribution for parameters and the derived quantities with 95 percent uncertainty are shown in Figures \ref{fig:sss-prior-60} and \ref{fig:sss-quant-60}. Assuming that the stock was less depleted relative to the base model resulted in higher estimates of the OFL and ABC in 2023, even when the category 3 buffer was applied (buffer = 0.78, based on a P* = 0.45 and \sigma = 2.0).  

The median of unfished spawning output, spawning output 2021, fraction unfished in 2021, the OFL in 2023, and the ABC in 2023 based on the 2021 fraction unfished of 40 percent is shown in in Table \ref{tab:SSS-40}. The prior distribution for parameters and the derived quantities with 95 percent uncertainty are shown in Figures \ref{fig:sss-prior-40} and \ref{fig:sss-quant-40}. Assuming a stock status similar to the base model in SSS resulted in an OFL and ABC values that were marginally lower due to the larger buffer applied in the SSS model (base model OFL in 2023 = 2.15, ABC in 2023 = 1.88).  

### Retrospective Analysis
A five-year retrospective analysis was conducted by running the model using data only through 2015, 2016, 2017, 2018, 2019 and 2020. The estimated spawning output was consistent with the base model when recent year's data were removed up until 4 and 5 years of data were removed (Figures \ref{fig:retro-ssb} and \ref{fig:retro-depl}). Removing this amount of data resulted in a downward shift in stock scale and status.

<!--chapter:end:34diagnostics.Rmd-->

# Management 

## Harvest Projections and Decision Tables

A ten year projection of the base model with catches equal to the estimated Acceptable Biological Catch (ABC) based on the category 2 time-varying and $P^*$ = 0.45 for years 2023-2032 with all removals allocated to the recreational fleet (Table \ref{tab:project}). The removals in 2021 and 2022 were set based on the adopted Annual Catch Limits (ACLs) and the percent allocation (26 percent) for Washington state provided by the PFMC Groundfish Management Team (GMT, personal communication). 

The decision table uncertainty axes and catch levels to be determined later.

## Evaluation of Scientific Uncertainty


The estimated uncertainty in the base model around the 2021 spawning output is $\sigma$ = 0.1 and the uncertainty in the base model around the 2021 OFL is $\sigma$ = 0.09. The estimated model uncertainty was less than the category 2 groundfish data moderate assessment default value of  $\sigma$ = 1.0. 

## Research and Data Needs

The ability to estimate additional process and biological parameters for copper rockfish was limited by data.  Collecting the following data would be beneficial to future assessments of the stock:

\begin{itemize}

	\item Continue collecting length and otolith samples from recreational catches with an emphasis on increasing annual samples collected.

	\item Collect length data for the commercial fleet if catches occur.

	\item Evaluate the connectivity of copper rockfish stock off the coast of Oregon and Washington. 

\end{itemize}

<!--chapter:end:40management.Rmd-->

# Acknowledgments


Many people were instrumental in the successful completion of this assessment and their contribution is greatly appreciated. We are very grateful to all the agers at WDFW, ODFW, and the CAP lab for their hard work reading numerous otoliths and availability to answer questions when needed. Jason Jannot and Kayleigh Sommers assisted with data from the WCGOP and entertained our many questions. We would like to acknowledge our survey team and their dedication to improving the assessments we do. Peter Frey and John Harms were incredibly helpful in facilitating the understanding of the STAT team as to why and when each of our assessments either encounter or do not copper rockfish along the coast. Melissa Head provided an area specific maturity estimate for copper rockfish and provided insight in the complex biological processes that govern maturity processes.   

All of the data moderate assessment assessments this year were greatly benefited by the numerous individuals who took the time to participate in the pre-assessment data webinar. Gerry Richter, Merit McCrea, Louis Zimm, Bill James, and Daniel Platt were provided insight to the data and the complexities of the commercial and recreational fisheries off the West Coast of the U.S. which were essential in the production of all of the copper rockfish assessments conducted this year. 

\newpage


<!--chapter:end:41acknowledgments.Rmd-->

\clearpage

# References
<!-- If you want to references to appear somewhere before the end, add: -->
<div id="refs"></div>
<!-- where you want it to appear -->
<!-- The following sets the appropriate indentation for the references
  but it cannot be used with bookdown and the make file because it leads
  to a bad pdf.
\noindent
\vspace{-2em}
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\setlength{\parskip}{8pt}
 -->

<!--chapter:end:49bibliography.Rmd-->

\clearpage
# Tables

<!-- ======================================================= -->
<!-- ***************    Catches      *********************** --> 
<!-- ======================================================= -->

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/Catches_All_Years.tex}

\newpage


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{c>{\centering\arraybackslash}p{2cm}>{\centering\arraybackslash}p{2cm}}
\caption{(\#tab:nums-mt)Input numbers of fish removals converted to metric tons (mt) within the model.}\\
\toprule
Year & Numbers of Fish & Metric Tons\\
\midrule
\endfirsthead
\caption[]{(\#tab:nums-mt)Input numbers of fish removals converted to metric tons (mt) within the model. \textit{(continued)}}\\
\toprule
Year & Numbers of Fish & Metric Tons\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
1934 & 0 & 0.00\\
1935 & 10 & 0.02\\
1936 & 32 & 0.05\\
1937 & 53 & 0.09\\
1938 & 75 & 0.12\\
1939 & 96 & 0.15\\
1940 & 118 & 0.19\\
1941 & 139 & 0.22\\
1942 & 161 & 0.26\\
1943 & 182 & 0.29\\
1944 & 204 & 0.33\\
1945 & 225 & 0.36\\
1946 & 246 & 0.39\\
1947 & 268 & 0.43\\
1948 & 289 & 0.46\\
1949 & 311 & 0.50\\
1950 & 332 & 0.53\\
1951 & 354 & 0.56\\
1952 & 375 & 0.60\\
1953 & 397 & 0.63\\
1954 & 418 & 0.67\\
1955 & 440 & 0.70\\
1956 & 461 & 0.73\\
1957 & 482 & 0.76\\
1958 & 504 & 0.80\\
1959 & 525 & 0.83\\
1960 & 547 & 0.87\\
1961 & 568 & 0.90\\
1962 & 590 & 0.93\\
1963 & 611 & 0.96\\
1964 & 633 & 1.00\\
1965 & 654 & 1.03\\
1966 & 676 & 1.06\\
1967 & 696 & 1.09\\
1968 & 718 & 1.12\\
1969 & 740 & 1.16\\
1970 & 761 & 1.19\\
1971 & 783 & 1.22\\
1972 & 804 & 1.25\\
1973 & 826 & 1.29\\
1974 & 847 & 1.32\\
1975 & 868 & 1.35\\
1976 & 628 & 0.97\\
1977 & 387 & 0.60\\
1978 & 719 & 1.11\\
1979 & 957 & 1.48\\
1980 & 563 & 0.87\\
1981 & 1253 & 1.94\\
1982 & 1317 & 2.03\\
1983 & 805 & 1.24\\
1984 & 1280 & 1.97\\
1985 & 1105 & 1.70\\
1986 & 1335 & 2.04\\
1987 & 1608 & 2.45\\
1988 & 1506 & 2.29\\
1989 & 1534 & 2.32\\
1990 & 1966 & 2.96\\
1991 & 1449 & 2.17\\
1992 & 2359 & 3.51\\
1993 & 1850 & 2.74\\
1994 & 1296 & 1.91\\
1995 & 1675 & 2.46\\
1996 & 1948 & 2.85\\
1997 & 1853 & 2.70\\
1998 & 1897 & 2.76\\
1999 & 1932 & 2.80\\
2000 & 2027 & 2.92\\
2001 & 2053 & 2.95\\
2002 & 1327 & 1.90\\
2003 & 1573 & 2.25\\
2004 & 1551 & 2.21\\
2005 & 4359 & 6.19\\
2006 & 2038 & 2.87\\
2007 & 2066 & 2.89\\
2008 & 2183 & 3.03\\
2009 & 1972 & 2.72\\
2010 & 1544 & 2.13\\
2011 & 1916 & 2.64\\
2012 & 1277 & 1.76\\
2013 & 1858 & 2.56\\
2014 & 1699 & 2.34\\
2015 & 955 & 1.32\\
2016 & 1339 & 1.86\\
2017 & 932 & 1.30\\
2018 & 2173 & 3.03\\
2019 & 3073 & 4.28\\
2020 & 1115 & 1.55\\*
\end{longtable}
\endgroup{}
\endgroup{}
\newpage


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}}
\caption{(\#tab:ofl)The OFL and ACL for north nearshore, the ACL allocated to Washington, and the total removals.}\\
\toprule
Year & OFL & ACL & WA ACL & WA Removals\\
\midrule
\endfirsthead
\caption[]{(\#tab:ofl)The OFL and ACL for north nearshore, the ACL allocated to Washington, and the total removals. \textit{(continued)}}\\
\toprule
Year & OFL & ACL & WA ACL & WA Removals\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2011 & 28.61 & 23.88 & 6.21 & 2.64\\
2012 & 28.61 & 23.88 & 6.21 & 1.76\\
2013 & 25.96 & 21.65 & 5.63 & 2.56\\
2014 & 25.96 & 21.65 & 5.63 & 2.34\\
2015 & 10.64 & 9.71 & 2.52 & 1.32\\
2016 & 10.33 & 9.43 & 2.45 & 1.86\\
2017 & 11.24 & 10.26 & 2.67 & 1.30\\
2018 & 11.59 & 10.58 & 2.75 & 3.03\\
2019 & 11.91 & 10.88 & 2.83 & 4.28\\
2020 & 12.24 & 11.18 & 2.91 & 1.55\\*
\end{longtable}
\endgroup{}
\endgroup{}

\newpage

<!-- ======================================================= -->
<!-- ***************       Data      *********************** --> 
<!-- ======================================================= -->


\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/wa_samples.tex}

\newpage



<!-- ======================================================= -->
<!-- ***************    Biology      *********************** --> 
<!-- ======================================================= -->

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/len_at_age_data.tex}

\newpage


\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}>{\raggedright\arraybackslash}p{2.2cm}}
\caption{(\#tab:growth-tab)Age, length, weight, maturity, and spawning output by age (product of maturity and fecundity) at the start of the year for female fish.}\\
\toprule
Age & Length (cm) & Weight (kg) & Maturity & Spawning Output\\
\midrule
\endfirsthead
\caption[]{(\#tab:growth-tab)Age, length, weight, maturity, and spawning output by age (product of maturity and fecundity) at the start of the year for female fish. \textit{(continued)}}\\
\toprule
Age & Length (cm) & Weight (kg) & Maturity & Spawning Output\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
0 & 4.00 & 0.00 & 0.00 & 0.00\\
1 & 13.46 & 0.04 & 0.00 & 0.00\\
2 & 19.97 & 0.14 & 0.00 & 0.00\\
3 & 25.27 & 0.30 & 0.01 & 0.00\\
4 & 29.58 & 0.49 & 0.11 & 0.01\\
5 & 33.09 & 0.70 & 0.35 & 0.06\\
6 & 35.95 & 0.91 & 0.60 & 0.13\\
7 & 38.27 & 1.11 & 0.76 & 0.20\\
8 & 40.16 & 1.29 & 0.86 & 0.26\\
9 & 41.70 & 1.46 & 0.91 & 0.31\\
10 & 42.95 & 1.60 & 0.94 & 0.35\\
11 & 43.97 & 1.73 & 0.96 & 0.38\\
12 & 44.80 & 1.83 & 0.97 & 0.41\\
13 & 45.48 & 1.92 & 0.97 & 0.44\\
14 & 46.03 & 2.00 & 0.98 & 0.46\\
15 & 46.47 & 2.06 & 0.98 & 0.48\\
16 & 46.84 & 2.11 & 0.98 & 0.49\\
17 & 47.13 & 2.15 & 0.99 & 0.50\\
18 & 47.38 & 2.19 & 0.99 & 0.51\\
19 & 47.57 & 2.22 & 0.99 & 0.52\\
20 & 47.73 & 2.24 & 0.99 & 0.53\\
21 & 47.86 & 2.26 & 0.99 & 0.53\\
22 & 47.97 & 2.28 & 0.99 & 0.54\\
23 & 48.05 & 2.29 & 0.99 & 0.54\\
24 & 48.12 & 2.30 & 0.99 & 0.54\\
25 & 48.18 & 2.31 & 0.99 & 0.54\\
26 & 48.23 & 2.31 & 0.99 & 0.55\\
27 & 48.26 & 2.32 & 1.00 & 0.55\\
28 & 48.30 & 2.32 & 1.00 & 0.55\\
29 & 48.32 & 2.33 & 1.00 & 0.55\\
30 & 48.34 & 2.33 & 1.00 & 0.55\\
31 & 48.36 & 2.33 & 1.00 & 0.55\\
32 & 48.37 & 2.34 & 1.00 & 0.55\\
33 & 48.38 & 2.34 & 1.00 & 0.55\\
34 & 48.39 & 2.34 & 1.00 & 0.55\\
35 & 48.40 & 2.34 & 1.00 & 0.55\\
36 & 48.40 & 2.34 & 1.00 & 0.55\\
37 & 48.41 & 2.34 & 1.00 & 0.55\\
38 & 48.41 & 2.34 & 1.00 & 0.55\\
39 & 48.42 & 2.34 & 1.00 & 0.55\\
40 & 48.42 & 2.34 & 1.00 & 0.55\\
41 & 48.42 & 2.34 & 1.00 & 0.55\\
42 & 48.42 & 2.34 & 1.00 & 0.55\\
43 & 48.42 & 2.34 & 1.00 & 0.55\\
44 & 48.42 & 2.34 & 1.00 & 0.55\\
45 & 48.43 & 2.34 & 1.00 & 0.55\\
46 & 48.43 & 2.34 & 1.00 & 0.55\\
47 & 48.43 & 2.34 & 1.00 & 0.55\\
48 & 48.43 & 2.34 & 1.00 & 0.56\\
49 & 48.43 & 2.34 & 1.00 & 0.56\\
50 & 48.43 & 2.34 & 1.00 & 0.56\\*
\end{longtable}
\endgroup{}
\endgroup{}

\newpage

<!-- ======================================================= -->
<!-- ***********   Model Parameters     ******************** --> 
<!-- ======================================================= -->


\begingroup\fontsize{9}{11}\selectfont

\begin{landscape}\begingroup\fontsize{9}{11}\selectfont

\begin{longtable}[t]{>{\raggedright\arraybackslash}p{6cm}lllll>{\raggedright\arraybackslash}p{4cm}}
\caption{(\#tab:params)List of parameters used in the base model, including estimated values and standard deviations (SD), bounds (minimum and maximum), estimation phase (negative values not estimated), status (indicates if parameters are near bounds), and prior type information (mean and SD).}\\
\toprule
Parameter & Value & Phase & Bounds & Status & SD & Prior (Exp.Val, SD)\\
\midrule
\endfirsthead
\caption[]{(\#tab:params)List of parameters used in the base model, including estimated values and standard deviations (SD), bounds (minimum and maximum), estimation phase (negative values not estimated), status (indicates if parameters are near bounds), and prior type information (mean and SD). \textit{(continued)}}\\
\toprule
Parameter & Value & Phase & Bounds & Status & SD & Prior (Exp.Val, SD)\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
NatM p 1 Fem GP 1 & 0.108 & -2 & (0.05, 0.4) & NA & NA & Log Norm (-2.2256, 0.48)\\
L at Amin Fem GP 1 & 13.460 & -2 & (3, 25) & NA & NA & None\\
L at Amax Fem GP 1 & 48.430 & -2 & (35, 60) & NA & NA & None\\
VonBert K Fem GP 1 & 0.206 & -2 & (0.03, 0.3) & NA & NA & None\\
CV young Fem GP 1 & 0.100 & -2 & (0.01, 0.3) & NA & NA & None\\
CV old Fem GP 1 & 0.100 & -2 & (0.01, 0.3) & NA & NA & None\\
Wtlen 1 Fem GP 1 & 0.000 & -9 & (0, 0.1) & NA & NA & None\\
Wtlen 2 Fem GP 1 & 3.190 & -9 & (2, 4) & NA & NA & None\\
Mat50% Fem GP 1 & 34.830 & -9 & (10, 60) & NA & NA & None\\
Mat slope Fem GP 1 & -0.600 & -9 & (-1, 0) & NA & NA & None\\
Eggs scalar Fem GP 1 & 0.000 & -9 & (-3, 3) & NA & NA & None\\
Eggs exp len Fem GP 1 & 3.679 & -9 & (-3, 3) & NA & NA & None\\
NatM p 1 Mal GP 1 & 0.108 & -2 & (0.05, 0.4) & NA & NA & Log Norm (-2.2256, 0.48)\\
L at Amin Mal GP 1 & 8.500 & -2 & (3, 25) & NA & NA & None\\
L at Amax Mal GP 1 & 47.240 & -2 & (35, 60) & NA & NA & None\\
VonBert K Mal GP 1 & 0.231 & -2 & (0.03, 0.3) & NA & NA & None\\
CV young Mal GP 1 & 0.100 & -2 & (0.01, 0.3) & NA & NA & None\\
CV old Mal GP 1 & 0.100 & -2 & (0.01, 0.3) & NA & NA & None\\
Wtlen 1 Mal GP 1 & 0.000 & -9 & (0, 0.1) & NA & NA & None\\
Wtlen 2 Mal GP 1 & 3.150 & -9 & (2, 4) & NA & NA & None\\
FracFemale GP 1 & 0.500 & -9 & (0.01, 0.99) & NA & NA & None\\
SR LN(R0) & 2.033 & 1 & (1, 20) & OK & 0.0390705 & None\\
SR BH steep & 0.720 & -7 & (0.22, 1) & NA & NA & Normal (0.72, 0.09)\\
SR sigmaR & 0.900 & -99 & (0.15, 1) & NA & NA & None\\
SR regime & 0.000 & -99 & (-2, 2) & NA & NA & None\\
SR autocorr & 0.000 & -99 & (0, 0) & NA & NA & None\\
Size DblN peak WA Recreational(1) & 36.950 & 1 & (15, 50) & OK & 0.4347850 & None\\
Size DblN top logit WA Recreational(1) & -0.505 & -2 & (-7, 7) & NA & NA & None\\
Size DblN ascend se WA Recreational(1) & 3.653 & 3 & (-10, 10) & OK & 0.1059820 & None\\
Size DblN descend se WA Recreational(1) & -0.413 & -4 & (-10, 10) & NA & NA & None\\
Size DblN start logit WA Recreational(1) & -20.000 & -9 & (-20, 30) & NA & NA & None\\
Size DblN end logit WA Recreational(1) & 10.000 & -3 & (-10, 10) & NA & NA & None\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}

\newpage

<!-- ======================================================= -->
<!-- ***********       Likelihood       ******************** --> 
<!-- ======================================================= -->

\include{tex_tables/likelihoods.tex}



<!-- ======================================================= -->
<!-- ***********       Time Series      ******************** --> 
<!-- ======================================================= -->

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/TimeSeries.tex}

\newpage

<!-- ======================================================= -->
<!-- ****************     Sensitivities      *************** --> 
<!-- ======================================================= -->

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{2cm}}
\caption{(\#tab:dw)Data weights applied by each alternative data weighting methods.}\\
\toprule
Method & Recreational Lengths\\
\midrule
\endfirsthead
\caption[]{(\#tab:dw)Data weights applied by each alternative data weighting methods. \textit{(continued)}}\\
\toprule
Method & Recreational Lengths\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
Francis & 0.064\\
McAllister-Ianelli & 0.163\\
Dirichlet Multinomial & 0.360\\*
\end{longtable}
\endgroup{}
\endgroup{}

\newpage

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/sensitivities.tex}

\newpage



<!-- ======================================================= -->
<!-- ****************         SSS            *************** --> 
<!-- ======================================================= -->

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/sss_60.tex}

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/sss_40.tex}

\newpage

<!-- ======================================================= -->
<!-- ********  Reference Points & Management *************** --> 
<!-- ======================================================= -->

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/e_ReferencePoints_ES.tex}

\newpage



\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.22cm}>{\raggedright\arraybackslash}p{1.22cm}>{\raggedright\arraybackslash}p{1.22cm}>{\raggedright\arraybackslash}p{1.22cm}>{\raggedright\arraybackslash}p{1.22cm}>{\raggedright\arraybackslash}p{1.22cm}>{\raggedright\arraybackslash}p{1.22cm}>{\raggedright\arraybackslash}p{1.22cm}}
\caption{(\#tab:project)Projections of potential OFLs (mt), ABCs (mt), estimated spawning output, and fraction unfished. The OFL, ACL, and Washington (WA) ACL for 2021 and 2022 reflect adopted management limits.}\\
\toprule
Year & Adopted OFL & Adopted ACL & ACL-WA & OFL & ABC & Buffer & Spawning Output & Fraction Unfished\\
\midrule
\endfirsthead
\caption[]{(\#tab:project)Projections of potential OFLs (mt), ABCs (mt), estimated spawning output, and fraction unfished. The OFL, ACL, and Washington (WA) ACL for 2021 and 2022 reflect adopted management limits. \textit{(continued)}}\\
\toprule
Year & Adopted OFL & Adopted ACL & ACL-WA & OFL & ABC & Buffer & Spawning Output & Fraction Unfished\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2021 & 9.83 & 8.11 & 2.11 & - & - & - & 3.20 & 0.42\\
2022 & 9.86 & 8.06 & 2.1 & - & - & - & 3.22 & 0.42\\
2023 & - & - & - & 2.15 & 1.88 & 0.876 & 3.25 & 0.42\\
2024 & - & - & - & 2.18 & 1.89 & 0.867 & 3.29 & 0.43\\
2025 & - & - & - & 2.2 & 1.89 & 0.858 & 3.34 & 0.44\\
2026 & - & - & - & 2.23 & 1.89 & 0.85 & 3.39 & 0.44\\
2027 & - & - & - & 2.25 & 1.9 & 0.842 & 3.43 & 0.45\\
2028 & - & - & - & 2.28 & 1.9 & 0.834 & 3.47 & 0.45\\
2029 & - & - & - & 2.3 & 1.9 & 0.826 & 3.51 & 0.46\\
2030 & - & - & - & 2.32 & 1.9 & 0.818 & 3.54 & 0.46\\
2031 & - & - & - & 2.34 & 1.89 & 0.81 & 3.58 & 0.47\\
2032 & - & - & - & 2.36 & 1.89 & 0.803 & 3.61 & 0.47\\*
\end{longtable}
\endgroup{}
\endgroup{}

\newpage



<!--chapter:end:52tables.Rmd-->

\clearpage
# Figures


<!-- ====================================================================== -->  
<!-- ****************** Catches Used in the Model ************************* --> 
<!-- ====================================================================== -->  

![Catches by year for the recreational and commercial fleets in the model.\label{fig:catch}](figs/catches_wa.png){width=100% height=100% alt="Catches by year for the recreational and commercial fleets in the model"}



<!-- ====================================================================== --> 
<!-- ******************* Data Used in the Model *************************** --> 
<!-- ====================================================================== --> 


![Summary of data sources used in the base model.\label{fig:data-plot}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/data_plot.png){width=100% height=100% alt="Summary of data sources used in the base model."}


<!-- ====================================================================== -->
<!-- ****************   Commercial Length Samples    ********************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- **************** Recreational Length Samples    ********************** --> 
<!-- ====================================================================== -->


![Length composition data from the recreational fleet.\label{fig:wa-len-data}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lendat_bubflt1mkt0_page2.png){width=100% height=100% alt="Length composition data from the recreational fleet."}



![Aggregated length composition data across all years from the recreational fleet.\label{fig:wa-len-agg}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lendat__aggregated_across_time.png){width=100% height=100% alt="Aggregated length composition data across all years from the recreational fleet."}


![Mean length for recreational fleet with 95 percent confidence intervals.\label{fig:mean-len-data}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lendat_data_weighting_TA1.8_WA_Recreational.png){width=100% height=100% alt="Mean length for recreational fleet with 95 percent confidence intervals."}


<!-- ====================================================================== -->
<!-- *************************     Biology     **************************** --> 
<!-- ====================================================================== -->


![Comparison of the length-at-weight data from the NWFSC Hook and Line and the NWFSC WCGBT surveys.\label{fig:len-weight-survey}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Weight_Source.png){width=100% height=100% alt="Comparison of the length-at-weight data from the NWFSC Hook and Line and the NWFSC WCGBT surveys."}


![Weight-at-length by sex used in the model.\label{fig:len-weight}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/bio5_weightatsize.png){width=100% height=100% alt="Weight-at-length by sex used in the model."}



![Observed sex specific length-at-age by data source with the estimate length-at-age curve.\label{fig:len-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_north_Age_by_Sex_Source.png){width=100% height=100% alt="Observed sex specific length-at-age by data source with the estimate length-at-age curve."}



![Length at age in the beginning of the year in the ending year of the model.\label{fig:len-age-ss}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/bio1_sizeatage.png){width=100% height=100% alt="Length at age in the beginning of the year in the ending year of the model."}


![Maturity as a function of  length.\label{fig:maturity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/bio6_maturity.png){width=100% height=100% alt="Maturity as a function of  length."}


![Fecundity as a function of length.\label{fig:fecundity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/bio9_fecundity_len.png){width=100% height=100% alt="Fecundity as a function of length."}


![Fraction female by length across all available data sources.\label{fig:len-sex-ratio}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/Length_fraction_female.png){width=100% height=100% alt="Fraction female by length across all available data sources."}


![Fraction female by age across all available data sources.\label{fig:age-sex-ratio}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/Age_fraction_female.png){width=100% height=100% alt="Fraction female by age across all available data sources."}

<!-- ====================================================================== -->
<!-- *********************    Selectivity            ********************** --> 
<!-- ====================================================================== -->


![Selectivity at length by fleet.\label{fig:selex}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/sel01_multiple_fleets_length1.png){width=100% height=100% alt="Selectivity at length by fleet."}


<!-- ====================================================================== -->
<!-- ****************** Fit to the Length Data **************************** --> 
<!-- ====================================================================== -->



![Pearson residuals for recreational fleet. Closed bubble are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:rec-pearson}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lenfit_residsflt1mkt0_page2.png){width=100% height=100% alt="Pearson residuals for recreational fleet. Closed bubble are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Mean length for recreational with 95 percent confidence intervals based on current samples sizes.\label{fig:rec-mean-len-fit}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lenfit_data_weighting_TA1.8_WA_Recreational.png){width=100% height=100% alt="Mean length for recreational with 95 percent confidence intervals based on current samples sizes."}


![Aggregated length comps over all years.\label{fig:agg-len-fit}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lenfit__aggregated_across_time.png){width=100% height=100% alt="Aggregated length comps over all years."}

<!-- ====================================================================== -->
<!-- ******************      Time Series       **************************** --> 
<!-- ====================================================================== -->


![Estimated time series of spawning output.\label{fig:ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/ts7_Spawning_output_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="Estimated time series of spawning output."}


![Estimated time series of total biomass.\label{fig:tot-bio}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/ts1_Total_biomass_(mt).png){width=100% height=100% alt="Estimated time series of total biomass."}


![Estimated time series of fraction of unfished spawning output.\label{fig:depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/ts9_Fraction_of_unfished_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="Estimated time series of fraction of unfished spawning output."}


![Stock-recruit curve. Point colors indicate year, with warmer colors indicating earlier years and cooler colors in showing later years.\label{fig:bh-curve}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/SR_curve.png){width=100% height=100% alt="Stock-recruit curve. Point colors indicate year, with warmer colors indicating earlier years and cooler colors in showing later years."}


![Estimated time series of age-0 recruits (1000s).\label{fig:recruits}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/ts11_Age-0_recruits_(1000s)_with_95_asymptotic_intervals.png){width=100% height=100% alt="Estimated time series of age-0 recruits (1000s)."}

<!-- ====================================================================== -->
<!-- ******************    Reference Points    **************************** --> 
<!-- ====================================================================== -->



![Estimated 1 - relative spawning ratio (SPR) by year.\label{fig:1-spr}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/SPR2_minusSPRseries.png){width=100% height=100% alt="Estimated 1 - relative spawning ratio (SPR) by year."}


![Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivity and with steepness fixed at 0.72.\label{fig:yield}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/yield2_yield_curve_with_refpoints.png){width=100% height=100% alt="Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivity and with steepness fixed at 0.72."}


<!-- ====================================================================== -->
<!-- ******************       Sensitivity     ***************************** --> 
<!-- ====================================================================== -->


![Change in estimated spawning output by sensitivity.\label{fig:sens-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/_sensitivities/_plots/7.7_base_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Change in estimated spawning output by sensitivity."}


![Change in estimated fraction unfished by sensitivity.\label{fig:sens-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/_sensitivities/_plots/7.7_base_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Change in estimated fraction unfished by sensitivity."}


![Change in estimated annual recruitment deviations by sensitivity.\label{fig:sens-recr}](C:/Assessments/2021/copper_rockfish_2021/models/wa/_sensitivities/_plots/7.7_base_compare12_recdevs_uncertainty.png){width=100% height=100% alt="Change in estimated annual recruitment deviations by sensitivity."}


<!-- ====================================================================== -->
<!-- ******************      Likelihoods      ***************************** --> 
<!-- ====================================================================== -->


![Change in the negative log-likelihood across a range of log(R0) values.\label{fig:r0-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_LN(R0)/piner_panel_SR_LN(R0).png){width=100% height=100% alt="Change in the negative log-likelihood across a range of log(R0) values."}


![Change in the estimate of spawning output across a range of log(R0) values.\label{fig:r0-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_LN(R0)/SR_LN(R0)_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning output across a range of log(R0) values."}


![Change in the estimate of fraction unfished across a range of log(R0) values.\label{fig:r0-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_LN(R0)/SR_LN(R0)_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of log(R0) values."}


![Change in the negative log-likelihood across a range of steepness values.\label{fig:h-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_BH_steep/piner_panel_SR_BH_steep.png){width=100% height=100% alt="Change in the negative log-likelihood across a range of steepness values."}


![Change in the estimate of spawning output across a range of steepness values.\label{fig:h-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_BH_steep/SR_BH_steep_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning output across a range of steepness values."}


![Change in the estimate of fraction unfished across a range of steepness values.\label{fig:h-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_BH_steep/SR_BH_steep_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of steepness values."}


![Change in the negative log-likelihood across a range of female natural mortality values.\label{fig:m-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_NatM_p_1_Fem_GP_1/piner_panel_NatM_p_1_Fem_GP_1.png){width=100% height=100% alt="Change in the negative log-likelihood across a range of female natural mortality values."}


![Change in the estimate of spawning output across a range of female natural mortality values.\label{fig:m-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_NatM_p_1_Fem_GP_1/NatM_p_1_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning output across a range of female natural mortality values."}


![Change in the estimate of fraction unfished across a range of female natural values.\label{fig:m-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_NatM_p_1_Fem_GP_1/NatM_p_1_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of female natural values."}


![Change in the negative log-likelihood across a range of female maximum length values.\label{fig:linf-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_L_at_Amax_Fem_GP_1/piner_panel_L_at_Amax_Fem_GP_1.png){width=100% height=100% alt="Change in the negative log-likelihood across a range of female maximum length values."}


![Change in the estimate of spawning output across a range of female maximum length values.\label{fig:linf-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_L_at_Amax_Fem_GP_1/L_at_Amax_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning output across a range of female maximum length values."}


![Change in the estimate of fraction unfished across a range of female maximum length values.\label{fig:linf-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_L_at_Amax_Fem_GP_1/L_at_Amax_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of female maximum length values."}


![Change in the negative log-likelihood across a range of female k values.\label{fig:k-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_VonBert_K_Fem_GP_1/piner_panel_VonBert_K_Fem_GP_1.png){width=100% height=100% alt="Change in the negative log-likelihood across a range of female k values."}


![Change in the estimate of spawning output across a range of female k values.\label{fig:k-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_VonBert_K_Fem_GP_1/VonBert_K_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning output across a range of female k values."}


![Change in the estimate of fraction unfished across a range of female k values.\label{fig:k-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_VonBert_K_Fem_GP_1/VonBert_K_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of female k values."}

\newpage


<!-- ====================================================================== -->
<!-- ******************       LB-SPR          ***************************** --> 
<!-- ====================================================================== -->


![LB-SPR yearly estimates of selectivity, the ratio of fishing intensity to natural mortality (F/M), and annual spawner-per-recruit (SPR) values.\label{fig:lbspr}](C:/Assessments/2021/copper_rockfish_2021/models/lbspr/Copper_WA_LBSPR_newVBGF_plots.png){width=100% height=100% alt="LB-SPR yearly estimates of selectivity, the ratio of fishing intensity to natural mortality (F/M), and annual spawner-per-recruit (SPR) values."}

\newpage

<!-- ====================================================================== -->
<!-- ******************         SSS           ***************************** --> 
<!-- ====================================================================== -->



![Prior distributions for parameter input for SSS.\label{fig:sss-prior-60}](C:/Assessments/2021/copper_rockfish_2021/models/sss/plots/wa_7.7_base_depl_60_Priors.png){width=100% height=100% alt="Prior distributions for parameter input for SSS."}

\newpage


![Derived quantities from SSS run where fraction unfished was assumed to be 60 percent.\label{fig:sss-quant-60}](C:/Assessments/2021/copper_rockfish_2021/models/sss/plots/wa_7.7_base_depl_60_quants.png){width=100% height=100% alt="Derived quantities from SSS run where fraction unfished was assumed to be 60 percent."}

\newpage


![Prior distributions for parameter input for SSS.\label{fig:sss-prior-40}](C:/Assessments/2021/copper_rockfish_2021/models/sss/plots/wa_7.7_base_depl_40_Priors.png){width=100% height=100% alt="Prior distributions for parameter input for SSS."}

\newpage



![Derived quantities from SSS run where fraction unfished was assumed to be 40 percent.\label{fig:sss-quant-40}](C:/Assessments/2021/copper_rockfish_2021/models/sss/plots/wa_7.7_base_depl_40_quants.png){width=100% height=100% alt="Derived quantities from SSS run where fraction unfished was assumed to be 40 percent."}

\newpage


<!-- ====================================================================== -->
<!-- ******************     Retrospectives    ***************************** --> 
<!-- ====================================================================== -->


![Change in the estimate of spawning output when the most recent 5 years of data area removed sequentially.\label{fig:retro-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_retro/compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Change in the estimate of spawning output when the most recent 5 years of data area removed sequentially."}


![Change in the estimate of fraction unfished when the most recent 5 years of data area removed sequentially.\label{fig:retro-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_retro/compare4_Bratio_uncertainty.png){width=100% height=100% alt="Change in the estimate of fraction unfished when the most recent 5 years of data area removed sequentially."}

\newpage

<!--chapter:end:53figures.Rmd-->

\clearpage
# Appendix A. Detailed Fit to Length Composition Data 



![Length comps, whole catch, WA_Recreational (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_lenfit_flt1mkt0_page1}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lenfit_flt1mkt0_page1.png){width=100% height=100% alt="Length comps, whole catch, WA_Recreational (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Length comps, whole catch, WA_Recreational (plot 2 of 2).\label{fig:comp_lenfit_flt1mkt0_page2}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lenfit_flt1mkt0_page2.png){width=100% height=100% alt="Length comps, whole catch, WA_Recreational (plot 2 of 2)."}

<!--chapter:end:54appendix.Rmd-->

