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


\input{C:/Assessments/2021/copper_rockfish_2021/models/wa/0.0_init_model/tables/TimeSeries.tex}

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
<!-- ***********************    Biology         *************************** --> 
<!-- ====================================================================== --> 



![Survey length-at-weight data with sex specific estimated fits..\label{fig:len-weight}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Weight_Sex.png){width=100% height=100% alt="Survey length-at-weight data with sex specific estimated fits.."}


![Comparison of the length-at-weight data from the NWFSC Hook and Line and the NWFSC WCGBT surveys..\label{fig:len-weight-survey}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Weight_Source.png){width=100% height=100% alt="Comparison of the length-at-weight data from the NWFSC Hook and Line and the NWFSC WCGBT surveys.."}


![Length-at-age data from the with sex specific estimated growth..\label{fig:len-age}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Length_Age_by_Sex.png){width=100% height=100% alt="Length-at-age data from the with sex specific estimated growth.."}


![Observed length-at-age by data source..\label{fig:len-age-data}](//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/plots/doc_Data_Length_Age_by_Sex.png){width=100% height=100% alt="Observed length-at-age by data source.."}



<!-- ====================================================================== -->
<!-- **************** Recreational Length Samples    ********************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- *************************     Biology     **************************** --> 
<!-- ====================================================================== -->


![Length at age in the beginning of the year in the ending year of the model.\label{fig:len-at-age}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/bio1_sizeatage.png){width=100% height=100% alt="Length at age in the beginning of the year in the ending year of the model."}


![Weight at length by sex.\label{fig:weight}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/bio5_weightatsize.png){width=100% height=100% alt="Weight at length by sex."}


![Maturity at length.\label{fig:maturity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/bio6_maturity.png){width=100% height=100% alt="Maturity at length."}


![Fecundity at a function of length.\label{fig:fecundity}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/bio9_fecundity_len.png){width=100% height=100% alt="Fecundity at a function of length."}

<!-- ====================================================================== -->
<!-- *********************   Estimated SSB   ****************************** --> 
<!-- ====================================================================== -->

<!-- ====================================================================== -->
<!-- *********************    Selectivity            ********************** --> 
<!-- ====================================================================== -->


![Selectivity at length by fleet.\label{fig:selex}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/sel01_multiple_fleets_length1.png){width=100% height=100% alt="Selectivity at length by fleet."}

<!-- ====================================================================== -->
<!-- *********************   Recruitment     ****************************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- ****************** Fit to the Length Data **************************** --> 
<!-- ====================================================================== -->


<!-- ====================================================================== -->
<!-- ******************      Time Series       **************************** --> 
<!-- ====================================================================== -->


![Estimate time series of spawning output..\label{fig:ssb}](C:/Assessments/2021/copper_rockfish_2021/models/wa/5.4_selex_dome_recdevs/plots/ts7_Spawning_output.png){width=100% height=100% alt="Estimate time series of spawning output.."}

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

