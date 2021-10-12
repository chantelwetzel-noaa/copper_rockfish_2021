---
geometry: margin=1in
month: "October"
year: "2021"
preamble: |
csl: sa4ss.csl
output: 
  sa4ss::techreport_pdf:
    default
  bookdown::pdf_document2:
    keep_tex: true
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


\pagenumbering{roman}
\setcounter{page}{1}

\renewcommand{\thetable}{\roman{table}}
\renewcommand{\thefigure}{\roman{figure}}


\setlength\parskip{0.5em plus 0.1em minus 0.2em}


\vspace{500cm}

<!--

# Disclaimer{-}

_**These materials do not constitute a formal publication and are for information only. They are in a pre-review, pre-decisional state and should not be formally cited or reproduced. They are to be considered provisional and do not represent any determination or policy of NOAA or the Department of Commerce.**_

-->

\pagebreak

<!--chapter:end:01a.Rmd-->



<!--chapter:end:01executive.Rmd-->



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


 
Copper rockfish is a medium- to large-sized nearshore rockfish found from Mexico to Alaska.  The core range is comparatively large, from northern Baja Mexico to the Gulf of Alaska, as well as in Puget Sound.   Copper rockfish have historically been a part of both commercial and recreational fisheries throughout its range. 

Copper rockfish are commonly found in waters less than 130 meters in depth in nearshore kelp forests and rocky habitat [@love_milton_probably_1996]. The diets of copper rockfish consist primarily of crustaceans, mollusks, and fish [@lea_biological_1999; @bizzarro_diet_2017-1]. The body coloring of copper rockfish varies across the West Coast with northern fish often exhibiting dark brown to olive  with southern fish exhibiting yellow to olive-pink variations in color [@miller_guide_1972], which initially led to them being designated as two separate species (*S. caurinus* and *S. vexillaris*). 

Numerous genetic studies have been performed looking for genetic variation in copper rockfish, with variable outcomes. Genetic work has revealed significant differences between Puget Sound and coastal stocks [@dick_replicate_2014]. Stocks along the West Coast have not been determined to be genetically distinct populations, but significant population subdivision has been detected, indicating limited oceanographic exchange among geographically proximate locations [@buonaccorsi_population_2002; @johansson_influence_2008]. A specific study examining copper rockfish populations off the coast of Santa Barbara and Monterey California identified a genetic break between the north and south, with moderate differentiation [@sivasundar_life_2010]. 

Copper rockfish are a relatively long-lived rockfish, estimated to live at least 50 years [@love_milton_probably_1996]. Copper rockfish was determined to have the highest vulnerability (V = 2.27) of any West Coast groundfish stock evaluated in a productivity susceptibility analysis [@cope_approach_2011]. This analysis calculated species-specific vulnerability scores based on two dimensions: productivity characterized by the life history and susceptibility that characterized how the stock could be impacted by fisheries and other activities. 

## Historical and Current Fishery Information

Off the coast of Washington State copper rockfish is primarily caught in the recreational/sport fishery with very little mortality from commercial fishing (Table \ref{tab:allcatches} and Figure \ref{fig:catch}). Copper rockfish has been a target of recreational fishing starting as early as 1935, with catches stabilizing around 2,500 - 3,000 fish per year starting around 1980, with the exception of select years with high (2005) or low catches (2015). 

Copper rockfish has not been targeted by commercial fisheries in Washington waters. Washington banned commercial fixed gears in 1995 and trawl gear in 1999 in state waters, which encompass the vast majority of depths preferred by copper rockfish.  In response to the development of the live-fish fishery in California and Oregon, Washington took preemptive action in 1999 to prevent the fishery from developing by prohibiting the landing of live-fish. There are four treaty tribes that fish under separate rules and are not subject to the state water closure.  Copper rockfish are usually landed in the Nearshore Rockfish group, a mixed-species market category. Species composition samples were taken from sampled landings, and proportions of copper rockfish reported in the Nearshore market category are estimated by port, quarter, gear, and year. In 2020, COVID-19 closures of tribal lands prevented samplers from accessing all commercial catch, so an average proportion of copper rockfish in 2017 - 2019 was applied to all associated tribal landings. 

The primary region of recreational fishing off the Washington coast occurs in the central to northern regions. These areas have rocky habitat within which rockfish species such as copper rockfish are associated, whereas to the southern coast of Washington consists primarily of soft and sandy substrate.  The stock off the Washington coast was assessed as a separate stock (Figure \ref{fig:map}) from other populations off the West Coast based on three factors: 1) suspected limited movement of adult fish between Washington and Oregon given the preferred substrate separation, 2) the different exploitation patterns within Washington waters compared to Oregon and California, and 3) the quantity of length data in Washington compared to other areas.  

Analysis  that summarized current research to inform stock structure in copper rockfish off the West Coast and evaluated the available information to guide the selection of the management area relative to the assessment area is presented in Wetzel et al. [-@wetzel_status_2021].  


## Summary of Management History and Performance


Copper rockfish is managed by the Pacific Fishery Management Council (PFMC) as a part of the Nearshore Rockfish North and Nearshore Rockfish South complexes, split at 40$^\circ$ 10' N. lat. off the West Coast. Each complex, comprised of nearshore rockfish species, is managed based on a complex level overfishing limit (OFL) and annual catch limit (ACL) that are determined by summing the species-specific OFLs and ACLs (ACLs set equal to the Acceptable Biological Catches) contributions for all stocks managed in the complex (North or South). Removals for species within the Nearshore Rockfish North and South complexes are managed and tracked against the complex total OFL and ACL, rather than on a species by species basis.

Table \ref{tab:ofl} show the Nearshore Rockfish North complex level OFLs and ACLs, the copper rockfish OFL and ACL contribution amounts, the state-specific allocations (26 percent for Washington, Groundfish Management Team, personal communication) applied to the copper rockfish ACL contribution, and the total removals in Washington. 


<!--chapter:end:11introduction.Rmd-->

# Data

A description of each data source is provided below (Figure \ref{fig:data-plot}).

<!--chapter:end:20data.Rmd-->

## Fishery-Dependent Data


### Commercial Data

There are very limited commercial fishery removals of copper rockfish off the Washington coast (Table \ref{tab:allcatches} and Figure \ref{fig:catch}). Across all model years there were less than 2 mt removed by the commercial fishery. The commercial catches were provided directly by Washington Department of Fish and Wildlife (WDFW). Given the limited observed removals by the commercial fleet, the historical discards (discards prior to 2002) were assumed to be nominal and were not accounted for in the model. In recent years, 2002-2019, the coastwide discards observed by the West Coast Groundfish Observer Program (WCGOP) were attributed to each state based on the proportion of commercial removals by state.  The commercial discards allocated to Washington were relatively minor (less than 0.02 mt total since 2002).  There were no length data available for copper rockfish in Pacific Fisheries Information Network (PacFIN) for use in this assessment.  


### Recreational / Sport Data

Recreational removals in the model begin in 1935 and are the primary source of fishing mortality for copper rockfish (Figure \ref{fig:catch}). Removals were specified in numbers of fish (1,000s) and were converted to metric tons internally to the model  (Table \ref{tab:nums-mt}). Annual catches (in numbers) from the recreational fishery (1967, 1975-1980) were obtained from historical reports, and landings from 1990-2020 were obtained from WDFW Ocean Sampling Program (OSP) and Puget Sound Baseline Sampling Program (Puget Sound copper rockfish samples not included in the data). To fill in the missing years, linear interpolations were used to find landed values between 1968 and 1974, and to bring catch down to zero in year 1934. Discard estimates are not available prior to 2002. Historical discards were estimated based on a discard to retained catch relationship from 2002 - 2020. Discard mortality by depth was applied to post-2001 discards estimate. Prior to 2002, a 31 percent mortality rate is applied to all discarded fish. The sum of retained and dead released copper rockfish made up the total removal (in numbers) from the recreational fishery. The recreational removals generally increased over time, spiked in 2005 to an all-time high, and since have been roughly between 1,000 and 3,000 fish per year. 

Length compositions for the recreational fleet were available in 1979, 1981, 1982, 1983, and then each year from 1995 - 2020 (Table \ref{tab:len-samps}). The number of length observations by year were quite variable ranging between 3 - 463 samples per year (Figure \ref{fig:wa-len-data}). The size of sexed and unsexed fish observed by the recreational fleet were primarily between 30 - 45 cm (Figure \ref{fig:wa-len-agg}).  The mean length observed by year had limited variation with year with a marginally smaller mean length between 35 - 40 cm until 2010 after which the mean length increased slightly to range around 40 cm (Figure \ref{fig:mean-len-data}).     





<!--chapter:end:21f-.Rmd-->

## Fishery-Independent Data

There were no fishery-independent data sources that are commonly incorporated in West Coast groundfish stock assessments, as required by the Terms of Reference for Stock Synthesis catch and length (SS-CL) assessments, available for copper rockfish off the Washington coast.

<!--chapter:end:21s-.Rmd-->

## Biological Data

### Natural Mortality


The current method for developing a prior on natural mortality for West Coast groundfish stock assessments is based on Hamel [-@hamel_method_2015], a method for combining meta-analytic approaches relating the $M$ rate to other life-history parameters such as longevity, size, growth rate, and reproductive effort to provide a prior for $M$. This approach modifies work done by Then et al. [-@then_evaluating_2015] who estimated $M$ and related life history parameters across a large number of fish species from which to develop an $M$ estimator for fish species in general. They concluded by recommending $M$ estimates be based on maximum age alone, based on an updated Hoenig non-linear least squares estimator $M = 4.899A^{-0.916}_{\text{max}}$. Hamel (personal communication) re-evaluated the data used by Then et al. [-@then_evaluating_2015] by fitting the one-parameter $A_{\text{max}}$ model under a log-log transformation (such that the slope is forced to be -1 in the transformed space [@hamel_method_2015], the point estimate and median of the prior for $M$ is:

\begin{centering}

$M=\frac{5.4}{A_{\text{max}}}$

\end{centering}

\vspace{0.5cm}

where $A_{\text{max}}$ is the maximum age. The prior is defined as a lognormal distribution with mean $ln(5.4/A_{\text{max}})$ and standard error = 0.438. Using a maximum age of 50, the point estimate and median of the prior is 0.108 yr^-1^.  The maximum age was selected based on available age data from all West Coast data sources and literature values.  The oldest aged copper rockfish was 51 years with two observations, one each off of the coast of Washington and Oregon in 2019.  The maximum age in the model was set at 50 years.  This selection was consistent with the literature examining the longevity of  copper rockfish [@love_milton_probably_1996] and was supported by the observed ages that had multiple observations of fish between 44 and 51 years of age.  

### Length-Weight Relationship


The length-weight relationship for copper rockfish was estimated outside the model using all coastwide biological data available from fishery-independent data from the \gls{s-wcgbt} and the NWFSC Hook and Line survey (Figure \ref{fig:len-weight-survey}). The estimated length-weight relationship for female fish was W = 9.56e-06$L$^3.19^ and males 1.08e-05$L$^3.15^ where $L$ is length in cm and W is weight in kilograms (Figure \ref{fig:len-weight}).

### Growth (Length-at-Age)


Length-at-age was estimated for male and female copper rockfish using data collected from fishery-dependent data sources off the coasts of Oregon and Washington, collected between 1998-2019 (Table \ref{tab:len-at-age-samps}).  The available fishery-dependent data from Oregon and Washington included limited observations of young fish (less than 4 years of age), which presented challenges for estimating growth. Attempting to estimate growth in the absence of data to inform the rate of growth ($k$) and the size-at-age 0 ($t_0$) could result in biased estimates of all parameters including the size-at-maximum length ($L_{\infty}$). A published growth study for copper rockfish by Lea et al. [-@lea_biological_1999] had numerous observations of young fish and also reported the mean length, the number of observations, and the standard deviation of the length observations by age. These pieces of information were used to simulate length-at-age data that would be representative of the study's data for fish younger than 5 years of age. The simulated data for young fish appeared consistent with the data for older fish observed off the Oregon and Washington coast (Figure \ref{fig:len-age-data}). This combined data set was used to estimate growth curves for male and female copper rockfish that were used in this assessment.  Ideally, growth would be estimated using data collected from similar sources. However, the bias from using data from different sources was considered to be less than the bias that may arise from estimating growth from observations that did not cover the range of ages. 

The estimated growth used in this assessment had females reach marginally larger asymptotic sizes compared to males. Sex-specific growth parameters were estimated at the following values:

\begin{centering}

Females $L_{\infty}$ = 48.4 cm; $k$ = 0.206

Males $L_{\infty}$ = 47.2 cm; $k$ = 0.231

\end{centering}

\vspace{0.5cm}

These values were fixed within the base model for male and female copper rockfish. While the growth differences between sexes was limited for copper rockfish, sex-specific parameterization was used in the hopes that it would allow the length data to the most informative within the assessment. The coefficient of variation (CV) around young and old fish was fixed at a value of 0.10 for both sexes, a value that was base on values  observed across other groundfish stocks. The length-at-age curve with the CV around length-at-age by sex is shown in Figure \ref{fig:len-age-ss}.  

In contrast to the current approach, the length-at-age values cited in the 2013 data-moderate assessment [@cope_data-moderate_2013] for copper rockfish (although not directly used by the data-moderate model) were from Lea et al. [-@lea_biological_1999]. The $L_{\infty}$ from Lea et al. [-@lea_biological_1999] by sex were quite a bit larger than those estimated for this assessment using recent length and age data off the coast of Oregon and Washington. In the Lea et al. [-@lea_biological_1999] young fish were well sampled, however, there were very few observations of fish older than 12 years of age (fewer than 5 total), which appears to have led to a poorly informed estimate of $L_{\infty}$.   

For the sake of parsimony, the length-age samples were pooled across sources to estimate a single length-at-age curve for copper rockfish in California north of Point Conception, Oregon, and Washington. In the future, if adequate area-based length-age samples across a range of fishery-dependent and -independent source are available, copper rockfish growth should be re-evaluated for possible area-specific variation.

### Maturation and Fecundity


Maturity-at-length is based upon the work of Hannah [-@hannah_length_2014] who estimated the 50 percent size-at-maturity of 34.8 cm and slope of -0.6 for copper rockfish off the coast of Oregon, with maturity reaching the asymptote of 1.0 for larger fish (Figure \ref{fig:maturity}).  

The fecundity-at-length was based on research from Dick et al. [-@dick_meta-analysis_2017]. The fecundity relationship for copper rockfish was estimated equal to 3.362e-07$L$^3.68^ in millions of eggs where $L$ is length in cm. Fecundity-at-length is shown in Figure \ref{fig:fecundity}.

Table \ref{tab:growth-tab} shows the length-at-age, weight-at-age, maturity-at-age, and spawning output (the product of fecundity and maturity) assumed in the base model.

### Sex Ratio


There were limited sex-specific observations by length or age across biological data sources. The sex ratio of copper rockfish by length and age across all available data sources off the West Coast are shown in Figures \ref{fig:len-sex-ratio} and \ref{fig:age-sex-ratio}. The sex ratio of young fish was assumed to be 1:1. 

<!--chapter:end:22biology.Rmd-->

\clearpage

# Assessment Model

## Summary of Previous Assessments 


Copper rockfish was last assessed in 2013 [@cope_data-moderate_2013]. The stock was assessed using extended depletion-based stock reduction analysis (XDB-SRA), a data-moderate approach that incorporated catch and index data with priors on select parameters: natural mortality, stock status in a specified year, productivity, and the relative status of maximum productivity. Copper rockfish was assessed as two separated stocks, the area south of Point Conception off the California coast and the area north of Point Conception to the Washington/Canadian border. The 2013 assessment estimated the stock south of Point Conception at 75 percent of unfished spawning biomass and the stock north of Point Conception at 48 percent of unfished spawning biomass. 

### Bridging Analysis


A direct bridging analysis was not conducted because the previous assessment was structured to include the area from north of Point Conception to the Washington/Canadian border. The data types used in the 2013 assessment were catches and indices of abundance.  Matching the 2013 data was not straightforward aside from the challenges already posed from the alternative model platform (XDB-SRA) and area grouping. First, the 2013 assessment document did not report catches on a state and source level (not atypical for grouped state or area assessments). Secondly, some of the  recreational indices used in 2013 were calculated based on multi-state data. All of these items created significant challenges of how to conduct an effective, logical, and informative bridging analysis for the assessment north of Point Conception.  
 

## Model Structure and Assumptions

The assessment of copper rockfish in Washington waters was assessed using a two-sex model with sex specific life history parameters.  The model assumed two fleets: 1) recreational and 2) commercial fleets with recreational removals starting in 1935. Selectivity was specified using the double normal parameterization within Stock Synthesis for the recreational fleet where selectivity was fixed to be asymptotic with the ascending slope and size of maximum selectivity parameters estimated. The commercial fleet selectivity was assumed to be the same as the recreational fleet due to a lack of length data to estimate a fleet-specific selectivity curve. The commercial and recreational fleets were kept separate in the model despite the limited commercial removals and composition data for two reasons: 1) clarity and 2) the recreational fleet removals were specified in terms of numbers while the commercial removals were in biomass. Recruitment was specified to be deterministic due to limited composition data. 

### Modeling Platform and Structure

The assessment was conducted used Stock Synthesis version 3.30.16 developed by Dr. Richard Methot at the NOAA, NWFSC [@methot_stock_2013]. This most recent version was used because it included improvements and corrections to older model versions. The R package [r4ss](https://github.com/r4ss/r4ss), version 1.38.0, along with R version 4.0.1 were used to investigate and plot model fits. 


### Priors


Priors were used to determine fixed parameter values for natural mortality and steepness in the base model.  The prior distribution for natural mortality was based on the Hamel [-@hamel_method_2015] meta-analytic approach with  an assumed maximum age of 50 years. The prior assumed a log normal distribution for natural mortality. The log normal prior has a median of 0.108 yr^-1^ and a standard error of 0.438. 

The prior for steepness assumed a beta distribution with mean of 0.72 and standard error of 0.15. The prior parameters are based on the Thorson-Dorn rockfish prior (commonly used in past West Coast rockfish assessments) conducted by James Thorson (personal communication, NWFSC, NOAA), which was reviewed and endorsed by the Scientific and Statistical Committee (SSC) in 2017. However, this approach was subsequently rejected for future analysis in 2019 when the new meta-analysis resulted in a mean value of approximately 0.95. In the absence of a new method for generating a prior for steepness the default approach reverts to the previously endorsed method, the 2017 value.

### Data Weighting

Length compositions from the recreational fleet were the only composition data fit in the model. In the absence of index or commercial composition data, no data weighting was performed in the base model. Sensitivities were performed using the three data weighting approaches that are commonly applied for West Coast groundfish stock assessments: Francis method [@francis_data_2011], McAllister and Ianelli method, known as Harmonic Mean weighting [@mcallister_bayesian_1997], and the Dirichlet-Multinomial method [@thorson_model-based_2017].


### Estimated and Fixed Parameters

There were 3 estimated parameters in the base model. These included one parameter for $R_0$ and 2 parameters for recreational selectivity (Table \ref{tab:params}). Selectivity in the recreational fleet was fixed asymptotic with only the peak the and the ascending slope estimated.  Dome-shaped selectivity was explored for the recreational fleet. Older and larger copper rockfish may be found deeper waters and may move into areas that limit their availability to fishing gear. However, limited support for dome-shaped selectivity for the recreational fleet was found and the selectivity was fixed to be asymptotic.  The commercial selectivity was set equal to the recreational selectivity due to a lack of composition data to support fleet specific estimation. 

Fixed parameters in the model were as follows. Steepness was fixed at 0.72, the mean of the prior. Natural mortality was fixed at 0.108 yr^-1^ for females and males, the median of the prior. The standard deviation of recruitment deviates was fixed at 0 and recruitment was assumed deterministic. Maturity-at-length was fixed as described above in Section \ref{maturation-and-fecundity}. Length-weight parameters were fixed at estimates using all length-weight observations described above in Section \ref{length-weight-relationship}. The length-at-age was fixed at sex-specific externally estimated values described above in Section \ref{growth-length-at-age}.


## Model Selection and Evaluation

The base assessment model for copper rockfish was developed to balance parsimony and realism, and the goal was to estimate a spawning output trajectory for the population of copper rockfish off the Washington coast. Several investigative model runs were done to achieve the final base model.



<!--chapter:end:30model.Rmd-->

## Base Model Results

The base model parameter estimates, along with approximate asymptotic standard errors, are shown in Table \ref{tab:params} and the likelihood components are shown in Table \ref{tab:likes}. Estimates of stock size and status over time are shown in Table \ref{tab:timeseries}. 


### Parameter Estimates

Estimated parameter values are provided in Table \ref{tab:params}. The model estimated 3 total parameters: $R_0$ and two parameters associated with the recreational fleet selectivity.  The $R_0$ was estimated at 2.03. The selectivity curve was estimated for the recreational fleet (Figure \ref{fig:selex}). The selectivity was fixed to be asymptotic, reaching maximum selectivity for fish at 37 cm.  The selectivity for the commercial fleet was assumed to be equal to the recreational fleet selectivity due to the lack of commercial length data.


### Fits to the Data

Fits to the length data are shown based on the Pearson residuals-at-length, the annual mean lengths, and aggregated length composition data for the recreational fleet. The Pearson residuals show a pattern of greater observations of all sexes (unsexed, males, and females) that start around 1995 and appear to move through the length data by year, possibly indicating a strong or multiple strong recruitments entering the population (Figure \ref{fig:rec-pearson}). Estimating annual recruitment deviations would have allowed the model to fit the patterns in the length data. However, the base model did not estimate annual recruitment deviations due to limited length data, which resulted in extreme recruitment deviation estimates (large positive deviations in the 1990s followed by string of negative deviations from 2000 - 2020) resulting in a highly pessimistic stock status (see Section \ref{sens}). The assessment of copper rockfish off the Oregon coast, which also did not include annual recruitment deviations had similar indications in the data of one or more strong year classes in the mid-1990s indicating that oceanographic forces driving recruitment success or failure may be shared across Oregon and Washington.  The mean lengths across years with data was relatively stable ranging roughly between 35 and 42 cm by year (Figure \ref{fig:rec-mean-len-fit}). 

Detailed fits to the length data by year are provided in the Appendix, Section \ref{length-fit}. Aggregate fits by fleet are shown in Figure \ref{fig:agg-len-fit}.  There are a few things that stand out when examining the aggregated length composition data. The estimated fits to the data by sex matches the general shape of the aggregated lengths. However, the model expects a higher proportion of the largest fish relative to the data.  This may indicate that the true selectivity of the recreational fleet may have some level of reduced selectivity of the largest fish (dome-shaped) but selectivity in the model was fixed to be asymptotic to follow the pre-specified terms of reference for a length-based assessment which specifies that at least one fleet in the model should have asymptotic selectivity. Sensitivities examining dome-shaped and estimating annual recruitment deviations were performed and presented in the [Sensitivity Analyses](#sensitivity-analyses) section below. 

### Population Trajectory

The predicted spawning output (in millions of eggs) is given in Table \ref{tab:timeseries} and plotted in Figure \ref{fig:ssb}. The predicted spawning output from the base model generally showed a slow decline over the time series with the spawning output stabilizing in recent years. The total biomass shows a similar slow decline across the modeled years (Figure \ref{fig:tot-bio}).

The 2020 spawning output relative to unfished equilibrium spawning output is above the target of 40 percent of unfished spawning output (0.42, Figure \ref{fig:depl}). Approximate confidence intervals based on the asymptotic variance estimates show that the uncertainty in the estimated spawning output is limited. The standard deviation of the log of the spawning output in 2020 is 0.1.

The stock-recruit curve resulting from a value of steepness fixed at  is shown in Figure \ref{fig:bh-curve}. The estimated annual recruitment is shown in  Figure \ref{fig:recruits}




<!--chapter:end:33results.Rmd-->

## Model Diagnostics

### Convergence

Proper convergence was determined by starting the minimization process from dispersed values of the maximum likelihood estimates to determine if the model found a better minimum. Starting parameters were jittered by 10 percent. This was repeated 100 times, with 94 out of 100 runs returned to the base model likelihood. A better, lower negative log-likelihood, model fit was not found. The model did not experience convergence issues when provided reasonable starting values. Through the jittering done as explained and likelihood profiles, we are confident that the base model as presented represents the best fit to the data given the assumptions made. There were no difficulties in inverting the Hessian to obtain estimates of variability, although much of the early model investigation was done without attempting to estimate a Hessian. 

### Sensitivity Analyses{#sens}

Several sensitivity analyses were conducted.  The majority of the sensitivities conducted was a single exploration from the base model assumptions and/or data, and were not performed in a cumulative fashion.

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

The two sensitivities that had the largest impact relative to the base model were those that estimated annual recruitment deviations alone or combined to also estimate dome-shaped selectivity (Figures \ref{fig:sens-ssb} and \ref{fig:sens-depl}). The time series of each of these sensitivities resulted in large scale swings in spawning output across time. The estimates or recruitment deviations had a string of average estimates during the late 1990s and early 2000s then switched to a period of low recruitment success in recent years (Figure \ref{fig:sens-recr}). The recruitment deviation estimates were likely being driven by subtle shifts in the mean lengths being observed across time (Figure \ref{fig:mean-len-data}). The pattern of recruitment deviations estimated was extreme for the Washington area model but the general pattern showed some coherence with the recruitment deviations peaks estimated in the separate Oregon area model (shown as a sensitivity). The sensitivity in the Oregon model that estimated recruitment deviations also estimated above average recruitment in the late 1990s which led to an increase in spawning output during the 2000s similar to what was observed in this sensitivity for the Washington model.  This may indicate that copper rockfish off the coast of Oregon and Washington experience similar drivers in recruitment.     

A sensitivity run allowing dome-shaped selectivity with deterministic recruitment was also performed but not shown due to the model failing to estimate a reasonable biomass scale (hit the upper bound of log($R_0$) of 20). 

The sensitivities exploring data weighting using the Francis or MI methods matched the base model as expected given that there was only one source of data used in the model. In contrast, the DM method resulted in a stock size and status less than the base model.  It is unclear why this difference in results across data weighting arose.  


### Likelihood Profiles

Likelihood profiles were constructed for $R_0$, steepness, female natural mortality, female $L_{\infty}$, female growth coefficient ($k$), and female coefficient of variation for older fish ($CV_2$) values separately. These likelihood profiles were constructed by fixing the parameter at specific values and estimating the remaining parameters based on the fixed parameter value.

In regards to values of $R_0$, the negative log-likelihood was minimized at approximately log($R_0$) of 2.03 (Figure \ref{fig:r0-profile}). Increasing the $R_0$, relative to the value estimated, results in an increase in stock scale and status (Figures \ref{fig:r0-ssb} and \ref{fig:r0-depl}). 

For steepness, the negative log-likelihood supported values at the upper bound of 1.0 (Figure \ref{fig:h-profile}).  Assuming higher or lower steepness values impacted the estimated unfished spawning output but had less impact on the final spawning output (Figure \ref{fig:h-ssb}). The estimated relative final stock status ranged between around the minimum threshold (0.25) to above the management target depending upon assuming a lower or higher steepness value (Figure \ref{fig:h-depl}).

The negative log-likelihood profile across female natural mortality supported values greater than the fixed value of 0.108 yr^-1^ (Figure \ref{fig:m-profile}). The estimate stock trajectories assuming lower or higher natural mortality values impacted the estimated unfished spawning output and resulted in stock statuses within the management precautionary zone (between 0.25 - 0.40) and above (Figures \ref{fig:m-ssb} and  \ref{fig:m-depl}). 

A profile across a range of female $L_{\infty}$ values was also conducted (Figure \ref{fig:linf-profile}).  The negative log-likelihood showed support for values between 46 and 47 cm. The $L_{\infty}$ value for female fish in the model was fixed at 48.43 cm based on length-at-age data collected off the Oregon and Washington coasts. The stock scale and status is quite variable across alternative $L_{\infty}$ values where assuming lower values resulted in sharp increases in stock scale and status (Figures \ref{fig:linf-ssb} and \ref{fig:linf-depl}).

A profile across a range of female $k$ values was also conducted (Figure \ref{fig:k-profile}).  The negative log-likelihood showed support for values between 0.11 and 0.13 yr^-1^. The $k$ value for female fish in the model was fixed at 0.206 yr^-1^ based on length-at-age data collected off the Oregon and Washington coasts. The stock scale and status increases under lower $k$ values where assuming higher values resulted in decreases in stock scale and status (Figures \ref{fig:k-ssb} and \ref{fig:k-depl}).

The profile across a range of $\text{CV}_2$ for older females supported lower $\text{CV}_2$ values (Figure \ref{fig:cv-profile}). Assuming lower $\text{CV}_2$ values increased the estimated spawning output but had limited impact in the estimate of fraction unfished (Figures \ref{fig:cv-ssb} and \ref{fig:cv-depl}).

### Length-Based Spawner-per-Recruit Analysis

An exploratory length-based spawner-per-recruit analysis using the approach developed by Hordyk et al. [-@hordyk_novel_2015] was conducted. This approach assumes asymptotic selectivity and deterministic recruitment to produce independent estimates by year of selectivity and spawner-per-recruit (SPR) effort based on the observed recreational lengths. This analysis indicated that copper rockfish were 50 percent selected generally between 30 - 35 cm (excluding 2018) with full selection between 35 - 40 cm  (Figure \ref{fig:lbspr}). The median estimates of SPR by year ranged between 0.60 - 0.75 between 2016 - 2019 with an average of the medians of 0.67. This type of analysis can provide insight on the fishing effort based on life history and observed length data in the absence of an integrated assessment model.  

An additional analysis to estimate stock status based on length data alone was conducted within a length only version of Stock Synthesis. Within this approach the removal history is removed but the same life history values, selectivities, and length compositions (both sexed and unsexed) are used. The underlying assumption is that the population has gone through an aggregate constant catch and constant recruitment to get an estimate of the current stock status. Length compositions are fit by estimating the parameter log($R_0$) (considered a nuisance parameter), which allows for best fits to the length comps and the selectivity by fleet. Using the recreational lengths, the estimated logistic selectivity, and life history from the Washington base model the implied stock status in 2020 was estimated to be approximately 0.44.

The estimates of the SPR harvest rate by year and the length only version of Stock Synthesis were used to provide external estimates of stock status in 2020 for two Simple Stock Synthesis (SSS) analysis.   

### Simple Stock Synthesis

A SSS was run to compare the results from the base model with a simpler modeling approach.  SSS samples via Monte Carlo from three key parameter distributions: natural mortality, steepness, and stock status in a specific year.  The mean and median of the priors assumed in the base model were used to create sampling distributions for natural mortality and steepness.  Two alternative assumptions regarding the distribution of current stock status were explored. SSS applies parameter draws from each of the three parameters within the model and then estimates an $R_0$ value based on the fixed removals and drawn parameters.   

\begin{enumerate}  
	\item Current stock status based on LB-SPR estimates: 
		\begin{itemize}
		\item Number of draws = 1,000,
		\item $M$ = lognormal ($\mu$ = 0.108 yr$^{-1}$, $\sigma$ = 0.22),
		\item $h$ = truncated beta ($\alpha$ = 0.72, $\beta$ = 0.15, a = 0.20, b = 1.0), and
		\item Fraction unfished in 2020 = beta($\alpha$ = 0.67, $\beta$ = 0.20)	
	\end{itemize}
	\item Current stock status based on the estimate from length only Stock Synthesis:
	\begin{itemize}
		\item Number of draws = 1,000,
		\item $M$ = lognormal distribution ($\mu$ = 0.108 yr$^{-1}$, $\sigma$ = 0.22),
		\item $h$ = truncated beta ($\alpha$ = 0.72, $\beta$ = 0.15, a = 0.20, b = 1.0), and
		\item Fraction unfished in 2020 = beta($\alpha$ = 0.44, $\beta$ = 0.20)
	\end{itemize}	
\end{enumerate}

The median of unfished spawning output, spawning output 2021, fraction unfished in 2021, the OFL in 2023, and the ABC in 2023 based on the 2021 fraction unfished of 67 percent is shown in in Table \ref{tab:SSS-67}. The prior distribution for the parameters and the derived quantities with 95 percent uncertainty are shown in Figures \ref{fig:sss-prior-67} and \ref{fig:sss-quant-67}. Assuming that the stock was less depleted relative to the base model resulted in higher estimates of the OFL and ABC in 2023, even when the category 3 buffer was applied (buffer = 0.778, based on a P* = 0.45 and $\sigma4 = 2.0).  

The median of unfished spawning output, spawning output 2021, fraction unfished in 2021, the OFL in 2023, and the ABC in 2023 based on the 2021 fraction unfished of 44 percent is shown in in Table \ref{tab:SSS-44}. The prior distribution for the parameters and the derived quantities with 95 percent uncertainty are shown in Figures \ref{fig:sss-prior-44} and \ref{fig:sss-quant-44}. Assuming a stock status similar to the base model, SSS resulted in an OFL and ABC values that were marginally lower due to the larger buffer applied in the SSS model (base model OFL in 2023 = 2.15, ABC in 2023 = 1.88).  

### Retrospective Analysis
A five-year retrospective analysis was conducted by running the model using data only through 2015, 2016, 2017, 2018, 2019 and 2020. The estimated spawning output was consistent with the base model when recent data were removed up but estimated a lower stock size and status relative to the base model when the last 3-5 years of data were removed (Figures \ref{fig:retro-ssb} and \ref{fig:retro-depl}). 


### Comparison with Other West Coast Stocks


Copper rockfish is assessed as four distinct stocks off the U.S. west coast: south of Point Conception in California; north of Point Conception in California; Oregon; and Washington. The area north of Point Conception off the coast of California was estimated to have the largest unfished spawning output of copper rockfish off the West Coast. The stocks off of the Oregon and Washington coast are smaller in size compared to the California stocks, with the stock off the coast of Washington estimated to have the smallest unfished spawning output.  Comparison of the estimated spawning output trajectories for the California stocks are shown in Figure \ref{fig:ssb-ca-compare} with Oregon and Washington shown in Figure \ref{fig:ssb-orwa-compare}.  The fraction unfished across all West Coast stocks shown in Figure \ref{fig:depl-compare}. The California stocks are estimated to be the most depleted, with the stock south of Point Conception estimated below the management threshold of 25 percent of unfished and the stock north of Point Conception estimated to be in the precautionary zone (less than the management target of 40 percent but above the management threshold).  The stock off the coast of Washington is estimated to be just above the management target and the Oregon stock well above the target. 

<!--chapter:end:34diagnostics.Rmd-->

\clearpage

# Management 

## Reference Points

Reference points were calculated using the estimated selectivity and catch distributions among fleets in the most recent year of the model (2020, Table \ref{tab:referenceES}). The estimated sustainable total yields are estimated to be 2.24 mt when using an $\text{SPR}_{50\%}$ reference harvest rate. The spawning output equivalent to 40 percent of unfished ($\text{SB}_{40\%}$) was estimated to be 3.06 million eggs. 

The spawning output relative to unfished equilibrium in 2021 is estimated to be above the management target of 40 percent of unfished spawning output (42 percent, Figure \ref{fig:depl}). The fishing intensity, $1-\text{SPR}$, has been above and below the harvest rate limit ($\text{SPR}_{50\%}$) in recent years (Table \ref{tab:timeseries} and Figure \ref{fig:1-spr}). The base model estimates that the stock has not fallen below the biomass target and fishing intensity in 2020 is below the target (Figure \ref{fig:phase}). Table \ref{tab:referenceES} shows the full suite of estimated reference points for the base model and Figure \ref{fig:yield} shows the equilibrium curve based on a steepness value fixed at 0.72.

## Harvest Projections and Decision Tables

A ten year projection of the base model with catches equal to the estimated Acceptable Biological Catch (ABC) based on the category 2 time-varying $\sigma$ and $P^*$ = 0.45 for years 2023-2032 with all removals allocated to the recreational fleet (Table \ref{tab:project}). The removals in 2021 and 2022 were set based on the adopted Annual Catch Limits (ACLs) for copper rockfish N. 40$^\circ$ 10' Lat. N. allocated to Washington state (26 percent, PFMC Groundfish Management Team, personal communication). 

The axes of uncertainty in the decision table is based on the uncertainty around the spawning biomass in 2021 via the log($R_0$) parameter. The within model uncertainty estimated from the model was low (0.098) which resulted in little variation in the low and high state of nature relative to the base model if used.  Meanwhile, the default category 2 $\sigma$ of 1.0 resulted in a very large range across the states of nature. As an alternative approach to determine a low and high state of nature from the base model the model uncertanties across the three other area based copper rockfish assessments were averaged to arise at a a $\sigma$ = 0.35. of This $\sigma$ value was used to identify the 12.5 and 87.5 percentiles of the asymptotic standard deviation for the current year, 2021, spawning biomass from the base model to identify the low and high states of nature (i.e., 1.15 standard deviations corresponding to the 12.5 and 87.5 percentiles). Once the 2021 spawning biomass for the low and high states of nature were identified a search across log($R_0$) values were done to attain the current year spawning biomass values. The log($R_0$) values that corresponded with the lower and upper percentiles were 1.89 and 2.21.  

Across the low and high states of nature and across alternative future harvest scenarios the fraction of unfished ranges between 0.36 - 0.58 by the end of the 10 year projection period (Table \ref{tab:dec-tab}). The fraction unfished under the low state of nature declines below that management target by the end of the projection period. 

## Evaluation of Scientific Uncertainty


The estimated uncertainty in the base model around the 2021 spawning output is $\sigma$ = 0.1 and the uncertainty in the base model around the 2021 OFL is $\sigma$ = 0.09. The estimated model uncertainty was less than the category 2 groundfish data-moderate assessment default value of  $\sigma$ = 1.0. 

## Research and Data Needs

The ability to estimate additional process and biological parameters for copper rockfish was limited by data. Collecting the following data would be beneficial to future assessments of the stock:

\begin{enumerate}

	\item Continue collecting length and otolith samples from recreational catches with an emphasis on increasing annual samples collected.

	\item Collect length and age data for the commercial fleet if catches occur.

	\item The sub-stocks of copper rockfish off the coast of Washington and Oregon were assessed separately here. However, research on the connectivity of copper rockfish stocks off the coast of Oregon and Washington would be beneficial to inform future assessment area decisions. 

\end{enumerate}

<!--chapter:end:40management.Rmd-->

# Acknowledgments


Many people were instrumental in the successful completion of this assessment and their contribution is greatly appreciated. We are very grateful to all the agers at WDFW, ODFW, and the CAP lab for their hard work reading numerous otoliths and availability to answer questions when needed. Jason Jannot and Kayleigh Sommers assisted with data from the WCGOP and entertained our many questions. We would like to acknowledge our survey team and their dedication to improving the assessments we do. Peter Frey and John Harms were incredibly helpful in helping the STAT team to understand the data and as to why and when each of our assessments either encounter or do not copper rockfish along the coast. Melissa Head provided an area specific maturity estimate for copper rockfish and provided insight in the complex biological processes that govern maturity processes.   

All of the data-moderate assessment assessments this year were greatly benefited by the numerous individuals who took the time to participate in the pre-assessment data webinar. Gerry Richter, Merit McCrea, Louis Zimm, Bill James, and Daniel Platt provided insight to the data and the complexities of the commercial and recreational fisheries off the West Coast of the U.S. which were essential in the production of all of the copper rockfish assessments conducted this year. 


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

\begin{longtable}[t]{c>{\centering\arraybackslash}p{2.5cm}>{\centering\arraybackslash}p{2.5cm}}
\caption{(\#tab:nums-mt)Input numbers of fish removals by year converted to metric tons (mt) within the model.}\\
\toprule
Year & Numbers of Fish & Model Estimated (mt)\\
\midrule
\endfirsthead
\caption[]{(\#tab:nums-mt)Input numbers of fish removals by year converted to metric tons (mt) within the model. \textit{(continued)}}\\
\toprule
Year & Numbers of Fish & Model Estimated (mt)\\
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

\begin{longtable}[t]{l>{\raggedright\arraybackslash}p{1.57cm}>{\raggedright\arraybackslash}p{1.57cm}>{\raggedright\arraybackslash}p{1.57cm}>{\raggedright\arraybackslash}p{1.57cm}>{\raggedright\arraybackslash}p{1.57cm}>{\raggedright\arraybackslash}p{1.57cm}}
\caption{(\#tab:ofl)The OFL (mt) and ACL (mt) for north nearshore complex, the ACL allocated to Washington, and the total removals (mt).}\\
\toprule
Year & Complex OFL & Complex ACL & OFL - copper & ACL - copper & WA ACL & WA Removals\\
\midrule
\endfirsthead
\caption[]{(\#tab:ofl)The OFL (mt) and ACL (mt) for north nearshore complex, the ACL allocated to Washington, and the total removals (mt). \textit{(continued)}}\\
\toprule
Year & Complex OFL & Complex ACL & OFL - copper & ACL - copper & WA ACL & WA Removals\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
2011 & - & - & 28.61 & 23.88 & 6.21 & 2.64\\
2012 & - & - & 28.61 & 23.88 & 6.21 & 1.76\\
2013 & - & - & 25.96 & 21.65 & 5.63 & 2.56\\
2014 & - & - & 25.96 & 21.65 & 5.63 & 2.34\\
2015 & - & 69 & 10.64 & 9.71 & 2.52 & 1.32\\
2016 & - & 69 & 10.33 & 9.43 & 2.45 & 1.86\\
2017 & 118.39 & 105 & 11.24 & 10.26 & 2.67 & 1.30\\
2018 & 118.6 & 105 & 11.59 & 10.58 & 2.75 & 3.03\\
2019 & 91 & 81 & 11.91 & 10.88 & 2.83 & 4.28\\
2020 & 92 & 82 & 12.24 & 11.18 & 2.91 & 1.55\\*
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
Mat50\% Fem GP 1 & 34.830 & -9 & (10, 60) & NA & NA & None\\
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
SR BH steep & 0.720 & -7 & (0.22, 1) & NA & NA & Normal (0.72, 0.16)\\
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
\caption{(\#tab:dw)Data weights applied by each alternative data weighting method.}\\
\toprule
Method & Recreational Lengths\\
\midrule
\endfirsthead
\caption[]{(\#tab:dw)Data weights applied by each alternative data weighting method. \textit{(continued)}}\\
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

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/sss_67.tex}

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/sss_44.tex}

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

\clearpage

\input{tex_tables/decision_table.tex}

\clearpage

<!--chapter:end:52tables.Rmd-->

\clearpage
# Figures


<!-- ====================================================================== -->  
<!-- ****************** Catches Used in the Model ************************* --> 
<!-- ====================================================================== -->  

![Catches by year for the recreational and commercial fleets in the model.\label{fig:catch}](figs/catches_wa.png){width=100% height=100% alt="Catches by year for the recreational and commercial fleets in the model"}

<!-- ====================================================================== -->  
<!-- ******************           Map             ************************* --> 
<!-- ====================================================================== -->  


![Map of management area and assessments areas for copper rockfish with the assessment area for Washington shown in blue.\label{fig:map}](C:/Assessments/2021/copper_rockfish_2021/write_up/general_text/map.png){width=100% height=100% alt="."}

<!-- ====================================================================== --> 
<!-- ******************* Data Used in the Model *************************** --> 
<!-- ====================================================================== --> 


![Summary of data sources used in the base model.\label{fig:data-plot}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/data_plot.png){width=100% height=100% alt="."}


<!-- ====================================================================== -->
<!-- ****************   Commercial Length Samples    ********************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- **************** Recreational Length Samples    ********************** --> 
<!-- ====================================================================== -->


![Length composition data from the recreational fleet.\label{fig:wa-len-data}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lendat_bubflt1mkt0_page2.png){width=100% height=100% alt="."}



![Aggregated length composition data across all years from the recreational fleet.\label{fig:wa-len-agg}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lendat__aggregated_across_time.png){width=100% height=100% alt="."}


![Mean length for the recreational fleet with 95 percent confidence intervals.\label{fig:mean-len-data}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lendat_data_weighting_TA1.8_WA_Recreational.png){width=100% height=100% alt="."}


<!-- ====================================================================== -->
<!-- *************************     Biology     **************************** --> 
<!-- ====================================================================== -->


![Comparison of the length-at-weight data from the NWFSC Hook and Line and the NWFSC WCGBT surveys.\label{fig:len-weight-survey}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Weight_Source.png){width=100% height=100% alt="."}


![Weight-at-length by sex used in the model.\label{fig:len-weight}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/bio5_weightatsize.png){width=100% height=100% alt="."}



![Observed sex-specific length-at-age by data source with the estimate length-at-age curve.\label{fig:len-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_north_Age_by_Sex_Source.png){width=100% height=100% alt="."}



![Length at age in the start of the year in the ending year of the model.\label{fig:len-age-ss}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/bio1_sizeatage.png){width=100% height=100% alt="."}

\clearpage


![Maturity as a function of  length.\label{fig:maturity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/bio6_maturity.png){width=100% height=100% alt="."}

\clearpage


![Fecundity as a function of length.\label{fig:fecundity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/bio9_fecundity_len.png){width=100% height=100% alt="."}

\clearpage


![Fraction female by length across all available data sources where the size of red circles are based on the number of observations by length where larger circles indicate more observations.\label{fig:len-sex-ratio}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/Length_fraction_female.png){width=100% height=100% alt="."}


![Fraction female by age across all available data sources where the size of red circles are based on the number of observations by age where larger circles indicate more observations.\label{fig:age-sex-ratio}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/Age_fraction_female.png){width=100% height=100% alt="."}

<!-- ====================================================================== -->
<!-- *********************    Selectivity            ********************** --> 
<!-- ====================================================================== -->


![Selectivity at length by fleet.\label{fig:selex}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/sel01_multiple_fleets_length1.png){width=100% height=100% alt="."}


<!-- ====================================================================== -->
<!-- ****************** Fit to the Length Data **************************** --> 
<!-- ====================================================================== -->



![Pearson residuals for the recreational fleet. Closed bubble are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:rec-pearson}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lenfit_residsflt1mkt0_page2.png){width=100% height=100% alt="."}


![Mean length for recreational with 95 percent confidence intervals based on current samples sizes.\label{fig:rec-mean-len-fit}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lenfit_data_weighting_TA1.8_WA_Recreational.png){width=100% height=100% alt="."}


![Aggregated length comps across all years.\label{fig:agg-len-fit}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lenfit__aggregated_across_time.png){width=100% height=100% alt="."}

<!-- ====================================================================== -->
<!-- ******************      Time Series       **************************** --> 
<!-- ====================================================================== -->


![Estimated time series of spawning output.\label{fig:ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/ts7_Spawning_output_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="."}


![Estimated time series of total biomass.\label{fig:tot-bio}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/ts1_Total_biomass_(mt).png){width=100% height=100% alt="."}


![Estimated time series of fraction of unfished spawning output.\label{fig:depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/ts9_Fraction_of_unfished_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="."}


![Stock-recruit curve. Point colors indicate year, with warmer colors indicating earlier years and cooler colors in showing later years.\label{fig:bh-curve}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/SR_curve.png){width=100% height=100% alt="."}


![Estimated time series of age-0 recruits (1000s).\label{fig:recruits}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/ts11_Age-0_recruits_(1000s)_with_95_asymptotic_intervals.png){width=100% height=100% alt="."}

<!-- ====================================================================== -->
<!-- ******************       Sensitivity     ***************************** --> 
<!-- ====================================================================== -->


![Change in estimated spawning output by sensitivity.\label{fig:sens-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/_sensitivities/_plots/7.7_base_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="."}


![Change in estimated fraction unfished by sensitivity.\label{fig:sens-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/_sensitivities/_plots/7.7_base_compare4_Bratio_uncertainty.png){width=100% height=100% alt="."}


![Change in estimated annual recruitment deviations by sensitivity.\label{fig:sens-recr}](C:/Assessments/2021/copper_rockfish_2021/models/wa/_sensitivities/_plots/7.7_base_compare12_recdevs_uncertainty.png){width=100% height=100% alt="."}


<!-- ====================================================================== -->
<!-- ******************      Likelihoods      ***************************** --> 
<!-- ====================================================================== -->


![Change in the negative log-likelihood across a range of log(R~0~) values.\label{fig:r0-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_LN(R0)/piner_panel_SR_LN(R0).png){width=100% height=100% alt="."}


![Change in the estimate of spawning output across a range of log(R~0~) values.\label{fig:r0-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_LN(R0)/SR_LN(R0)_trajectories_compare1_spawnbio.png){width=100% height=100% alt="."}


![Change in the estimate of fraction unfished across a range of log(R~0~) values.\label{fig:r0-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_LN(R0)/SR_LN(R0)_trajectories_compare3_Bratio.png){width=100% height=100% alt="."}


![Change in the negative log-likelihood across a range of steepness values.\label{fig:h-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_BH_steep/piner_panel_SR_BH_steep.png){width=100% height=100% alt="."}


![Change in the estimate of spawning output across a range of steepness values.\label{fig:h-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_BH_steep/SR_BH_steep_trajectories_compare1_spawnbio.png){width=100% height=100% alt="."}


![Change in the estimate of fraction unfished across a range of steepness values.\label{fig:h-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_SR_BH_steep/SR_BH_steep_trajectories_compare3_Bratio.png){width=100% height=100% alt="."}


![Change in the negative log-likelihood across a range of female natural mortality values.\label{fig:m-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_NatM_p_1_Fem_GP_1/piner_panel_NatM_p_1_Fem_GP_1.png){width=100% height=100% alt="."}


![Change in the estimate of spawning output across a range of female natural mortality values.\label{fig:m-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_NatM_p_1_Fem_GP_1/NatM_p_1_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="."}


![Change in the estimate of fraction unfished across a range of female natural values.\label{fig:m-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_NatM_p_1_Fem_GP_1/NatM_p_1_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="."}


![Change in the negative log-likelihood across a range of female maximum length values.\label{fig:linf-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_L_at_Amax_Fem_GP_1/piner_panel_L_at_Amax_Fem_GP_1.png){width=100% height=100% alt="."}


![Change in the estimate of spawning output across a range of female maximum length values.\label{fig:linf-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_L_at_Amax_Fem_GP_1/L_at_Amax_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="."}


![Change in the estimate of fraction unfished across a range of female maximum length values.\label{fig:linf-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_L_at_Amax_Fem_GP_1/L_at_Amax_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="."}


![Change in the negative log-likelihood across a range of female k values.\label{fig:k-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_VonBert_K_Fem_GP_1/piner_panel_VonBert_K_Fem_GP_1.png){width=100% height=100% alt="."}


![Change in the estimate of spawning output across a range of female k values.\label{fig:k-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_VonBert_K_Fem_GP_1/VonBert_K_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="."}


![Change in the estimate of fraction unfished across a range of female k values.\label{fig:k-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_VonBert_K_Fem_GP_1/VonBert_K_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="."}


![Change in the negative log-likelihood across a range of female coefficient of variation for older ages.\label{fig:cv-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_CV_old_Fem_GP_1/piner_panel_CV_old_Fem_GP_1.png){width=100% height=100% alt="."}


![Change in the estimate of spawning output across a range of female coefficient of variation for older ages.\label{fig:cv-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_CV_old_Fem_GP_1/CV_old_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="."}


![Change in the estimate of fraction unfished across a range of female coefficient of variation for older ages.\label{fig:cv-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_profile_CV_old_Fem_GP_1/CV_old_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="."}

\newpage


<!-- ====================================================================== -->
<!-- ******************       LB-SPR          ***************************** --> 
<!-- ====================================================================== -->


![LB-SPR yearly estimates of selectivity, the ratio of fishing intensity to natural mortality (F/M), and annual spawner-per-recruit (SPR) values.\label{fig:lbspr}](C:/Assessments/2021/copper_rockfish_2021/models/lbspr/Copper_WA_LBSPR_newVBGF_plots.png){width=100% height=100% alt="."}

\newpage

<!-- ====================================================================== -->
<!-- ******************         SSS           ***************************** --> 
<!-- ====================================================================== -->



![Prior distributions for parameter input for SSS.\label{fig:sss-prior-67}](C:/Assessments/2021/copper_rockfish_2021/models/sss/wa/_plots/7.7_base_depl_67_Priors.png){width=100% height=100% alt="."}

\newpage


![Derived quantities from the SSS run where fraction unfished was assumed to be 60 percent.\label{fig:sss-quant-67}](C:/Assessments/2021/copper_rockfish_2021/models/sss/wa/_plots/7.7_base_depl_67_quants.png){width=100% height=100% alt="."}

\newpage


![Prior distributions for parameter input for SSS.\label{fig:sss-prior-44}](C:/Assessments/2021/copper_rockfish_2021/models/sss/wa/_plots/7.7_base_depl_44_Priors.png){width=100% height=100% alt="."}

\newpage



![Derived quantities from the SSS run where fraction unfished was assumed to be 40 percent.\label{fig:sss-quant-44}](C:/Assessments/2021/copper_rockfish_2021/models/sss/wa/_plots/7.7_base_depl_44_quants.png){width=100% height=100% alt="."}

\newpage


<!-- ====================================================================== -->
<!-- ******************     Retrospectives    ***************************** --> 
<!-- ====================================================================== -->


![Change in the estimate of spawning output when the most recent 5 years of data area removed sequentially.\label{fig:retro-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_retro/compare2_spawnbio_uncertainty.png){width=100% height=100% alt="."}


![Change in the estimate of fraction unfished when the most recent 5 years of data area removed sequentially.\label{fig:retro-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base_retro/compare4_Bratio_uncertainty.png){width=100% height=100% alt="."}

\newpage

<!-- ====================================================================== -->
<!-- ******************     Comparison      ***************************** --> 
<!-- ====================================================================== -->


![Estimated spawning output time series for the California stocks north and south of Point Conception.\label{fig:ssb-ca-compare}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/_plots/ca_comprare_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="."}


![Estimated spawning output time series for the stocks off the Oregon and Washington coast.\label{fig:ssb-orwa-compare}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/_plots/or_wa_comprare_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="."}


![Estimated fraction unfished time series for all West Coast stocks.\label{fig:depl-compare}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/_plots/comprare_compare4_Bratio_uncertainty.png){width=100% height=100% alt="."}

\clearpage


<!-- ====================================================================== -->
<!-- ******************    Reference Points    **************************** --> 
<!-- ====================================================================== -->



![Estimated 1 - relative spawning ratio (SPR) by year.\label{fig:1-spr}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/SPR2_minusSPRseries.png){width=100% height=100% alt="."}



![Phase plot of the relative biomass (also referred to as fraction unfished) versus the SPR ratio where each point represents the biomass ratio at the start of the year and the relative fishing intensity in that same year.\label{fig:phase}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/SPR4_phase.png){width=100% height=100% alt="."}


![Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivity and with steepness fixed at 0.72.\label{fig:yield}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/yield2_yield_curve_with_refpoints.png){width=100% height=100% alt="."}

<!--chapter:end:53figures.Rmd-->

\clearpage
# Appendix A. Detailed Fit to Length Composition Data{#length-fit}



![Length comps, whole catch, WA_Recreational (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.\label{fig:comp_lenfit_flt1mkt0_page1}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lenfit_flt1mkt0_page1.png){width=100% height=100% alt="."}

![Length comps, whole catch, WA_Recreational (plot 2 of 2).\label{fig:comp_lenfit_flt1mkt0_page2}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base/plots/comp_lenfit_flt1mkt0_page2.png){width=100% height=100% alt="."}

<!--chapter:end:54appendix.Rmd-->

