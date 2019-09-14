---
title: "Follow the Money: Recruiting and the Enrollment Priorities of Public Research Universities"
urlcolor: blue
output: 
  #word_document:
  #  reference_docx: word-styles-reference.docx
  html_document:
    self_contained: false  # so fetching font would work https://github.com/rstudio/rmarkdown/issues/419
    includes:
        in_header: assets/html/header.html
    css: assets/css/style.css
    toc: false
    toc_depth: 2
    #toc_float: # toc_float option to float the table of contents to the left of the main document content. floating table of contents will always be visible even when the document is scrolled
      #collapsed: false # collapsed (defaults to TRUE) controls whether the TOC appears with only the top-level (e.g., H2) headers. If collapsed initially, the TOC is automatically expanded inline when necessary
      #smooth_scroll: true # smooth_scroll (defaults to TRUE) controls whether page scrolls are animated when TOC items are navigated to via mouse clicks
    number_sections: false
    fig_caption: yes # ? this option doesn't seem to be working for figure inserted below outside of r code chunk    
    highlight: null # Supported styles include "default", "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock" (specify null to prevent syntax    
    theme: null # theme specifies the Bootstrap theme to use for the page. Valid themes include default, cerulean, journal, flatly, readable, spacelab, united, cosmo, lumen, paper, sandstone, simplex, and yeti.
    df_print: tibble #options: default, tibble, paged
    keep_md: true # may be helpful for storing on github

bibliography: third-way-bib.bib
#csl: apa.csl
#csl: modern-language-association.csl
csl: annual-reviews.csl
---



![](assets/images/sample_header.png)

<section class="Content">

## Introduction

<!--
A million reports show u that colleges stack the deck for rich kids. We're gonna tell you why they do this and begin the discussion of how we can change this.
-->

[DEVELOP SNAPPIER LEDE; MAYBE AROUND ADMISSIONS SCANDAL?]
Historically, the mission of public research universities has been to provide opportunity and social mobility for state residents who cannot afford tuition at elite private colleges and universities. Yet today these institutions are unrepresentative of the socioeconomic and racial diversity of the states they serve, increasingly composed of affluent students from affluent out-of-state students.

Policy debates often attribute this access inequality to the academic achievement gap between low-income and affluent students [@RN4016] However, TABLE X below shows, there is actually an abundance of students from lower socioeconomic quintiles who are well-qualified for admission into competitive universities. Yet, unfortunately, TABLE X shows these high-achieving, low-income students are much more likely to attend community college than their affluent peers. Policymakers refer to this phenomenon as "under-matching"--the idea that high-achieving, low-income students do not apply to selective institutions because they lack the proper information and guidance from their family and high school.[@RN3699] But a recent experimental evaluation by the College Board found that interventions providing these students with more information about their college options and the application process showed no effect on their enrollment in selective institutions, suggesting that student behavior and inadequate transparency around options may not be the only reason for access inequality.[@RN4468]

An alternative explanation is that the enrollment priorities of public research universities may be biased against low-income students and/or students of color. If so, fixing student achievement and college application decisions will ultimately fail to overcome the access inequality. Unfortunately, most college access policies focus on changing student behavior because policymakers typically know little about university enrollment priorities and therefore treat universities as passive recipients of applications. In reality, universities are very purposeful about which students they enroll and spend substantial resources identifying and pursuing desired prospects, which is why we make the case that knowing which student populations are targeted by university recruiting efforts is a credible indicator of their enrollment priorities. 

This report analyzes university recruiting behavior in order to assess the extent to which university enrollment priorities contribute to access inequality. We begin by providing background information about the enrollment management industry and how universities go about recruiting desired prospects. Next, we present results from a study highlighting how most public research universities make far more out-of-state visits than in-state visits and these out-of-state visits focus on affluent. Finally, we discuss policy implications, emphasizing the relationship between public funding for higher educaiton and the enrollment priorities of public universities.  Reports showing that universities stack the deck for rich kids are a dime a dozen. We explain why universities behave this way and we begin a discussion about what we can do to change this.

Revitalizing the social mobility mission of public flagship universities is essential because these institutions are designated the unique responsibility of transorming raw talent into the future civic, professional, and business leader of the state. When public research universities systematically ignore high-achieving, low-income state residents, these students are often funneled to community colleges. Research resoundingly finds that starting at a community has a dramtic negative effect on the probability of obtaining a bachelor's degree.[@RN4284,@RN2261,@RN4292,@RN4405], with the most recent analyses finding that starting at a community college rather than a 4-year university reduces the probability of attaining a BA by 18 percentage points (e.g., from a 50% probability to 32% probability).[@RN4469]

###### Table 1: Number of high-achieving students by socioeconomic quintile

<iframe src="./assets/tables/hsls_tbl1.html" width="955" height="180" class="tableau offset"></iframe>

###### Table 2: Initial post-secondary destination of high-achieving students by socioeconomic quintile

<iframe src="./assets/tables/hsls_tbl2.html" width="955" height="240" class="tableau offset"></iframe>


## Background

#### Enrollment Management by Public Research Universities

While policy debates about access to higher education often focus on student behavior, universities are purposeful about which students they pursue and expend substantial resources on crafting their incoming class. Understanding the relationship between university enrollment behaviors and access inequality requires a basic understanding of the enrollment management industry. 

Specifically, enrollment management (EM) is a profession that integrates techniques from marketing and economics in order to "influence the characteristics and the size of enrolled student bodies."[@RN2771] EM is also a common university administrative structure, and many institutions have an Office of Enrollment Management that coordinates the activities of the offices responsible for admission, financial aid, marketing, and recruiting. 

<!--
STUFF NOT CURRENTLY IN POLICY IMPLICATIONS

The broader enrollment management industry consists of professionals working within universities (e.g., admissions counselors), the associations enrollment management professionals belong to (e.g., National Association for College Admission Counseling), and the marketing/enrollment management consultancies universities hire (e.g., Hobsons, Ruffalo Noel Levitz).
-->

The "iron triangle" of enrollment management states that universities care about the three broad enrollment goals: access, academic quality, and tuition revenue. In practice, "academic quality" often refers to US News and World Report rankings. For public universities, the "access" goal refers to access for state residents and access for underrepresented student populatons (e.g., first-generation, underrepresented students of color). Because resources are scarce, the imagery of the iron triangle suggests that pursuing one goal involves trade-offs with the others. Growing preoccupation with rankings incentivizes universities to prioritize the academic prestige goal, while state disinvestment incentivizes universities to prioritize the   tuition revenue goal and discourages universities from enrolling large numbers of low-income students. Consistent with this idea, average state funding at the 63 public research-extensive universities as defined by the 2005 Carnegie Classification declined from \$387 million in 2001-02 to \$280 million in 2012-13, recovering only to \$314 million by 2016-17 despite several years of economic growth.^[Author calculations based on the Integrated Postsecondary Education Data System (IPEDS) Finance survey component] By contrast, average net tuition revenue increased from \$213 million in 2001-02 to to \$501 million in 2016-17.[CRYSTAL - CAN YOU MAKE A FIGURE SHOWING CHANGE OVER TIME IN STATE APPROPRIATIONS AND TUITION REVENUE]

<!--
cd "${drop}nonres-oj-bc${a}effect-on-personnel${a}data"
use nonres-personnel-analysis-data.dta, clear

	****DESCRIPTIVES FOR THIRD WAY REPORT

		table endyear if endyear>=2002 & endyear<2018 & sector==1 & inlist(cc2005,15)==1 & inlist(unitid,190576,110699)==0, ///
			contents(freq count statea count tuition mean statea mean tuition) cellw(20) format(%12.0fc)

------------------------------------------------------------------------------------------------------------------------
academic  |
year,     |
e.g.      |
1995=1994 |
-95       |                Freq.             N(statea)            N(tuition)          mean(statea)         mean(tuition)
----------+-------------------------------------------------------------------------------------------------------------
     2002 |                   63                    63                    57           387,122,306           212,706,325
     2003 |                   63                    63                    62           369,153,025           228,521,367
     2004 |                   63                    63                    63           347,918,359           250,437,175
     2005 |                   63                    63                    63           342,027,079           264,202,593
     2006 |                   63                    63                    63           344,903,602           278,913,696
     2007 |                   63                    63                    63           359,182,358           291,902,195
     2008 |                   63                    63                    63           371,787,272           304,787,780
     2009 |                   63                    63                    63           353,161,591           331,012,604
     2010 |                   63                    63                    63           332,042,020           353,311,528
     2011 |                   63                    63                    63           318,664,537           377,031,563
     2012 |                   63                    63                    63           282,977,959           407,994,588
     2013 |                   63                    63                    63           280,118,438           427,348,666
     2014 |                   63                    63                    63           300,906,269           443,499,379
     2015 |                   63                    63                    63           307,975,644           467,870,679
     2016 |                   63                    63                    63           310,162,089           487,915,230
     2017 |                   63                    63                    63           313,662,710           501,088,909
------------------------------------------------------------------------------------------------------------------------


-->

#### Creating the Out-of-State University

[IF THIS SUB-SECITON ON OUT-OF-STATE ENROLLMENT GROWTH IS GETTING TOO LONG AND DISRUPTS FLOW BETWEEN PREVIOUS AND SUBSEQUENT SUB-SECTION THEN WE CAN CUT IT DOESN OR MOVE IT. YOUR CALL]
Public research universities responded to declining state appropriations by dramatically increasing nonresident enrollment because nonresident students often pay two- to three-times more than residents. Empirical research found that a 10% decline in state appropriations was associated with a 4.6% increase in nonresident freshman enrollment.[@RN3753]  Between 2001-02 to 2016-17, average nonresident freshman enrollment at the nation's 63 public research-extensive universities (2005 Carnegie Classification) increased from about 800 (19% of the freshman class) to over 1,400 (26% of the freshmen class)^[Author calculations based on the Integrated Postsecondary Education Data System (IPEDS) Student Financial Aid survey component]

Nationally prestigious public research universities (e.g., University of Michigan, UCLA) enjoy strong demand from high-achieving, out-of-state students. However, most public research universities are not nationally prestigious and compete for out-of-state students who were rejected by flagship universities in their own state. For example, the University of Arizona pursues Californians denied by the University of California and the University of Arkansas pursues Texans denied by the University of Texas-Austin and Texas A&M. As competition for out-of-state (and international) students increases, non-prestigious prestigious public flagship universities have adopted institutional "merit aid" programs specifically designed to target out-of-state students with mediocre academic achievement.[@RN4409; @RN4032; @RN3519; @RN3762; @RN4494]

Legislators in several states (e.g., California) have proposed nonresident enrollment caps, based on the premise that nonresident students ``crowds out'' access for resident. University administrators counter that, amidst state budget cuts, nonresident tuition revenue enables universities to finance (1) resident access and (2) faculty employment necessary to educate students. We assessed these claims empirically. First, nonresident enrollment has no effect on resident enrollment for public research universities as a whole and has a negative effect on resident enrollment at nationally prestigious universities.[@RN4290]. Second, nonresident enrollment has a strong positive relationship with faculty hiring.[@RN4492] We found that enrolling 100 additional nonresident freshmen is associated with hiring 1.42 new tenure-line faculty while enrolling 100 additional resident freshmen is associated with hiring 0.64 tenure-line faculty. However, we also find that nonresident enrollment growth affects student composition in undesirable ways. Since nonresident students tend to be more affluent and are less likely to be black or Latinx than resident students, growth in the share of nonresident students was associated with declines in the share of Pell Grant recipients and black/Latinx students at public research universities.[@RN3685] 


#### The Enrollment Funnel

Figure 1 depicts the enrollment funnel, a conceptual tool used by the EM industry to describe stages in the student recruitment process that inform targeted recruiting interventions. The vast majority of research on enrollment management focuses on the final stages of the enrollment funnel, specifically which applicants are admitted[@RN3536; @RN3544; @RN3523; @RN4131] and the use of financial aid "leveraging" to convert admits to enrollees.[@RN2241; @RN3564; @RN1948] By contrast, the enrollment management industry expends substantial resources on _earlier_ stages in the funnel. "Prospects" are "all the potential students you would want to attract to your institution".[@RN4322] "Inquiries" are prospects that contact the university, including those who respond to university solicitations like emails and brochures and those who reach out on their own by taking actions such as sending SAT/ACT scores to a university or completing a form on the admissions website.

###### Figure 1: Enrollment management funnel
<img src="./assets/images/funnel_alt.png" alt="enrollment_funnel" width="300"/>



Universities identify prospects primarily by purchasing student lists from the College Board and the ACT, which own large databases on prospective college students. Student lists contain contact details and background information (demographic, socioeconomic, and academic) about individual prospects. Universities control which prospects are included in the list by selecting on criteria such as zip code, race, and academic achievement. Ruffalo Noel Levitz, an enrollment management consulting firm, found that the median public university purchases about 64,000 names.[@RN4314] These names don't come cheap. The median public university spent 14% of ther marketing and recruiting budget on student list purchases.[@RN4402] To provide a concrete example, from 2010 to 2018, the University of Alabama paid \$1.9 million to College Board and \$349,000 to ACT, Inc. for student data.[@RN4035]

Once identified, prospects are targeted with recruiting interventions aimed at soliciting inquiries and applications.[@RN4323; @RN4402] Face-to-face interventions include off-campus visits by universities admissions representatives--for example, to a local high school--and on-campus visits by prospects. Non face-to-face interventions include texts, emails, and mail, such as postcards and brochures. Additionally, universities utilize paid advertising, including pay-per-click ads from Google and cookie-driven ads that target prospects who visit your website, as well as social media, such as Twitter, Instagram, and YouTube, as a means of generating inquiries and creating positive "buzz" amongst prospects. Given the rise in "stealth applicants" who do not inquire before applying[@RN4411], social media enables universities to tell their story to prospects who do not contact the university and do not wish to be contacted.

The data science revolution in market research has given birth to a niche industry of higher education enrollment management and enrollment marketing consulting firms. These firms help universities identify prospects, such as which criteria to select when purchasing student lists, and pinpoint which prospects should receive which recruiting interventions--another practice that comes at a high price tag for institutions. Going back to the University of Alabama (UA), from 2010 to 2018 UA paid \$4.4 million to the EM consulting firm Hobsons (2018 CPI).[@RN4035] Like Hobsons, these consultancies integrate proprietary data, publicly-available data, and university-owned data like historical data on applicants and IP addresses that visit the university website. As an example of proprietary data, one enrollment management consultancy told us they know the household income, house value, and detailed expenditures of every household in the US, down to things like the annual expenditures on hockey equipment. Firms then make recommendations by applying these data sources to analytic tools that predict application and enrollment probabilities for each prospect and also predict the effect of recruiting interventions on these probabilities.




#### Off-Campus Recruiting

It's important to also note that the growing sophistication of off-campus student recruiting does not stop behind the curtain of online and data-driven marketing research, but instead extends into the world of off-campus visits. In the admissions world, "travel season" refers to the mad dash between Labor Day and Thanksgiving when admissions officers host hotel receptions, college fairs, and visit high schools across the country.[@RN3519] Ruffalo Noel Levitz found that public universities spent 18% of their marketing and recruiting budget on "travel to high schools and college fairs," compared to 15% for on-campus visits and 14% for student list purchases.[@RN4402] ^[Only "traditional advertising" (e.g., billboards, newspapers, magazines, TV, radio) accounted for a higher percentage (24%).] 

Enrollment managers value off-campus recruiting as a means of simultaneously identifying prospects and connecting with prospects already being targeted through mail/email [e.g., @RN4323; @RN4315; @RN3519].  Further, these visits are essential for maintaining long-term relationships with "feeder schools" -- and guidance counselors at these schools -- that are a consistent source of students year after year.[@RN3519,@RN4402].  Prior research finds that admissions recruiters prioritize affluent high schools, with a particular focus on private schools, that have the organizational resources and motivation to host successful visits.[@RN3519]

Market research on the effect off-campus recruiting find that off-campus visits were the second highest source of inquiries (after student list purchases), accounting for 19\% of inquiries for the median public university.[@RN4402]  Off-campus visits were also the third highest source of enrollees (after stealth applicants and on-campus visits), accounting for 16\% of enrollees.  Qualitative research, from the perspective of high school students, found that high school visits influenced where students applied and where they enrolled.[@RN4324] These findings were particularly strong for first-generation students. By contrast, affluent students with college-educated parents tended to be less taken by overtures from universities and more concerned about university prestige.


While prior research finds that off-campus recruiting influences the application and enrollment decisions of underrepresented students and accounts for a larger share of university marketing/recruiting budgets, our research is the first to systematically investigate which high schools receive visits by which universities and why this matters to broader inequities across our higher education system.


<!--
CUT TEXT

, who analyzed recruiting from the perspective of high school students, found that high school visits influenced where students applied and where they enrolled, particularly first-generation students.  Finally, echoing findings from market research [@RN4402], @RN3519 found that high school visits were instrumental for maintaining strong relationships with guidance counselors at "feeder schools." These relationships were essential because "the College's reputation and the quality of its applicant pool are dependent upon its connections with high schools nationwide" [@RN3519, p. 53].

-->




## Research and Findings

In the text below, we present findings from our research, which collected data on off-campus recruiting visits by public research universities. The project goal was to assess socioeconomic, racial, and geographic biases in which schools and communities receive visits. The results presented here analyze off-campus recruiting visits during the 2017 calendar year by a selection of 15 public research universities. ^[We used two data collection strategies. First, university admissions websites often list upcoming off-campus recruiting events on pages that advertise admissions representatives coming "near you" (e.g., <a href="./assets/html/uga.html" target="_blank">here</a>). Therefore, we used "web-scraping" to capture this data on off-campus visits. Second, we issued public records requests to universities asking for data on all their off-campus recruiting visits. Han, Jaquette, and Salazar (2019) provide more detail about how we define off-campus recruiting events, data collection methods, data processing steps, and data quality checks. Appendix Table A1 summarizes the data sources and data quality checks conducted for each university analyzed in this report.]

#### Results

Table 3 shows the number of recruiting visits by event type, such as public high school or private high school, and whether the visit was in-state or out-of-state for the 15 public research universities in our sample. Across all universities, the majority of visits are to public high schools. However, the most dramatic result is that most universities made more out-of-state than in-state visits--a principal that runs counter to the stated missions of large, state-based university systems. Seven universities made _more than twice_ as many out-of-state than in-state visits. And, when compared to in-state visits, a disproportionate number of these out-of-state visits were to private high schools. ^[More details on the proportional vs. actual number of visits to out-of-state private high schools compared to public high schools can be found <a href="https://emraresearch.org/sites/default/files/2019-03/joyce_report.pdf#page=34" target="_blank">here</a>.] In addition, we find that recruiting patterns are often tied to state funding, with universities that had the lowest state funding turning to out-of-state recruiting efforts as a way to generate greater revenue from tuition. 

###### Table 3: State funding and number of events by type, in-state vs. out-of-state

<iframe src="./assets/tables/event_count.html" width="955" height="500" class="tableau offset"></iframe>

On the other hand, universities that received more state funding tended to have more complete coverage of their home state. For example, North Carolina State University made about twice as many in-state visits than out-of-state visits. Several universities in our sample also made a substantial number of visits to community colleges in their state. 

##### Trends in Median Income of Visited High Schools

Figure 2 shows the average median household income in zip codes of visited public high schools compared to non-visited public high schools for in-state and out-of-state visits. As seen, out-of-state visits are heavily focused on affluent communities across all the universities in our sample. For example, the University of Massachusetts-Amherst visited out-of-state public high schools in zip codes where the average median household income was \$115,000 while the average income for non-visited schools was \$64,000, resulting in a \$51,000 gap. The average income disparity between visited and non-visited out-of-state public high schools across all institutions in our sample is around \$40,000. In fact, we find that affluent out-of-state schools are significantly more likely to receive a visit even after using regression models that control for factors such as academic achievement and school size. ^[Regression results can be found in the report <a href="https://emraresearch.org/sites/default/files/2019-03/joyce_report.pdf#page=27" target="_blank">here</a>.]

###### Figure 2: Average median household income of visited vs not visited public high schools

<iframe src="./assets/graphs/third_way_income.html" width="750" height="950" class="tableau offset"></iframe>


To hone in even further on how public institutions target their out-of-state recruitment efforts on more affluent students, Figure 3 shows an illustrative example of the University of Pittsburgh’s efforts to recruit students in the Chicago metropolitan area--a prime target for recruiting students given its close geographic proximity. The interactive map shows the visited and non-visited public high schools by the University of Pittsburgh, with each zip code in the Chicago metropolitan area shaded according to median household income. The blue circle markers indicate the location of a public high school, and filled circle markers indicate that the high school is visited by the University of Pittsburgh. As you can see, visited schools are largely concentrated in the more affluent communities located in the northeastern region of the metropolitan area, while schools near the outer edges of the metro area with lower median household incomes did not receive a visit.


###### Figure 3: Visits to metro areas by median household income

<iframe src="./assets/maps/map_income.html" width="955" height="700" class="tableau offset"></iframe>


Income bias in in-state public high school visits also exists across the majority of the institutions in our sample, but to a lesser extent. For example, the difference in average median household income between visited and non-visited in-state public high schools by the University of California-Berkeley is \$19,000. The average income disparity across all institutions is around \$11,000. It should be noted that two of the institutions, the University of California-Irvine and North Carolina State University, actually visited public high schools in their home state with a _lower_ average income than schools not visited.


##### Trends in Racial Composition of Visited High Schools

Figure 4 shows the average racial compositions of visited high schools compared to non-visited high schools for in-state and out-of-state visits by the institutions in our sample. Similar to the income results, out-of-state visits to public high schools show the most evidence of racial bias. A majority of the institutions in our sample visited out-of-state public high schools with an overall higher share of white students and lower share of black, Latinx, and Native American students. For example, the University of Colorado-Boulder visited out-of-state public high schools where white students make up 56% of the combined total, as compared to 49% in non-visited high schools. At the same time, black, Latinx, and Native American students make up 7%, 20%, and less than 0.5% of visited public high school students, respectively, compared to 16%, 27%, and close to 1% of non-visited students. For most of the institutions in our sample, regression results show that the racial bias in out-of-state public high school visits persists even after controlling for other school characteristics.


###### Figure 4: Average racial composition of visited vs not visited high schools by in-state, out-of-state

<iframe src="./assets/graphs/third_way_race.html" width="750" height="1050" class="tableau offset"></iframe>


Figure 5 again shows a map of visited and non-visited public high schools by the University of Pittsburgh in the Chicago metropolitan area. Each zip code is shaded according to the proportion of people who identify as black, Latinx, or Native American. The majority of visited high schools are concentrated in the northern part of the metro area, where there is a low proportion of black, Latinx, and Native American students. Communities of color are located primarily near the southeastern part of the region, and these public high schools received very few visits. 


###### Figure 5: Visits to metro areas by percent black, Latinx, and Native American

<iframe src="./assets/maps/map_race.html" width="955" height="700" class="tableau offset"></iframe>


When looking at out-of-state visits to private high schools, Figure 4 shows that the racial composition of students remain relatively consistent between visited and non-visited schools. However, private high schools in general have a higher percentage of white students than public high schools, and universities tend to visit a disproportionate number of out-of-state private high schools. Therefore, the overall population of out-of-state students visited by the universities in our sample tended to be more white. 

In-state visits, on the other hand, show inconsistent evidence of racial bias across our sample institutions. For example, the University of Alabama visited schools with a larger percentage of white students and a smaller percentage of black, Latinx, and Native American students, whereas the University of California-Irvine visited a higher proportion of students of color. Nevertheless, in comparison to out-of-state visits to public high schools, the difference in average racial composition between visited and non-visited students remains relatively small across all cases.


## Policy Implications

<!--
STUFF NOT CURRENTLY IN POLICY IMPLICATIONS

- degree completion is largely a function of access
- innovative research on access rather than degree completion?

Mainstream policy debates highlight the "achievement gap" and "under-matching" -- high-achieving students who do not apply to selective colleges -- as causes of racial and socioeconomic inequality in college access. These explanations point to deficiencies of students and K-12 schools, motivating policy interventions that attempt to "fix" students, while absolving institutions of their responsibility to provide equal access
-->

Mainstream policy debates about socioeconomic and racial inequality in college access point to ``deficiencies'' of students and k-12 schools (e.g., the "achievement gap," "under-matching" by high-achieving students who do not apply to selective universities). These explanations motivate policy interventions that attempt to "fix" students, absolving universities of their responsibility to provide equal access. If university enrollment priorities are biased, then improving student achievement and decision-making will not overcome access inequality. Therefore, debates about college access should consider university enrollment priorities and how policies can change these priorities.

Using recruiting behavior as an indicator of preferences, our analyses suggest systematic socioeconomic and/or racial bias in the enrollment priorities of many public research universities. Most universities in our sample made far more out-of-state recruiting visits than in-state visits.  Out-of-state visits were concentrated in affluent, predominantly white public and private schools, and regression analyses find strong evidence of income and racial bias even after controlling for school size and academic achievement. These results are consistent with recent scholarship on institutional financial aid, which show that many public flagship universities developed "merit" aid programs that specifically target affluent, out-of-state prospects with mediocre academic achievement.[@RN4409; @RN4032; @RN3519; @RN3762; @RN4494] Many state flagship universities seem to be expending more resources finding affluent, middling, out-of-state students than they expend on finding high-achieving, low- and middle-income students in their own state. Philisophically,  this trend is hostile to any reasonable conception of meritocracy.
<!-- CITES
This is not a meritocracy

merit aid: burd

more resources pursuing rich, middling: 

-->


<!--
BELOW PARAGRAPH SPEAKS TO THIS COMMENT FROM TAMARA

Can we add in a very clear paragraph explaining exactly what this means for students? You mention earlier that this pushes students into community colleges, which have worse outcomes. Spelling that out and how inequitable access on the front end only exacerbates inequitable access on the back end is important.
-->

More concretely, we rob students 
When universities place more value on affluence as a merit criterion than academic achievement, the negative effects on students and on society are profound. High-achieving, low-income students unwanted by their state flagship attend a nearby community college or state college. Student outcomes are substantially a function of access. Research unoquivocally finds that starting at a community dramatically reduces the probability of obtaining a BA [@RN4469; @RN2261], increases the time to degree [CITE], and lowers lifetime earnings [CITE]. Regional public universities fare better than community colleges on degree completion. However, most states designate public flagship universities the responsibility of preparing the future, business, professional, and civic leaders of the state.  When public flagship universities ignore poor, minority communities in their backyard, they deny local talent the opportunity to reach its full potential. The best inputs are not being sent to the place that maximizes their output. Further, when public flagships enroll great quantities of affluent students who were rejected by public universities in their own state, campus culture becomes hostile to first-generation students reaching for their full potential [@RN4231].


### Public Funding and Enrollment Priorities

<!--
While debates about the nexus between funding and college access tend to emphasize the effects of funding on student behavior, we suggest that policymakers consider the effects of funding on university behavior. 
 This debate need not dwell on "performance funding"
 
-->

Debates about higher education funding focus mainly on students. It's time for a debate about the effects of funding on university behavior, one that does get hijacked by the sideshow that is "performance funding."  Spending hawks often rationalize cuts to public universities on the ground that these organizations can generate their own revenue. Although this may be true for some universities, cuts to public funding shift higher education from a public good to a private good by creating incentives for universities to prioritize the customers who pay the most. In response to state funding cuts after the 2008 recession, public research universities dramatically increased nonresident enrollment because each nonresident student generates three times more net tuition revenue, on average, than each resident. Our analyses suggested a strong relationship between state funding and recruiting behavior. Universities with weak state funding tended to make the most out-of-state recruiting visits, concentrated in the most affluent communities. Universities with strong state funding tended to visit a larger share of in-state high schools and were more likely to visit in-state schools with large numbers low-income students and non-white students. 



<!--
We highlight two broad approaches to public funding as a means of changing university enrollment priorities: first, increase block grant funding such that universities can pay for the cost of educating students without relying on tuition; and, second, increase need-based financial aid as a means of increasing the purchasing power of poor students.

-->

Can we develop funding policies that encourage public universities expand opportunities for high-achieving state residents, particularly those from low- and middlie-income families? Yes. We highlight two alternative approaches to funding public universities: first, block-grant funding to universities; and, second, need-based grant aid to students.

Block grant funding is a subsidy that enables universities to pay the costs of educating studnets without relying on tuiiton revenue. State appropriations are the dominant source of block grant funding for public universities. When state appropriations decline, universities ask permission to increase resident tuition price. Granting this request reduces the number of state residents who can afford in-state public universities. Denying this request reduces the ability of public universities to subsist from resident enrollment, incentivizing universities to pursue nonresident students. Although the federal government primarily funds higher education through research grants and aid to students, the federal government could increase block grant funding by matching state appropriations.  If states substantially increased block grant funding, they could simultaneously demand a reduction in resident tuition price and more enrollment spaces for resident students.

Need-based grant aid programs follow students to the institution they choose to attend. The most important need-based grant programs are the Federal Pell Grant program and state need-based grant aid programs (e.g., Cal Grant, Minnesota State Grant). With respect to university enrollment priorities, need-based grant aid increases the purchasing power of poor students, making them more financially attractive to universities that rely on tuition revenue. Policy changes that substantially increase the maximum award (e.g., increasing the Pell maximum from \$6,195 to \$12,000) enable a university to enroll a low-income student without substantial need-based institutional aid, thereby creating incentives for universities to enroll more low-income students.State "free college" policies are similar to state need-based aid programs, albeit much smaller in scale, in that they provide grant aid to eligible students attending in-state public institutions.

<!--

thereby increasing student purchasing power in creating financial incentives for universities to enroll more residents. To date, however, expenditure on "free college" programs is quite modest compared to state need-based aid.

Programs differ with respect which costs they can be applied to (e.g., only tuition and fees or cost of living too), eligibility requirements and other dimensions. 

Although these programs differ on important dimensions (e.g., which costs, how they can be combined with other grant aid), expenditure on free college programs is quite modest compared to state need-based aid programs.


forces universities to compete for students because their survival depends on tuition revenue paid for by government grant aid. 
-->


<!--
forces universities to compete for students because their survival depends on tuition revenue paid for by government grant aid. 
-->

Policymakers face choices about how generously to fund public universities and how to allocate these funds. Whereas block grants reduce tuition reliance, grant aid to students encourages tuition reliance and competition between institutions for government-funded students.  Most university systems are financed through a mix of state block grants, federal and state grant-aid, and out-of-pocket tuition from students (including loans). Rather than advocate for one allocation approach, we advocate for more generous funding.  Low-levels of state appropriations encourage universities to restrict enrollment opportunities, decrease the quality of education, or prioritize enrollment opportunities for nonresident students and for affluent residents who do not require need-based institutional aid. Weak funding for need-based grant aid ensures that low-income students have weak purchasing power and, therefore, are not financially desirable to universities trying to figure out how to make payroll.


Although state and federal policies cannot directly control university spending decisions, funding policy affects university spending priorities. Policymakers want universities to use public funds efficiently and with a focus on delivering student outcomes. Paradoxically, cutting state appropriations incentivizes universities to increase spending on consumption amenities (e.g., luxury dorms and recreational facilities, pools with a "lazy river"). In the absence of block grants from the state, universities becomes reliant on tuition revenue from affluent students who desire such amenities.  See the University of Colorado-Boulder and the University of Alabama.  By contrast, generous state appropriations disincentivize expenditure on amenities because the university is less beholden to the consumption preferences of affluent students. 

### Regulation and Oversight

Several states are considering nonresident enrollment caps as a response to nonresident enrollment growth. Our research suggests that these caps do affect university behavior. The only universities that made more in-state than out-of-state visits were located in states -- North Carolina and California -- with strong nonresident enrollment caps. However, regulation is not an alternative to adequate funding. State spending on higher education in North Carolina and California is above the national average.  Without adequate state funding, restrictions on university revenue-generating behavior negatively affects the quality of education students receive. State funding cuts force universities to hire fewer factor or to rely on part-time adjunct faculty. Adjunts are underpaid, treated poorly, and negatively affect student learning outcomes. [@RN4189] However, we find that public research universities hire more tenure-line faculty in response to nonresident enrollment growth than they do in response to equivelent resident enrollment growth,[@RN4492] suggesting that universities are using nonresident tuition revenue to pay core inputs to student education that were once largely financed through state support.Therefore, capping nonresident enrollment without providing sufficient state funding stops universities from hiring the faculty that help students the most. It also incentivizes universities to enroll affluent residents who do not require need-based aid.


Racial biases in university enrollment priorities and recruiting behaviors deserve greater scrutingy and oversight. Our research finds that public research universities were less likely to visit out-of-state schools with high non-white enrollment, even after controlling for income and academic achievement. Although state funding cuts provide a reasonable rational for income bias, it does not explain systematic bias against communities of color. Rather, these results may be due to institutional racism against communities of clor.  More broadly, a growing number of studies find that universities prefer students of color from affluent, predominantly white public and private schools [@RN4495; @RN4396; @RN2517].  Ted Thornhill found that university admissions representatives respond less favorably to inquiries from African American males who presented themselves as committed to racial justice than African American males that presented deracialized interests.[@RN4360] Universities market and recruit students through advertising, social media, by sending them emails and brochures, by visiting their school and by responding to their questions. Racial discrimination can occur at any of these stages. Plicymakers devote a substantial attention to potential discrimination in the application review process. We recommend that policymakers begin asking universities which prospects they target and how they target prospects during different stages of the enrollment process.

## Conclusion

State policymakers often rationalize funding cuts to public research universities based on the assumption that these universities can generate their own revenues through tuition. Our research finds that while most public research universities do successfully grow tuition revenue to compensate for state budget cuts, forcing universities to finance their survival through tuition revenue compels them to prioritize customers who pay the most. As a result, public flagship universities may expend substantial resources recruiting and offering "merit" aid to mediocre out-of-state students who are rejected from public universities in their own state, while high-achieving, low-income students are neglected, funneled to community colleges that dramatically reduce their chances of ultimately obtaining a bachelor's degree. This is not a meritocracy. Nor is it an evil plot by universities. It is a rational response to incentives created by government disinvestment in public higher education.  Policymakers must take responsibility for providing a financial pathway that enables public universities to flourish by serving the mission of social mobility they were founded to serve.


## Appendix

###### Appendix Table A1: Summary of data collection sources and quality checks performed

<iframe src="./assets/tables/data_appendix.html" width="955" height="380" class="tableau offset"></iframe>


<div class="ProductEndnotes mt-5">
#### Endnotes
<div id="refs"></div>
</div>
</section>
