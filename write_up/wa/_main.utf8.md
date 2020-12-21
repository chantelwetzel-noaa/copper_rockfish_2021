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
This assessment reports the status of copper rockfish (_Sebastes caurinus_) off the US West coast using data through 2020. Copper rockfish is a medium- to large-sized nearshore rockfish found from Mexico to Alaska.  The core range is comparatively large, from northern Baja Mexico to the Gulf of Alaska, as well as in Puget Sound.  They occur mostly on low relief or sand-rock interfaces.  Copper rockfish have historically been a part of both commercial (mainly in the live-fish fishery) and recreational fisheries throughout its range.  

## Life History
Genetic work has revealed significant differences between Puget Sound and coastal stocks, but not among the coastal stocks (XXX Buonaccorsi et al. 2002). copper rockfish live at least 50 years (XX add reference XX) and have the highest vulnerability (V = 2.27) of any West Coast groundfish (XX add reference XX).  

## Ecosystem Considerations
Replace text.

## Historical and Current Fishery Information
Replace text.

## Summary of Management History and Performance
Replace text.

## Foreign Fisheries
Replace text.

<!--chapter:end:11introduction.Rmd-->

# Data

A description of each data source is provided below (Figure \ref{fig:data-plot}).

<!--chapter:end:20data.Rmd-->

## Fishery-Dependent Data

[@ralston_documentation_2010]

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


The length-at-age was estimated for male and female copper rockfish using data collected from fishery-dependent data sources off the coast of Oregon and Washington that were collected from 1998-2019 (Figure \ref{fig:len-age-data}). Figure \ref{fig:len-age} shows the lengths and ages for all years by data source as well as predicted von Bertalanffy fits to the data. Females grow larger than males and sex-specific growth parameters were estimated at the following values:

\begin{centering}

Females $L_{\infty}$ = 49.6 cm; $k$ = 0.152

Males $L_{\infty}$ = 47.8 cm; $k$ = 0.182

\end{centering}

These values were fixed within the base model for male and female copper rockfish.

### Maturation and Fecundity


Maturity-at-length based on the work of Hannah [-@hannah_length_2014] which estimated the 50% size-at-maturity of 34.83 cm off the coast of Oregon with maturity asymptoting to 1.0 for larger fish (Figure \ref{fig:maturity}).  

The fecundity-at-length was based on research Dick et al. [-@dick_meta-analysis_2017]. The fecundity relationship for copper rockfish was estimated equal to 3.362e-07$L$^3.68^ in millions of eggs where $L$ is length in cm. Fecundity-at-length is shown in Figure \ref{fig:fecundity}.

### Sex Ratio


There was limited sex specific observations by length or age for all biological data sources (Figures \ref{fig:len-sex-ratio} and \ref{fig:age-sex-ratio}). The sex ratio of young fish was assumed to be 1:1. 

<!--chapter:end:22biology.Rmd-->

# Assessment Model

## Summary of Previous Assessments 

Copper rockfish was last assesseed in 2013 [@cope_data-moderate_2013]. The stock was assessed using extended depletion-based stock reduction analysis (XDB-SRA) a data-moderate approach which incorporated catch and index data with prior on select parameters (natural mortality, stock status in a specified year, productivity, and the relative status of maximum productivity). Copper rockfish was assessed as two separated stocks, the area South of Pt. Conception off the California coast and the area North of Pt. Conception to the Washington Canada border. The 2013 assessment estimated the stock South of Pt. Conception at 75% of unfished spawning output North of Pt. Conception at 48% of unfished spawning output. 


## Model Structure and Assumptions



### Modeling Platform and Structure

Stock Synthesis version 3.30.16 was used to estimate the parameters in the model. The R package r4ss, version XXX, along with R version 4.0.1 were used to investigate and plot model fits. 


### Model Parameters
Describe estimated vs. fixed parameters, priors

### Key Assumptions and Structural Choices


<!--chapter:end:30model.Rmd-->

## Base Model Results


### Parameter Estimates

### Fits to the Data

### Population Trajectory

### Reference Points



<!--chapter:end:33results.Rmd-->

## Model Diagnostics
Describe all diagnostics

### Convergence

### Sensitivity Analyses

### Retrospective Analysis

### Likelihood Profiles

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

<!--chapter:end:41acknowledgments.Rmd-->

# Tables

\begingroup\fontsize{10}{12}\selectfont
\begingroup\fontsize{10}{12}\selectfont

\begin{longtable}[t]{r>{\centering\arraybackslash}p{2cm}>{\centering\arraybackslash}p{2cm}>{\centering\arraybackslash}p{2cm}}
\caption{(\#tab:allmortality)Removals by fleet for all model years.}\\
\toprule
Year & Recreational (mt) & Commercial (mt) & Total Mortality\\
\midrule
\endfirsthead
\caption[]{(\#tab:allmortality)Removals by fleet for all model years. \textit{(continued)}}\\
\toprule
Year & Recreational (mt) & Commercial (mt) & Total Mortality\\
\midrule
\endhead

\endfoot
\bottomrule
\endlastfoot
1935 & 0.02 & 0.00 & 0.02\\
1936 & 0.05 & 0.00 & 0.05\\
1937 & 0.08 & 0.00 & 0.08\\
1938 & 0.12 & 0.00 & 0.12\\
1939 & 0.15 & 0.00 & 0.15\\
1940 & 0.19 & 0.00 & 0.19\\
1941 & 0.22 & 0.00 & 0.22\\
1942 & 0.25 & 0.00 & 0.25\\
1943 & 0.29 & 0.00 & 0.29\\
1944 & 0.32 & 0.00 & 0.32\\
1945 & 0.36 & 0.00 & 0.36\\
1946 & 0.39 & 0.00 & 0.39\\
1947 & 0.42 & 0.00 & 0.42\\
1948 & 0.45 & 0.00 & 0.45\\
1949 & 0.49 & 0.00 & 0.49\\
1950 & 0.52 & 0.00 & 0.52\\
1951 & 0.56 & 0.00 & 0.56\\
1952 & 0.59 & 0.00 & 0.59\\
1953 & 0.62 & 0.00 & 0.62\\
1954 & 0.65 & 0.00 & 0.65\\
1955 & 0.69 & 0.00 & 0.69\\
1956 & 0.72 & 0.00 & 0.72\\
1957 & 0.75 & 0.00 & 0.75\\
1958 & 0.78 & 0.00 & 0.78\\
1959 & 0.82 & 0.00 & 0.82\\
1960 & 0.85 & 0.00 & 0.85\\
1961 & 0.88 & 0.00 & 0.88\\
1962 & 0.91 & 0.00 & 0.91\\
1963 & 0.94 & 0.00 & 0.94\\
1964 & 0.98 & 0.00 & 0.98\\
1965 & 1.01 & 0.00 & 1.01\\
1966 & 1.04 & 0.00 & 1.04\\
1967 & 1.07 & 0.00 & 1.07\\
1968 & 1.10 & 0.00 & 1.10\\
1969 & 1.13 & 0.00 & 1.13\\
1970 & 1.16 & 0.00 & 1.16\\
1971 & 1.19 & 0.00 & 1.19\\
1972 & 1.22 & 0.00 & 1.22\\
1973 & 1.25 & 0.00 & 1.25\\
1974 & 1.27 & 0.00 & 1.27\\
1975 & 1.30 & 0.00 & 1.30\\
1976 & 0.94 & 0.00 & 0.94\\
1977 & 0.58 & 0.00 & 0.58\\
1978 & 1.07 & 0.00 & 1.07\\
1979 & 1.42 & 0.00 & 1.42\\
1980 & 0.83 & 0.00 & 0.83\\
1981 & 1.85 & 0.00 & 1.85\\
1982 & 1.94 & 0.00 & 1.94\\
1983 & 1.18 & 0.00 & 1.18\\
1984 & 1.87 & 0.00 & 1.87\\
1985 & 1.61 & 0.20 & 1.80\\
1986 & 1.93 & 0.19 & 2.12\\
1987 & 2.31 & 0.93 & 3.25\\
1988 & 2.14 & 0.25 & 2.39\\
1989 & 2.15 & 0.00 & 2.15\\
1990 & 2.71 & 0.03 & 2.74\\
1991 & 1.94 & 0.00 & 1.94\\
1992 & 3.02 & 0.00 & 3.02\\
1993 & 2.18 & 0.01 & 2.19\\
1994 & 1.38 & 0.00 & 1.38\\
1995 & 1.67 & 0.00 & 1.67\\
1996 & 1.91 & 0.00 & 1.91\\
1997 & 1.83 & 0.00 & 1.83\\
1998 & 1.89 & 0.00 & 1.89\\
1999 & 1.94 & 0.00 & 1.94\\
2000 & 2.08 & 0.00 & 2.08\\
2001 & 2.18 & 0.00 & 2.18\\
2002 & 1.48 & 0.00 & 1.48\\
2003 & 1.86 & 0.00 & 1.86\\
2004 & 1.91 & 0.00 & 1.92\\
2005 & 5.58 & 0.00 & 5.58\\
2006 & 2.68 & 0.00 & 2.68\\
2007 & 2.75 & 0.00 & 2.75\\
2008 & 2.94 & 0.00 & 2.94\\
2009 & 2.74 & 0.00 & 2.74\\
2010 & 2.24 & 0.00 & 2.24\\
2011 & 2.90 & 0.00 & 2.90\\
2012 & 2.01 & 0.00 & 2.01\\
2013 & 3.01 & 0.00 & 3.01\\
2014 & 2.81 & 0.00 & 2.81\\
2015 & 1.58 & 0.00 & 1.58\\
2016 & 2.20 & 0.00 & 2.20\\
2017 & 1.50 & 0.01 & 1.51\\
2018 & 3.39 & 0.00 & 3.39\\
2019 & 4.55 & 0.00 & 4.55\\
2020 & 2.69 & 0.00 & 2.69\\*
\end{longtable}
\endgroup{}
\endgroup{}
\newpage

<!-- ======================================================= -->
<!-- ***************       Data      *********************** --> 
<!-- ======================================================= -->

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
NatM p 1 Fem GP 1 & 0.1080000 & -2 & (0.05, 0.4) & NA & NA & Log Norm (-2.2256, 0.48)\\
L at Amin Fem GP 1 & 15.7000000 & -2 & (3, 25) & NA & NA & None\\
L at Amax Fem GP 1 & 49.6000000 & -2 & (35, 60) & NA & NA & None\\
VonBert K Fem GP 1 & 0.1520000 & -2 & (0.03, 0.3) & NA & NA & None\\
CV young Fem GP 1 & 0.1000000 & -2 & (0.01, 0.3) & NA & NA & None\\
CV old Fem GP 1 & 0.1000000 & -2 & (0.01, 0.3) & NA & NA & None\\
Wtlen 1 Fem GP 1 & 0.0000096 & -9 & (0, 0.1) & NA & NA & None\\
Wtlen 2 Fem GP 1 & 3.1900000 & -9 & (2, 4) & NA & NA & None\\
Mat50% Fem GP 1 & 34.8260000 & -9 & (10, 60) & NA & NA & None\\
Mat slope Fem GP 1 & -0.6000000 & -9 & (-1, 0) & NA & NA & None\\
Eggs scalar Fem GP 1 & 0.0000003 & -9 & (-3, 3) & NA & NA & None\\
Eggs exp len Fem GP 1 & 3.6790000 & -9 & (-3, 3) & NA & NA & None\\
NatM p 1 Mal GP 1 & 0.1080000 & -2 & (0.05, 0.4) & NA & NA & Log Norm (-2.2256, 0.48)\\
L at Amin Mal GP 1 & 13.9000000 & -2 & (3, 25) & NA & NA & None\\
L at Amax Mal GP 1 & 47.8000000 & -2 & (35, 60) & NA & NA & None\\
VonBert K Mal GP 1 & 0.1820000 & -2 & (0.03, 0.3) & NA & NA & None\\
CV young Mal GP 1 & 0.1000000 & -2 & (0.01, 0.3) & NA & NA & None\\
CV old Mal GP 1 & 0.1000000 & -2 & (0.01, 0.3) & NA & NA & None\\
Wtlen 1 Mal GP 1 & 0.0000108 & -9 & (0, 0.1) & NA & NA & None\\
Wtlen 2 Mal GP 1 & 3.1500000 & -9 & (2, 4) & NA & NA & None\\
FracFemale GP 1 & 0.5000000 & -9 & (0.01, 0.99) & NA & NA & None\\
SR LN(R0) & 1.5627300 & 1 & (1, 20) & OK & 0.150831 & None\\
SR BH steep & 0.7200000 & -7 & (0.22, 1) & NA & NA & Normal (0.72, 0.09)\\
SR sigmaR & 0.9000000 & -99 & (0.15, 1) & NA & NA & None\\
SR regime & 0.0000000 & -99 & (-2, 2) & NA & NA & None\\
SR autocorr & 0.0000000 & -99 & (0, 0) & NA & NA & None\\
Early InitAge 1 & -0.0184066 & 5 & (-5, 5) & act & 0.892105 & dev (NA, NA)\\
Size DblN peak WA Recreational(1) & 39.9812000 & 2 & (15, 50) & OK & 1.165670 & None\\
Size DblN top logit WA Recreational(1) & -1.4692600 & -2 & (-7, 7) & NA & NA & None\\
Size DblN ascend se WA Recreational(1) & 3.9245300 & 3 & (-10, 10) & OK & 0.167349 & None\\
Size DblN descend se WA Recreational(1) & 6.0000000 & -4 & (-10, 10) & NA & NA & None\\
Size DblN start logit WA Recreational(1) & -20.0000000 & -9 & (-20, 30) & NA & NA & None\\
Size DblN end logit WA Recreational(1) & -9.2687300 & 3 & (-10, 10) & OK & 17.711800 & None\\*
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
<!-- ********  Reference Points & Management *************** --> 
<!-- ======================================================= -->

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/e_ReferencePoints_ES.tex}

\newpage

\input{C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/g_Projections_ES.tex}

<!--chapter:end:52tables.Rmd-->

# Figures


<!-- ====================================================================== -->  
<!-- ****************** Catches Used in the Model ************************* --> 
<!-- ====================================================================== -->  

![Catches by year for the recreational and commercial fleets in the model.\label{fig:catch}](figs/catches_wa.png){width=100% height=100% alt="Catches by year for the recreational and commercial fleets in the model"}


<!-- ====================================================================== --> 
<!-- ******************* Data Used in the Model *************************** --> 
<!-- ====================================================================== --> 


![Summary of data sources used in the base model.\label{fig:data-plot}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/data_plot.png){width=100% height=100% alt="Summary of data sources used in the base model."}


<!-- ====================================================================== -->
<!-- ****************   Commercial Length Samples    ********************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- **************** Recreational Length Samples    ********************** --> 
<!-- ====================================================================== -->


![Length composition data from the recreational fleet.\label{fig:wa-len-data}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/comp_lendat_bubflt1mkt0_page2.png){width=100% height=100% alt="Length composition data from the recreational fleet."}


![Mean length for recreational fleet with 95 percent confidence intervals.\label{fig:mean-len-data}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/comp_lendat_data_weighting_TA1.8_WA_Recreational.png){width=100% height=100% alt="Mean length for recreational fleet with 95 percent confidence intervals."}


<!-- ====================================================================== -->
<!-- *************************     Biology     **************************** --> 
<!-- ====================================================================== -->


![Comparison of the length-at-weight data from the NWFSC Hook and Line and the NWFSC WCGBT surveys.\label{fig:len-weight-survey}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Weight_Source.png){width=100% height=100% alt="Comparison of the length-at-weight data from the NWFSC Hook and Line and the NWFSC WCGBT surveys."}


![Survey length-at-weight data with sex specific estimated fits.\label{fig:len-weight}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Weight_Sex.png){width=100% height=100% alt="Survey length-at-weight data with sex specific estimated fits."}



![Observed length-at-age by data source.\label{fig:len-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Data_Length_Age_by_Sex.png){width=100% height=100% alt="Observed length-at-age by data source."}


![Length-at-age data from the with sex specific estimated growth.\label{fig:len-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Age_by_Sex.png){width=100% height=100% alt="Length-at-age data from the with sex specific estimated growth."}



![Maturity as a function of  length.\label{fig:maturity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/bio6_maturity.png){width=100% height=100% alt="Maturity as a function of  length."}


![Fecundity as a function of length.\label{fig:fecundity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/bio9_fecundity_len.png){width=100% height=100% alt="Fecundity as a function of length."}


![Fraction female by length across all available data sources.\label{fig:len-sex-ratio}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/Length_fraction_female.png){width=100% height=100% alt="Fraction female by length across all available data sources."}


![Fraction female by age across all available data sources.\label{fig:age-sex-ratio}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/Age_fraction_female.png){width=100% height=100% alt="Fraction female by age across all available data sources."}

<!-- ====================================================================== -->
<!-- *********************    Selectivity            ********************** --> 
<!-- ====================================================================== -->


![Selectivity at length by fleet.\label{fig:selex}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/sel01_multiple_fleets_length1.png){width=100% height=100% alt="Selectivity at length by fleet."}

<!-- ====================================================================== -->
<!-- *********************   Recruitment     ****************************** --> 
<!-- ====================================================================== -->


![Estimated time series of age-0 recruits (1000s).\label{fig:recruits}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/ts11_Age-0_recruits_(1000s)_with_95_asymptotic_intervals.png){width=100% height=100% alt="Estimated time series of age-0 recruits (1000s)."}


<!-- ====================================================================== -->
<!-- ****************** Fit to the Length Data **************************** --> 
<!-- ====================================================================== -->


![Length at age in the beginning of the year in the ending year of the model.\label{fig:len-age-ss}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/bio1_sizeatage.png){width=100% height=100% alt="Length at age in the beginning of the year in the ending year of the model."}



![Pearson residuals for recreational fleet. Closed bubble are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected).\label{fig:rec-pearson}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/comp_lenfit_residsflt1mkt0_page2.png){width=100% height=100% alt="Pearson residuals for recreational fleet. Closed bubble are positive residuals (observed > expected) and open bubbles are negative residuals (observed < expected)."}


![Mean length for recreational with 95 percent confidence intervals based on current samples sizes.\label{fig:rec-mean-len-fit}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/comp_lenfit_data_weighting_TA1.8_WA_Recreational.png){width=100% height=100% alt="Mean length for recreational with 95 percent confidence intervals based on current samples sizes."}


![Aggregated length comps over all years.\label{fig:agg-len-fit}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/comp_lenfit__aggregated_across_time.png){width=100% height=100% alt="Aggregated length comps over all years."}

<!-- ====================================================================== -->
<!-- ******************      Time Series       **************************** --> 
<!-- ====================================================================== -->


![Estimated time series of spawning output.\label{fig:ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/ts7_Spawning_output_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="Estimated time series of spawning output."}


![Estimated time series of total biomass.\label{fig:tot-bio}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/ts1_Total_biomass_(mt).png){width=100% height=100% alt="Estimated time series of total biomass."}


![Estimated time series of fraction of unfished spawning output.\label{fig:depl}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/ts9_Fraction_of_unfished_with_95_asymptotic_intervals_intervals.png){width=100% height=100% alt="Estimated time series of fraction of unfished spawning output."}


<!-- ====================================================================== -->
<!-- ******************       Sensitivity     ***************************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- ******************     Retrospectives    ***************************** --> 
<!-- ====================================================================== -->



<!-- ====================================================================== -->
<!-- ******************      Likelihoods      ***************************** --> 
<!-- ====================================================================== -->



<!-- ====================================================================== -->
<!-- ******************    Reference Points    **************************** --> 
<!-- ====================================================================== -->



![Estimated 1 - relative spawning ratio (SPR) by year.\label{fig:1-spr}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/SPR2_minusSPRseries.png){width=100% height=100% alt="Estimated 1 - relative spawning ratio (SPR) by year."}


![Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivity and with steepness fixed at 0.72.\label{fig:yield}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/yield2_yield_curve_with_refpoints.png){width=100% height=100% alt="Equilibrium yield curve for the base case model. Values are based on the 2020
fishery selectivity and with steepness fixed at 0.72."}

<!--chapter:end:53figures.Rmd-->

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

<!--chapter:end:54bibliography.Rmd-->

