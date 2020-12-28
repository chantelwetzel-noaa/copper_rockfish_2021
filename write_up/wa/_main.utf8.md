---
geometry: margin=1in
month: "December"
year: "2020"
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
title: Status of copper rockfish (_Sebastes caurinus_) along the Washigton US West coast in 2020
---

<!--chapter:end:00title.Rmd-->

\pagebreak
\pagenumbering{roman}
\setcounter{page}{1}
\renewcommand{\thetable}{\roman{table}}
\renewcommand{\thefigure}{\roman{figure}}


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

<!--chapter:end:10a.Rmd-->

# Introduction


## Basic Information

This assessment reports the status of copper rockfish (_Sebastes caurinus_) off the US West coast using data through 2020. Copper rockfish is a medium- to large-sized nearshore rockfish found from Mexico to Alaska.  The core range is comparatively large, from northern Baja Mexico to the Gulf of Alaska, as well as in Puget Sound.   Copper rockfish have historically been a part of both commercial (mainly in the live-fish fishery) and recreational fisheries throughout its range.  

## Life History

Copper rockfish are commonly found in waters less than 130 meters in depth in nearshore kelp forests and rocky habitat [@love_milton_probably_1996]. The diets of copper rockfish consist primarily of crustaceans, mollusks, and fish [@lea_biological_1999; @bizzarro_diet_2017-1]. The body coloring or copper rockfish varies across the coast with northern fish often exibiting dark brown to olive  with southern fish exibiting yellow to olive-pink variations in color [@miller_guide_1972] which initially led to them being designated as two seperate species (*caurinus* and *vexillaris*). 

Numerous genetic studies have been performed looking for genetic variation in copper rockfish with variable outcomes. Genetic work has revealed significant differences between Puget Sound and coastal stocks of copper rockfish [@dick_replicate_2014]. Stocks along the West Coast have not been deteremined to be genetically distinct populations but significant population sub-division has been detected along the indicating limited oceanographic exchange among geographically proximate locations [@buonaccorsi_population_2002; @johansson_influence_2008]. A specific study examining copper rockfish populations off the coast of Santa Barbara and Monterey California identified a genetic break between the north and south with moderate differentiation [@sivasundar_life_2010].

Copper rockfish is a relatively long-lived rockfish and have been estimated to live at least 50 years [@love_milton_probably_1996]. Copper rockfish was determined to have the highest vulnerability (V = 2.27) of any West Coast groundfish based on recent productivity susceptibility analaysis [@cope_approach_2011].  

## Ecosystem Considerations
Replace text.

## Historical and Current Fishery Information
Off the coast of Washington copper rockfish is primarily caught in the recreational/sport fishery with very little mortaltiy from commercial fishing. Copper rockfish has been a target of recreational fishing as early as 1934 with catches stabilizing around 2,500 - 3,000 fish per year starting around 1980 with the exception of selected years with high (2005) or low catches (2015). 

## Summary of Management History and Performance

Copper rockfish is managed by the Pacific Fishery Management Council (PFMC) using annual catch limits (ACLs) and overfished limits (OFLS) split North and South of N. 40$^\circ$ 10' Lat. N. off the West Coast. Copper rockfish was most recently assessed in 2013 as two stocks, one South of Pt. Conception in California and North to the Washington/Canadian border.  The 2013 assessed estimated both areas to be above the management target of 40% of unfished conditions with the southern area being assessed at 75% and the northern population at 48%. The OFLs and the ACLs from each assessed area were modified to match the management boundery of North and South of N. 40$^\circ$ 10' Lat. N.


<!--chapter:end:11introduction.Rmd-->

# Data

A description of each data source is provided below (Figure \ref{fig:data-plot}).

<!--chapter:end:20data.Rmd-->

## Fishery-Dependent Data

### Recreational / Sport Data

Table \ref{tab:allcatches} and Table \ref{tab:nums-mt}


### Commercial Data

Table \ref{tab:allcatches}

<!--chapter:end:21f-.Rmd-->

## Fishery-Independent Data

There were no fishery-independent data sources available for copper rockfish off the Washington coast to be considered for this assessment.

<!--chapter:end:21s-.Rmd-->

## Biological Data

### Natural Mortality


Hamel [-@hamel_method_2015] developed a method for combining meta-analytic approaches relating the $M$ rate to other life-history parameters such as longevity, size, growth rate, and reproductive effort to provide a prior on $M$. In that same issue of *ICES Journal of Marine Science*, Then et al. [-@then_evaluating_2015-1] provided an updated data set of estimates of $M$ and related life history parameters across a large number of fish species from which to develop an $M$ estimator for fish species in general. They concluded by recommending $M$ estimates be based on maximum age alone, based on an updated Hoenig non-linear least squares estimator $M=4.899A^{-0.916}_{max}$. The approach of basing $M$ priors on maximum age alone was one that was already being used for West Coast rockfish assessments. However, in fitting the alternative model forms relating $M$ to $A_{\text{max}}$, Then et al. [-@then_evaluating_2015-1] did not consistently apply their transformation. In particular, in real space, one would expect substantial heteroscedasticity in both the observation and process error associated with the observed relationship of $M$ to $A_{\text{max}}$. Therefore, it would be reasonable to fit all models under a log transformation. This was not done. Re-evaluating the data used in Then et al. [-@then_evaluating_2015-1] by fitting the one-parameter $A_{\text{max}}$ model under a log-log transformation (such that the slope is forced to be -1 in the transformed space Hamel [-@hamel_method_2015]), the point estimate for $M$ is:

\begin{centering}

$M=\frac{5.4}{A_{\text{max}}}$

\end{centering}

The above is also the median of the prior. The prior is defined as a lognormal distribution with mean $ln(5.4/A_{\text{max}})$ and SE = 0.438. Using a maximum age of 50, the point estimate and median of the prior is 0.108 per year  The maximum age was selected based on available age data from all West Coast data sources and literature values.  The oldest aged rockfish was 51 years with two observations, off the coast of Washington and Oregon in 2019.  However, age data are subject to ageing error which could impact this estimate of longevity.  The selection of 50 years was based on the range of other ages available with multiple observations of fish between 44 and 51 years of age and literature examining the longevity of `spp` [@love_milton_probably_1996].  

### Length-Weight Relationship


The length-weight relationship for copper rockfish was estimated outside the model using all coastwide biological data available from fishery-independent data sources (Figure \ref{fig:len-weight-survey}). The estimated length-weight for female fish was 9.56e-06$L$^3.19^ and males at 1.08e-05$L$^3.15^ where $L$ is length in cm (Figures \ref{fig:len-weight}).

### Growth (Length-at-Age)


The length-at-age was estimated for male and female copper rockfish using data collected from fishery-dependent data sources off the coast of Oregon and Washington that were collected from 1998-2019 (Table \ref{tab:len-at-age-samps} and Figure \ref{fig:len-age-data}). Figure \ref{fig:len-age} shows the lengths and ages for all years by data source as well as predicted von Bertalanffy fits to the data. Females grow larger than males and sex-specific growth parameters were estimated at the following values:

\begin{centering}

Females $L_{\infty}$ = 49.7 cm; $k$ = 0.151

Males $L_{\infty}$ = 48.1 cm; $k$ = 0.178

\end{centering}

These values were fixed within the base model for male and female copper rockfish. In contrast, the length-at-age values cited in the 2013 data-moderate assessment [@cope_data-moderate_2013] for copper rockfish (although not directly used by XDB-SRA), were from Lea [-@lea_biological_1999]. The $L_{\infty}$ from the Lea study were quite a bit larger for both sexes than those estimated for this assessment using recent length and age data off the coast of Oregon and Washington. However, the data presented in Lea [-@lea_biological_1999] reflected fish sampled off the coast of California and showed very few fish sampled that were greater than 12 years of age.   

### Maturation and Fecundity


Maturity-at-length based on the work of Hannah [-@hannah_length_2014] which estimated the 50% size-at-maturity of 34.83 cm off the coast of Oregon with maturity asymptoting to 1.0 for larger fish (Figure \ref{fig:maturity}).  

The fecundity-at-length was based on research Dick et al. [-@dick_meta-analysis_2017]. The fecundity relationship for copper rockfish was estimated equal to 3.362e-07$L$^3.68^ in millions of eggs where $L$ is length in cm. Fecundity-at-length is shown in Figure \ref{fig:fecundity}.

### Sex Ratio


There was limited sex specific observations by length or age for all biological data sources (Figures \ref{fig:len-sex-ratio} and \ref{fig:age-sex-ratio}). The sex ratio of young fish was assumed to be 1:1. 

<!--chapter:end:22biology.Rmd-->

# Assessment Model

## Summary of Previous Assessments 

Copper rockfish was last assesseed in 2013 [@cope_data-moderate_2013]. The stock was assessed using extended depletion-based stock reduction analysis (XDB-SRA) a data-moderate approach which incorporated catch and index data with prior on select parameters (natural mortality, stock status in a specified year, productivity, and the relative status of maximum productivity). Copper rockfish was assessed as two separated stocks, the area South of Pt. Conception off the California coast and the area North of Pt. Conception to the Washington Canada border. The 2013 assessment estimated the stock South of Pt. Conception at 75% of unfished spawning output North of Pt. Conception at 48% of unfished spawning output. 

### Bridging Analysis

A direct bridging analysis was not conducted because the previous assessment was structured to include the area from North of Pt. Conception to the Washington/Canadian border.  


## Model Structure and Assumptions

The Washington copper rockfish area assessed using a two-sex model with sex specific life history parameters.  The model assumed two fleets: 1) recreational and 2) commercial fleets with recreational removals beginning in 1935. Selectivity was specified using the double normal parameterization within SS for the recreational fleet where selectivity was fixed to be asymptotic with the ascending slope and size of maximum selectivity parameters estimated.  The commercial fleet selectivity was assumed to be the same as the recreational fleet due to a lack of length data to estimate a fleet specific selectivity curve.  Recruitment was specified to be deterministic due to limited composition data. 

### Modeling Platform and Structure

Stock Synthesis version 3.30.16 was used to estimate the parameters in the model. The R package r4ss, version 1.38.0, along with R version 4.0.1 were used to investigate and plot model fits. 

### Priors


A prior distribution was developed for natural mortality ($M$) using the Hamel [-@hamel_method_2015] meta-analytic approach with  an assumed maximum age of 50 years. The prior assumed a lognormal distribution for natural mortality. The lognormal prior has a median of 0.108 and a standard error of 0.438. 

The prior for steepness ($h$) assumed a beta distribution with $\mu$=0.72 and $\sigma$=0.15.  
The prior parameters are based on the Thorson-Dorn rockfish prior (commonly used in past West Coast rockfish assessments) conducted by James Thorson (personal communication, NWFSC, NOAA) which was reviewed and endorsed by the Scientific and Statistical Committee (SSC) in 2017. However, this approach was subsequently rejected for future analysis in 2019 when the new meta-analysis resulted in a mean value of approximately 0.95. In the absense of a new method for generating a prior for steepness the default approach reverts to the previously endorsed method, the 2017 value.

### Data Weighting

Length compositions from the recreational fleet were fit in the model. In the absense of index or or commercial composition data, no data weighting was performed in the base model. Sensitivities were performed using the three data weighting approaches that are commonly applied for West Coast groundfish stock assessments; Francis method [@francis_data_2011], McAllister and Ianelli method (also known as Harmonic Mean weighting) [@mcallister_bayesian_1997], and the Dirichlet method [@thorson_model-based_2017].


### Estimated and Fixed Parameters

There were 3 estimated parameters in the base model. These included one parameter for $R_0$ and 2 parameters for selectivity (Table \ref{tab:params}).

Fixed parameters in the model were as follows. Steepness was fixed at  the mean of the prior. Natural mortality was fixed at 0.108 yr^-1^ for females and males, which is the median of the prior. The standard deviation of recruitment deviates was fixed at 0 and recruitment was assumed deterministic. Maturity-at-length was fixed as described above in Section \ref{maturation-and-fecundity}. Length-weight parameters were fixed at estimates using all length-weight observations described above in Section \ref{length-weight-relationship}. The length-at-age was fixed at sex-specific externally estimated values described above in Section \ref{growth-length-at-age}.

Dome-shaped selectivity was explored for the recreational fleet. Older and larger copper rockfish may be found deeper waters and may move into areas that limit their availability to fishing gear. However, limited support for dome-shaped selectivity for the recreational fleet was found and the selectivity was fixed to be asmptotic.  The commercial selectivity was set equal to the recreational selectivity due to a lack of composition data to support fleet specific estimation. 

## Model Selection and Evaluation

The base assessment model for copper rockfish was developed to balance parsimony and realism, and the goal was to estimate a spawning output trajectory for the population of copper rockfish off the Washington coast. The model contains many assumptions to achieve parsimony and uses many different sources of data to estimate reality. A series of investigative model runs were done to achieve the final base model.



<!--chapter:end:30model.Rmd-->

## Base Model Results

The base model parameter estimates along with approximate asymptotic standard errors are shown in Table \ref{tab:params} and the likelihood components are shown in Table [XX add table xx]. Estimates of derived reference points and approximate 95 percent asymptotic confidence intervals are shown in Table \ref{tab:referenceES}. Estimates of stock size and status over time are shown in Table \ref{tab:timeseries}. 


### Parameter Estimates

Selectivity curves were estimated for the recreational fleet.  The estimated selectivity for the recreational fleet is shown in Figure \ref{fig:selex}.  Selectivities were fixed to be asymptotic, reaching maximum selectivity for fish between 35 and 40 cm.  The selectivity for the commercial fleet was assumed to be equal to the recreational fleet selectivity.

ADD R0 parameter estimates


### Fits to the Data

Figure \ref{fig:rec-pearson}
Figure \ref{fig:rec-mean-len-fit}
Figure \ref{fig:agg-len-fit}


### Population Trajectory

The predicted spawning output (in millions of eggs) is given in Table \ref{tab:timeseries} and plotted in Figure \ref{fig:ssb}. The predicted spawning output from the base model generally showed a slow decline over the timeseries with the spawning output stabilizing in recent years. 

The 2020 spawning output relative to unfished equilibrium spawning output is above the target of 40% of unfished spawning output ( Figure \ref{fig:depl}). Approximate confidence intervals based on the asymptotic variance estimates show that the uncertainty in the estimated spawning output is limited. The standard deviation of the log of the spawning output in 2020 is 0.11.

The stock-recruit curve resulting from a value of steepness fixed at  is shown in Figure \ref{fig:bh-curve}. The estimated annual recruitment is shown in  Figure \ref{fig:recruits}


### Reference Points

Reference points were calculated using the estimated selectivity and catch distributions among fleets in the most recent year of the model (2019). Sustainable total yields  were  mt when using an $SPR_{50\%}$ reference harvest rate. The spawning output equivalent to 40% of the unfished spawning output ($SB_{40\%}$) was  millions of eggs. 

UPDATE -- The recent catches (landings plus discards) have been below the point estimate of potential long-term yields calculated using an $SPR_{50\%}$ reference point and the population has been increasing sharply over the last 15 years.

The 2020 spawning output relative to unfished equilibrium spawning output is above the target of 40% of unfished spawning output (Figure \ref{fig:depl}). The fishing intensity, $1-SPR$, has bounced above and blow the harvest rate limit ($SPR_{50\%}$) in recent years (Table \ref{tab:timeseries} and Figure \ref{fig:1-spr}). 

Table \ref{tab:referenceES} shows the full suite of estimated reference points for the base model and Figure \ref{fig:yield} shows the equilibrium curve based on a steepness value fixed at 0.72.

<!--chapter:end:33results.Rmd-->

## Model Diagnostics

### Convergence

Proper convergence was determined by starting the minimization process from dispersed values of the maximum likelihood estimates to determine if the model found a better minimum. Starting parameters were jittered by 5%. This was repeated 100 times and a better minimum was not found (Table XXX). The model did not experience convergence issues when provided reasonable starting values. Through the jittering done as explained above and likelihood profiles, we are confident that the base model as presented represents the best fit to the data given the assumptions made. There were no difficulties in inverting the Hessian to obtain estimates of variability, although much of the early model investigation was done without attempting to estimate a Hessian. 

### Sensitivity Analyses

A number of sensitivity analyses were conducted.  The majoirty of the sensitivities conducted was a single exploration from the base model assumptions and/or data, and were not performed in a cumulative fashion.

\begin{enumerate}

  \item Fix natural mortality 10 percent lower at a value of 0.097 per year for both sexes.
  
  \item Fix natural mortality 10 percent higher at a value of 0.119 per year for both sexes.

  \item Fix $L_{\infty}$ 5 percent higher at a value of 52.2 cm for females and 50.5 for males. 

  \item Assume platoons within Stock Synthesis where there are 5 platoons consisting of slower, average, and faster growing fish assumed.
    
  \item Estimate annual recruitment deviations. 
  
  \item Data weighting according to the McAllister-Ianelli method using the weighting values shown in Table XX. 

  \item Data weighting according to the Francis method using the weighting values shown in Table XX. 
  
  \item Data weighting according to the Dirichlet method where the estimated parameters are shown in Table XX. 
  
\end{enumerate}

Likelihood values and estimates of key parameters from each sensitivity are available in Table {tab:sensitivities}.  Plots of the estimated time-series of spawning biomass and relative spawning biomass are shown in Figures \ref{fig:sens-ssb} and \ref{fig:sens-depl}.

A sensitivity of assuming a lower $L_{\infty}$ was also conducted but not presented here. Assuming the $L_{\infty}$ to be lower than the input value resulted in a dramatic and unrealistic shift in stock scale. 


### Retrospective Analysis

A five-year retrospective analysis was conducted by running the model using data only through 2015, 2016, 2017, 2018, 2019 and 2020. The estimated spawning output was consistent with the base model when recent year's data were removed up until 4 and 5 years of data were removed (Figures \ref{fig:retro-ssb} and \ref{fig:retro-depl}). Removing this amount of data resulted in a downward shift in stock scale and status.

### Likelihood Profiles

Likelihood profiles were conducted for $R_0$, steepness, maximum length, and female natural mortality values separately. These likelihood profiles were conducted by fixing the parameter at specific values and estimated the remaining parameters based on the fixed parameter value.

In regards to values of $R_0$, the negative log-likelihood was minimized at approximately log($R_0$) of 2.17 (Figure \ref{fig:r0-ssb}, \ref{fig:r0-depl}, \ref{fig:r0-profile}). 

For steepness, the negative log-likelihood supported values at the upper bound of 1.0 (Figure \ref{fig:h-profile}).  ADD TEXT ABOUT SUPPORT Figure \ref{fig:h-ssb} and Figure \ref{fig:h-depl}

MAXIMUM LENGTH PROFILE

NATURAL MORTALITY PROFILE Figure \ref{fig:m-profile} and Figure \ref{fig:m-ssb} and Figure \ref{fig:m-depl}

### Unresolved Problems and Major Uncertainties


<!--chapter:end:34diagnostics.Rmd-->

# Management 

## Reference Points

## Unresolved Problems and Major Uncertainties

## Harvest Projections and Decision Tables

## Evaluation of Scientific Uncertainty

## Research and Data Needs

<!--chapter:end:40management.Rmd-->

# Acknowledgments
Here are all the mad props!

Merit McCrea, Gerry Richter, Louis Zimm, Daniel Platt

\newpage

<!--chapter:end:41acknowledgments.Rmd-->

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
1937 & 53 & 0.08\\
1938 & 75 & 0.12\\
1939 & 96 & 0.15\\
1940 & 118 & 0.19\\
1941 & 139 & 0.22\\
1942 & 161 & 0.26\\
1943 & 182 & 0.29\\
1944 & 204 & 0.32\\
1945 & 225 & 0.36\\
1946 & 246 & 0.39\\
1947 & 268 & 0.43\\
1948 & 289 & 0.46\\
1949 & 311 & 0.49\\
1950 & 332 & 0.53\\
1951 & 354 & 0.56\\
1952 & 375 & 0.59\\
1953 & 397 & 0.63\\
1954 & 418 & 0.66\\
1955 & 440 & 0.69\\
1956 & 461 & 0.73\\
1957 & 482 & 0.76\\
1958 & 504 & 0.79\\
1959 & 525 & 0.82\\
1960 & 547 & 0.86\\
1961 & 568 & 0.89\\
1962 & 590 & 0.92\\
1963 & 611 & 0.95\\
1964 & 633 & 0.99\\
1965 & 654 & 1.02\\
1966 & 676 & 1.05\\
1967 & 696 & 1.08\\
1968 & 718 & 1.11\\
1969 & 740 & 1.15\\
1970 & 761 & 1.18\\
1971 & 783 & 1.21\\
1972 & 804 & 1.24\\
1973 & 826 & 1.27\\
1974 & 847 & 1.30\\
1975 & 868 & 1.33\\
1976 & 628 & 0.96\\
1977 & 387 & 0.59\\
1978 & 719 & 1.10\\
1979 & 957 & 1.47\\
1980 & 563 & 0.86\\
1981 & 1253 & 1.92\\
1982 & 1317 & 2.01\\
1983 & 805 & 1.23\\
1984 & 1280 & 1.95\\
1985 & 1105 & 1.68\\
1986 & 1335 & 2.02\\
1987 & 1608 & 2.43\\
1988 & 1506 & 2.27\\
1989 & 1534 & 2.30\\
1990 & 1966 & 2.93\\
1991 & 1449 & 2.15\\
1992 & 2359 & 3.49\\
1993 & 1850 & 2.72\\
1994 & 1296 & 1.90\\
1995 & 1675 & 2.44\\
1996 & 1948 & 2.83\\
1997 & 1853 & 2.68\\
1998 & 1897 & 2.74\\
1999 & 1932 & 2.78\\
2000 & 2027 & 2.91\\
2001 & 2053 & 2.93\\
2002 & 1327 & 1.89\\
2003 & 1573 & 2.23\\
2004 & 1551 & 2.20\\
2005 & 4359 & 6.16\\
2006 & 2038 & 2.86\\
2007 & 2066 & 2.88\\
2008 & 2183 & 3.03\\
2009 & 1972 & 2.72\\
2010 & 1544 & 2.12\\
2011 & 1916 & 2.63\\
2012 & 1277 & 1.75\\
2013 & 1858 & 2.55\\
2014 & 1699 & 2.34\\
2015 & 955 & 1.31\\
2016 & 1339 & 1.85\\
2017 & 932 & 1.29\\
2018 & 2173 & 3.02\\
2019 & 3073 & 4.26\\
2020 & 2000 & 2.76\\*
\end{longtable}
\endgroup{}
\endgroup{}
\newpage


<!-- ======================================================= -->
<!-- ***************       Data      *********************** --> 
<!-- ======================================================= -->

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/len_at_age_data.tex}

\newpage

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/wa_samples.tex}

\newpage

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/wa_age_samples.tex}

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
L at Amin Fem GP 1 & 16.600 & -2 & (3, 25) & NA & NA & None\\
L at Amax Fem GP 1 & 49.700 & -2 & (35, 60) & NA & NA & None\\
VonBert K Fem GP 1 & 0.151 & -2 & (0.03, 0.3) & NA & NA & None\\
CV young Fem GP 1 & 0.100 & -2 & (0.01, 0.3) & NA & NA & None\\
CV old Fem GP 1 & 0.100 & -2 & (0.01, 0.3) & NA & NA & None\\
Wtlen 1 Fem GP 1 & 0.000 & -9 & (0, 0.1) & NA & NA & None\\
Wtlen 2 Fem GP 1 & 3.190 & -9 & (2, 4) & NA & NA & None\\
Mat50% Fem GP 1 & 34.830 & -9 & (10, 60) & NA & NA & None\\
Mat slope Fem GP 1 & -0.600 & -9 & (-1, 0) & NA & NA & None\\
Eggs scalar Fem GP 1 & 0.000 & -9 & (-3, 3) & NA & NA & None\\
Eggs exp len Fem GP 1 & 3.679 & -9 & (-3, 3) & NA & NA & None\\
NatM p 1 Mal GP 1 & 0.108 & -2 & (0.05, 0.4) & NA & NA & Log Norm (-2.2256, 0.48)\\
L at Amin Mal GP 1 & 14.900 & -2 & (3, 25) & NA & NA & None\\
L at Amax Mal GP 1 & 48.100 & -2 & (35, 60) & NA & NA & None\\
VonBert K Mal GP 1 & 0.178 & -2 & (0.03, 0.3) & NA & NA & None\\
CV young Mal GP 1 & 0.100 & -2 & (0.01, 0.3) & NA & NA & None\\
CV old Mal GP 1 & 0.100 & -2 & (0.01, 0.3) & NA & NA & None\\
Wtlen 1 Mal GP 1 & 0.000 & -9 & (0, 0.1) & NA & NA & None\\
Wtlen 2 Mal GP 1 & 3.150 & -9 & (2, 4) & NA & NA & None\\
FracFemale GP 1 & 0.500 & -9 & (0.01, 0.99) & NA & NA & None\\
SR LN(R0) & 2.170 & 1 & (1, 20) & OK & 0.0497768 & None\\
SR BH steep & 0.720 & -7 & (0.22, 1) & NA & NA & Normal (0.72, 0.09)\\
SR sigmaR & 0.900 & -99 & (0.15, 1) & NA & NA & None\\
SR regime & 0.000 & -99 & (-2, 2) & NA & NA & None\\
SR autocorr & 0.000 & -99 & (0, 0) & NA & NA & None\\
Size DblN peak WA Recreational(1) & 38.113 & 1 & (15, 50) & OK & 0.4906010 & None\\
Size DblN top logit WA Recreational(1) & -0.505 & -2 & (-7, 7) & NA & NA & None\\
Size DblN ascend se WA Recreational(1) & 3.801 & 3 & (-10, 10) & OK & 0.1022150 & None\\
Size DblN descend se WA Recreational(1) & -0.413 & -4 & (-10, 10) & NA & NA & None\\
Size DblN start logit WA Recreational(1) & -20.000 & -9 & (-20, 30) & NA & NA & None\\
Size DblN end logit WA Recreational(1) & 10.000 & -3 & (-10, 10) & NA & NA & None\\*
\end{longtable}
\endgroup{}
\end{landscape}
\endgroup{}


<!-- ======================================================= -->
<!-- ***********       Time Series      ******************** --> 
<!-- ======================================================= -->

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/TimeSeries.tex}

\newpage

<!-- ======================================================= -->
<!-- ****************     Sensitivities      *************** --> 
<!-- ======================================================= -->

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/sensitivities.tex}

\newpage

<!-- ======================================================= -->
<!-- ********  Reference Points & Management *************** --> 
<!-- ======================================================= -->

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/e_ReferencePoints_ES.tex}

\newpage

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/g_Projections_ES.tex}

\newpage

<!--chapter:end:52tables.Rmd-->

# Figures


<!-- ====================================================================== -->  
<!-- ****************** Catches Used in the Model ************************* --> 
<!-- ====================================================================== -->  

![Catches by year for the recreational and commercial fleets in the model.\label{fig:catch}](figs/catches_wa.png){width=100% height=100% alt="Catches by year for the recreational and commercial fleets in the model"}


<!-- ====================================================================== --> 
<!-- ******************* Data Used in the Model *************************** --> 
<!-- ====================================================================== --> 


![Summary of data sources used in the base model.\label{fig:data-plot}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/data_plot.png){width=100% height=100% alt="Summary of data sources used in the base model."}


<!-- ====================================================================== -->
<!-- ****************   Commercial Length Samples    ********************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- **************** Recreational Length Samples    ********************** --> 
<!-- ====================================================================== -->


![Length composition data from the recreational fleet.\label{fig:wa-len-data}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/comp_lendat_bubflt1mkt0_page2.png){width=100% height=100% alt="Length composition data from the recreational fleet."}


![Mean length for recreational fleet with 95 percent confidence intervals.\label{fig:mean-len-data}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/comp_lendat_data_weighting_TA1.8_WA_Recreational.png){width=100% height=100% alt="Mean length for recreational fleet with 95 percent confidence intervals."}


<!-- ====================================================================== -->
<!-- *************************     Biology     **************************** --> 
<!-- ====================================================================== -->


![Comparison of the length-at-weight data from the NWFSC Hook and Line and the NWFSC WCGBT surveys.\label{fig:len-weight-survey}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Weight_Source.png){width=100% height=100% alt="Comparison of the length-at-weight data from the NWFSC Hook and Line and the NWFSC WCGBT surveys."}


![Survey length-at-weight data with sex specific estimated fits.\label{fig:len-weight}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Weight_Sex.png){width=100% height=100% alt="Survey length-at-weight data with sex specific estimated fits."}



![Observed length-at-age by data source.\label{fig:len-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Data_Length_Age_by_Sex.png){width=100% height=100% alt="Observed length-at-age by data source."}


![Length-at-age data from the with sex specific estimated growth.\label{fig:len-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Age_by_Sex.png){width=100% height=100% alt="Length-at-age data from the with sex specific estimated growth."}



![Maturity as a function of  length.\label{fig:maturity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/bio6_maturity.png){width=100% height=100% alt="Maturity as a function of  length."}


![Fecundity as a function of length.\label{fig:fecundity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/bio9_fecundity_len.png){width=100% height=100% alt="Fecundity as a function of length."}


![Fraction female by length across all available data sources.\label{fig:len-sex-ratio}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/Length_fraction_female.png){width=100% height=100% alt="Fraction female by length across all available data sources."}


![Fraction female by age across all available data sources.\label{fig:age-sex-ratio}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/Age_fraction_female.png){width=100% height=100% alt="Fraction female by age across all available data sources."}

<!-- ====================================================================== -->
<!-- *********************    Selectivity            ********************** --> 
<!-- ====================================================================== -->


![Selectivity at length by fleet.\label{fig:selex}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/sel01_multiple_fleets_length1.png){width=100% height=100% alt="Selectivity at length by fleet."}

<!-- ====================================================================== -->
<!-- *********************   Recruitment     ****************************** --> 
<!-- ====================================================================== -->


![Estimated time series of age-0 recruits (1000s).\label{fig:recruits}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/ts11_Age-0_recruits_(1000s)_with_95_asymptotic_intervals.png){width=100% height=100% alt="Estimated time series of age-0 recruits (1000s)."}


<!-- ====================================================================== -->
<!-- ****************** Fit to the Length Data **************************** --> 
<!-- ====================================================================== -->


![Length at age in the beginning of the year in the ending year of the model.\label{fig:len-age-ss}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/bio1_sizeatage.png){width=100% height=100% alt="Length at age in the beginning of the year in the ending year of the model."}



![Pearson residuals for recreational fleet. Closed bubble are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:rec-pearson}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/comp_lenfit_residsflt1mkt0_page2.png){width=100% height=100% alt="Pearson residuals for recreational fleet. Closed bubble are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Mean length for recreational with 95 percent confidence intervals based on current samples sizes.\label{fig:rec-mean-len-fit}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/comp_lenfit_data_weighting_TA1.8_WA_Recreational.png){width=100% height=100% alt="Mean length for recreational with 95 percent confidence intervals based on current samples sizes."}


![Aggregated length comps over all years.\label{fig:agg-len-fit}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/comp_lenfit__aggregated_across_time.png){width=100% height=100% alt="Aggregated length comps over all years."}

<!-- ====================================================================== -->
<!-- ******************      Time Series       **************************** --> 
<!-- ====================================================================== -->


![Estimated time series of spawning output.\label{fig:ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/ts7_Spawning_output_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="Estimated time series of spawning output."}


![Estimated time series of total biomass.\label{fig:tot-bio}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/ts1_Total_biomass_(mt).png){width=100% height=100% alt="Estimated time series of total biomass."}


![Estimated time series of fraction of unfished spawning output.\label{fig:depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/ts9_Fraction_of_unfished_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="Estimated time series of fraction of unfished spawning output."}


![Stock-recruit curve. Point colors indicate year, with warmer colors indicating earlier years and cooler colors in showing later years.\label{fig:bh-curve}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/SR_curve.png){width=100% height=100% alt="Stock-recruit curve. Point colors indicate year, with warmer colors indicating earlier years and cooler colors in showing later years."}


<!-- ====================================================================== -->
<!-- ******************       Sensitivity     ***************************** --> 
<!-- ====================================================================== -->


![Change in estimated spawning output by sensitivity.\label{fig:sens-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/_sensitivities/_plots/7.0_base_compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Change in estimated spawning output by sensitivity."}


![Change in estimated fraction unfished by sensitivity.\label{fig:sens-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/_sensitivities/_plots/7.0_base_compare4_Bratio_uncertainty.png){width=100% height=100% alt="Change in estimated fraction unfished by sensitivity."}

<!-- ====================================================================== -->
<!-- ******************     Retrospectives    ***************************** --> 
<!-- ====================================================================== -->


![Change in the estimate of spawning output when the most recent 5 years of data area removed sequentially.\label{fig:retro-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_retro/compare2_spawnbio_uncertainty.png){width=100% height=100% alt="Change in the estimate of spawning output when the most recent 5 years of data area removed sequentially."}


![Change in the estimate of fraction unfished when the most recent 5 years of data area removed sequentially.\label{fig:retro-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_retro/compare4_Bratio_uncertainty.png){width=100% height=100% alt="Change in the estimate of fraction unfished when the most recent 5 years of data area removed sequentially."}

<!-- ====================================================================== -->
<!-- ******************      Likelihoods      ***************************** --> 
<!-- ====================================================================== -->


![Change in the negative log-likelihood across a range of log(R0) values.\label{fig:r0-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_profile_SR_LN(R0)/piner_panel_SR_LN(R0).png){width=100% height=100% alt="Change in the negative log-likelihood across a range of log(R0) values."}


![Change in the estimate of spawning output across a range of log(R0) values.\label{fig:r0-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_profile_SR_LN(R0)/SR_LN(R0)_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning output across a range of log(R0) values."}


![Change in the estimate of fraction unfished across a range of log(R0) values.\label{fig:r0-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_profile_SR_LN(R0)/SR_LN(R0)_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of log(R0) values."}


![Change in the negative log-likelihood across a range of steepness values.\label{fig:h-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_profile_SR_BH_steep/piner_panel_SR_BH_steep.png){width=100% height=100% alt="Change in the negative log-likelihood across a range of steepness values."}


![Change in the estimate of spawning output across a range of steepness values.\label{fig:h-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_profile_SR_BH_steep/SR_BH_steep_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning output across a range of steepness values."}


![Change in the estimate of fraction unfished across a range of steepness values.\label{fig:h-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_profile_SR_BH_steep/SR_BH_steep_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of steepness values."}


![Change in the negative log-likelihood across a range of female natural mortality values.\label{fig:m-profile}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_profile_NatM_p_1_Fem_GP_1/piner_panel_NatM_p_1_Fem_GP_1.png){width=100% height=100% alt="Change in the negative log-likelihood across a range of female natural mortality values."}


![Change in the estimate of spawning output across a range of female natural mortality values.\label{fig:m-ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_profile_NatM_p_1_Fem_GP_1/NatM_p_1_Fem_GP_1_trajectories_compare1_spawnbio.png){width=100% height=100% alt="Change in the estimate of spawning output across a range of female natural mortality values."}


![Change in the estimate of fraction unfished across a range of female natural values.\label{fig:m-depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base_profile_NatM_p_1_Fem_GP_1/NatM_p_1_Fem_GP_1_trajectories_compare3_Bratio.png){width=100% height=100% alt="Change in the estimate of fraction unfished across a range of female natural values."}


<!-- ====================================================================== -->
<!-- ******************    Reference Points    **************************** --> 
<!-- ====================================================================== -->



![Estimated 1 - relative spawning ratio (SPR) by year.\label{fig:1-spr}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/SPR2_minusSPRseries.png){width=100% height=100% alt="Estimated 1 - relative spawning ratio (SPR) by year."}


![Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivity and with steepness fixed at 0.72.\label{fig:yield}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/yield2_yield_curve_with_refpoints.png){width=100% height=100% alt="Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivity and with steepness fixed at 0.72."}


\newpage

<!--chapter:end:53figures.Rmd-->


# Appendix A. Detailed Fit to Length Composition Data 



![Length comps, whole catch, WA_Recreational (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method..\label{fig:comp_lenfit_flt1mkt0_page1}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/comp_lenfit_flt1mkt0_page1.png){width=100% height=100% alt="Length comps, whole catch, WA_Recreational (plot 1 of 2).<br><br>'N adj.' is the input sample size after data-weighting adjustment. N eff. is the calculated effective sample size used in the McAllister-Iannelli tuning method.."}

![Length comps, whole catch, WA_Recreational (plot 2 of 2).\label{fig:comp_lenfit_flt1mkt0_page2}](C:/Assessments/2021/copper_rockfish_2021/models/wa/7.0_base/plots/comp_lenfit_flt1mkt0_page2.png){width=100% height=100% alt="Length comps, whole catch, WA_Recreational (plot 2 of 2)."}

<!--chapter:end:54appendix.Rmd-->

<!-- If you want to references to appear somewhere before the end, add: -->
<!-- <div id="refs"></div> -->
<!-- where you want it to appear -->

\clearpage

# References

<!-- The following sets the appropriate indentation for the references
  but it cannot be used with bookdown and the make file because it leads
  to a bad pdf.
\noindent
\vspace{-2em}
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\setlength{\parskip}{8pt}
 -->

<!--chapter:end:55bibliography.Rmd-->

