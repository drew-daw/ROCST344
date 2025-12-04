# Spatial Analysis



## Comparing Sub-Regions

\begin{figure}

{\centering \includegraphics{FullQuestionOne_files/figure-latex/lookGeneral-1} 

}

\caption{Sourced From SDG4 Global Database (Indicator 4.1.1)}(\#fig:lookGeneral)
\end{figure}
<!-- results of the plot -->

Within Figure 1.1, the highlighted box plots show each Sub Region's mean being less than the mean for the overall Education Level -- for clarity the red crosses are the means for each Sub Region, whilst the black points are the outliers. 

Within the Primary section, outlier are shown in Latin America and the Caribbean, Northern Africa, and Sub-Saharan Africa. This aligns with the findings discussed later in Section 1.2. Additionally, South-east Asia shows an incredible spread of data, with the IQR being 61.23. 

Within the Lower Secondary section, only one Sub-Region displays an outlier, being Northern Africa. Interestingly, this outlier is still below the mean for lower secondary schools, displaying that Northern Africa is an area of concern. Additionally, South-east Asia is the only Sub-Region where the mean falls below the grand mean, but the third quartile is higher. This shows much more spread across the Sub-Region. 

<!-- Discussion/Critical Evaluation) -->

Whilst the Lower Secondary mean, being 63.32, is higher than the Primary's mean, being 52.07, it is important to consider the two means are not independent of another. In other words, in order to get into secondary school one must pass primary, thus the grand mean of the Primary schools would affect the mean of the Lower Secondary schools. 

South-east Asia also demonstrates the most spread across the sub-regions. Contextually, this aligns with the general developmental growth of the region, and educational access within the region. For instance, Singapore is often credited of being within the top ten countries for their education system; however, other countries within the region usually fall behind [@topCont]. 

\newpage

## Lowest Performing Countries






\begin{table}
\centering
\caption{(\#tab:tableWorst)Worst 10 countries for Indicator 4.1.2 (Completion Rate)}
\centering
\begin{tabular}[t]{l|l|l|r|r}
\hline
GeoAreaName & Continent & SubRegion & TimePeriod & Value\\
\hline
Côte d'Ivoire & Africa & Sub-Saharan Africa & 2016 & 0.0\\
\hline
Nepal & Asia & Southern Asia & 2019 & 0.0\\
\hline
Qatar & Asia & Western Asia & 2012 & 0.0\\
\hline
Turks and Caicos Islands & Americas & Latin America and the Caribbean & 2019 & 0.0\\
\hline
Angola & Africa & Sub-Saharan Africa & 2015 & 1.5\\
\hline
Chad & Africa & Sub-Saharan Africa & 2019 & 2.0\\
\hline
Malawi & Africa & Sub-Saharan Africa & 2015 & 2.4\\
\hline
Madagascar & Africa & Sub-Saharan Africa & 2018 & 2.5\\
\hline
Mali & Africa & Sub-Saharan Africa & 2018 & 2.7\\
\hline
Rwanda & Africa & Sub-Saharan Africa & 2015 & 3.6\\
\hline
\end{tabular}
\end{table}

Using the latest available values for each country, we extracted the ten lowest performers.
All ten countries fall within low-income or lower-middle-income regions, and eight of the ten are located in Sub-Saharan Africa, including Côte d’Ivoire, Angola, Malawi, Madagascar, Mali, and Rwanda.
This strongly suggests that educational access continues to be highly constrained in African regions, where systemic barriers such as poverty, conflict, and limited infrastructure are well-documented.

A notable methodological limitation arises from the fact that countries have uneven reporting years. For example, Qatar’s most recent observation is from 2012, whereas others have data from 2018–2019. As a result, some “low-performing” countries may have improved since their last measurement. This highlights a broader challenge in using SDG datasets for cross-country comparisons: data recency varies significantly.

\newpage

## Continental trends in school completion

\begin{figure}

{\centering \includegraphics{FullQuestionOne_files/figure-latex/trends-1} 

}

\caption{Sourced From SDG4 Global Database (Indicator 4.1,2)}(\#fig:trends)
\end{figure}

To reduce noise arising from irregular reporting and to understand broader patterns, we computed average completion rates over time for each continent. The resulting plot (Figure 1.2) reveals several key insights:

Clearly, as shown previously, we notice African countries struggling with school completion rates. 
Not only are their school completion rates currently significantly lower than other continents, but their trend over the last 5 years does not look promising.
Asia and the Americas show higher completion rates with stable increasing trends throughout the timeline.
Europe reports the highest overall completion rates, with minimal variation over time and near-universal completion for primary and lower secondary education.

Oceania displays a sharp and irregular decline in completion rates, which appears misleading at first glance. This pattern could well be driven by the dominance of data from Small Island Developing States (SIDS), such as Tuvalu and Samoa, whose extremely small populations make their indicators statistically volatile. For example, despite having a population over 2,000 times smaller than Australia, Tuvalu contributes nearly half as many data points (380 vs 899). As a result, small fluctuations in enrolment or reporting can disproportionately shift regional averages.

This highlights a key limitation: regional aggregates for Oceania should be interpreted cautiously, as they are highly sensitive to small-island reporting and do not reliably reflect the trend for the region's largest country (Australia). Analysts should consider weighting by population or examining Australia separately if a stable trend is required.

## Recommendation

The analysis of Indicator 4.1.1 highlights Sub-Saharan Africa as the region most in need of targeted educational interventions. Completion rates in several African sub-regions remain far below the global average, with large spreads indicating persistent inequality within the regions. Hence, the main focus of a stage two analysis should hone in on this region. 

Oceania's apparent decline should be interpreted cautiously. Thus, separating SIDS from larger countries -- e.g. Australia and New Zealand -- in stage-two analysis to avoid misleading regional averages. 

For the next analytical phase, more robust continental and sub-regional comparisons should include population-weighted averages and temporal smoothing. This would offer clearer insight into where investments would have the greatest impact.
