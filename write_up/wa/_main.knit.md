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


### Maturation and Fecundity


NEED TO UPDATE WHEN MELISSA IS DONE

Maturity-at-length based on the work of Hannah XXX which estimated the 50% size-at-maturity of 34.83 cm off the coast of Oregon with maturity asymptoting to 1.0 for larger fish (Figure ADD FIGURE).

This assessment assumed a logistic maturity-at-length curve based on analysis of XXX fish maturity samples collected from the NWFSC WCGBT and NWFSC Hook & Line surveys.  The new maturity-at-length curve is based on the estimate of functional maturity, an approach that classifies rockfish maturity with developing oocytes as mature or immature based on the proportion of vitellogenin in the cytoplasm and the measured frequency of atretic cells (Melissa Head, personal communication, NWFSC, NOAA).  The 50% size-at-maturity was estimated at XX cm with maturity asymptoting to 1.0 for larger fish (Figure ADD FIGURE).  

The fecundity-at-length was based on research Dick et al. [-@dick_meta-analysis_2017]. The fecundity relationship for copper rockfish was estimated equal to 3.362e-07$L$^3.68^ in millions of eggs where $L$ is length in cm. Fecundity-at-length is shown in Figure ADD FIGURE.

### Sex Ratio


There was limited sex specific observations by length or age for all biological data sources. The sex ratio of young fish was assumed to be 1:1. 


### Length-Weight Relationship


The length-weight relationship for copper rockfish was estimated outside the model using all coastwide biological data available from fishery-independent data sources, where the female weight-at-length in grams was estimated at 9.56e-06$L$^3.19^ and males at 1.08e-05$L$^3.15^ where $L$ is length in cm (Figures ADD FIGURE).

### Growth (Length-at-Age)


The length-at-age was estimated for male and female copper rockfish using data collected from fishery-dependent data sources off the coast of Oregon and Washington that were collected from 1998-2019. Figure ADD FIGURE shows the lengths and ages for all years as well as predicted von Bertalanffy fits to the data. Females grow larger than males and sex-specific growth parameters were estimated at the following values:

\begin{centering}

Females $L_{\infty}$ = 49.6 cm; $k$ = 0.152

Males $L_{\infty}$ = 47.8 cm; $k$ = 0.182

\end{centering}

These values were fixed within the base model for male and female copper rockfish.


<!--chapter:end:22biology.Rmd-->

# Assessment Model


<!--chapter:end:30model.Rmd-->

## Summary of Previous Assessments and Reviews


### History of Modeling Approaches (not required for an update assessment)


### Most Recent STAR Panel and SSC Recommendations (not required for an update assessment)


### Response to Groundfish Subcommittee Requests (not required in draft)

<!--chapter:end:31summary.Rmd-->

## Model Structure and Assumptions


### Model Changes from the Last Assessment (not required for an update assessment)


### Modeling Platform and Structure
General model specifications (e.g., executable version, model structure, definition of fleets and areas)


### Model Parameters
Describe estimated vs. fixed parameters, priors

### Key Assumptions and Structural Choices

<!--chapter:end:32structure.Rmd-->

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
1937 & 0.09 & 0.00 & 0.09\\
1938 & 0.12 & 0.00 & 0.12\\
1939 & 0.16 & 0.00 & 0.16\\
1940 & 0.19 & 0.00 & 0.19\\
1941 & 0.23 & 0.00 & 0.23\\
1942 & 0.26 & 0.00 & 0.26\\
1943 & 0.30 & 0.00 & 0.30\\
1944 & 0.33 & 0.00 & 0.33\\
1945 & 0.37 & 0.00 & 0.37\\
1946 & 0.40 & 0.00 & 0.40\\
1947 & 0.44 & 0.00 & 0.44\\
1948 & 0.47 & 0.00 & 0.47\\
1949 & 0.51 & 0.00 & 0.51\\
1950 & 0.54 & 0.00 & 0.54\\
1951 & 0.58 & 0.00 & 0.58\\
1952 & 0.61 & 0.00 & 0.61\\
1953 & 0.64 & 0.00 & 0.64\\
1954 & 0.68 & 0.00 & 0.68\\
1955 & 0.71 & 0.00 & 0.71\\
1956 & 0.75 & 0.00 & 0.75\\
1957 & 0.78 & 0.00 & 0.78\\
1958 & 0.81 & 0.00 & 0.81\\
1959 & 0.85 & 0.00 & 0.85\\
1960 & 0.88 & 0.00 & 0.88\\
1961 & 0.91 & 0.00 & 0.91\\
1962 & 0.95 & 0.00 & 0.95\\
1963 & 0.98 & 0.00 & 0.98\\
1964 & 1.01 & 0.00 & 1.01\\
1965 & 1.05 & 0.00 & 1.05\\
1966 & 1.08 & 0.00 & 1.08\\
1967 & 1.11 & 0.00 & 1.11\\
1968 & 1.14 & 0.00 & 1.14\\
1969 & 1.18 & 0.00 & 1.18\\
1970 & 1.21 & 0.00 & 1.21\\
1971 & 1.24 & 0.00 & 1.24\\
1972 & 1.27 & 0.00 & 1.27\\
1973 & 1.31 & 0.00 & 1.31\\
1974 & 1.34 & 0.00 & 1.34\\
1975 & 1.37 & 0.00 & 1.37\\
1976 & 0.99 & 0.00 & 0.99\\
1977 & 0.61 & 0.00 & 0.61\\
1978 & 1.13 & 0.00 & 1.13\\
1979 & 1.50 & 0.00 & 1.50\\
1980 & 0.88 & 0.00 & 0.88\\
1981 & 1.96 & 0.00 & 1.96\\
1982 & 2.06 & 0.00 & 2.06\\
1983 & 1.26 & 0.00 & 1.26\\
1984 & 2.00 & 0.00 & 2.00\\
1985 & 1.72 & 0.20 & 1.92\\
1986 & 2.07 & 0.19 & 2.26\\
1987 & 2.48 & 0.93 & 3.42\\
1988 & 2.31 & 0.25 & 2.56\\
1989 & 2.34 & 0.00 & 2.34\\
1990 & 2.99 & 0.03 & 3.02\\
1991 & 2.19 & 0.00 & 2.19\\
1992 & 3.55 & 0.00 & 3.55\\
1993 & 2.77 & 0.01 & 2.78\\
1994 & 1.93 & 0.00 & 1.93\\
1995 & 2.48 & 0.00 & 2.48\\
1996 & 2.87 & 0.00 & 2.87\\
1997 & 2.72 & 0.00 & 2.72\\
1998 & 2.77 & 0.00 & 2.77\\
1999 & 2.81 & 0.00 & 2.81\\
2000 & 2.94 & 0.00 & 2.94\\
2001 & 2.96 & 0.00 & 2.96\\
2002 & 1.91 & 0.00 & 1.91\\
2003 & 2.25 & 0.00 & 2.25\\
2004 & 2.22 & 0.00 & 2.22\\
2005 & 6.20 & 0.00 & 6.20\\
2006 & 2.87 & 0.00 & 2.87\\
2007 & 2.89 & 0.00 & 2.89\\
2008 & 3.04 & 0.00 & 3.04\\
2009 & 2.72 & 0.00 & 2.72\\
2010 & 2.13 & 0.00 & 2.13\\
2011 & 2.63 & 0.00 & 2.63\\
2012 & 1.75 & 0.00 & 1.75\\
2013 & 2.55 & 0.00 & 2.55\\
2014 & 2.34 & 0.00 & 2.34\\
2015 & 1.32 & 0.00 & 1.32\\
2016 & 1.85 & 0.00 & 1.85\\
2017 & 1.29 & 0.01 & 1.30\\
2018 & 3.02 & 0.00 & 3.02\\
2019 & 4.27 & 0.00 & 4.27\\
2020 & 2.77 & 0.00 & 2.77\\*
\end{longtable}
\endgroup{}
\endgroup{}


\input{C:/Assessments/2021/copper_rockfish_2021/models/wa/0.0_init_model/tables/TimeSeries.tex}

<!--chapter:end:52tables.Rmd-->

# Figures


<!-- ====================================================================== -->  
<!-- ****************** Catches Used in the Model ************************* --> 
<!-- ====================================================================== -->  



<!-- ====================================================================== --> 
<!-- ******************* Data Used in the Model *************************** --> 
<!-- ====================================================================== --> 


![Summary of data sources used in the base model.\label{fig:data-plot}](C:/Assessments/2021/copper_rockfish_2021/models/wa/0.0_init_model/plots/data_plot.png){width=100% height=100% alt="Summary of data sources used in the base model."}


<!-- ====================================================================== -->
<!-- **************** Recreational Length Samples    ********************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- *************************     Biology     **************************** --> 
<!-- ====================================================================== -->


![Length at age in the beginning of the year in the ending year of the model.\label{fig:len-at-age}](C:/Assessments/2021/copper_rockfish_2021/models/wa/0.0_init_model/plots/bio1_sizeatage.png){width=100% height=100% alt="Length at age in the beginning of the year in the ending year of the model."}


![Weight at length by sex.\label{fig:weight}](C:/Assessments/2021/copper_rockfish_2021/models/wa/0.0_init_model/plots/bio5_weightatsize.png){width=100% height=100% alt="Weight at length by sex."}


![Maturity at length.\label{fig:maturity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/0.0_init_model/plots/bio6_maturity.png){width=100% height=100% alt="Maturity at length."}


![Fecundity at a function of length.\label{fig:fecundity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/0.0_init_model/plots/bio9_fecundity_len.png){width=100% height=100% alt="Fecundity at a function of length."}

<!-- ====================================================================== -->
<!-- *********************   Estimated SSB   ****************************** --> 
<!-- ====================================================================== -->

<!-- ====================================================================== -->
<!-- *********************    Selectivity            ********************** --> 
<!-- ====================================================================== -->


![Selectivity at length by fleet.\label{fig:selex}](C:/Assessments/2021/copper_rockfish_2021/models/wa/0.0_init_model/plots/sel01_multiple_fleets_length1.png){width=100% height=100% alt="Selectivity at length by fleet."}

<!-- ====================================================================== -->
<!-- *********************   Recruitment     ****************************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- ****************** Fit to the Length Data **************************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- ******************      Time Series       **************************** --> 
<!-- ====================================================================== -->


![Test figure.\label{fig:test}](C:/Assessments/2021/copper_rockfish_2021/models/wa/0.0_init_model/plots/ts7_Spawning_output.png){width=100% height=100% alt="Test figure."}
<!-- ====================================================================== -->
<!-- ******************    Reference Points    **************************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- ******************       Sensitivity     ***************************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- ******************     Retrospectives    ***************************** --> 
<!-- ====================================================================== -->



<!-- ====================================================================== -->
<!-- ******************      Likelihoods      ***************************** --> 
<!-- ====================================================================== -->

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

