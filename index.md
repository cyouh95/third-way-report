---
title: "Follow the Money: Recruiting and the Enrollment Priorities of Public Research Universities"
urlcolor: blue
output: 
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
csl: apa.csl    
---



![](assets/images/sample_header.png)

<section class="Content">

## Introduction

<!--
Socioeconomic and racial inequality in access to public research universities is a growing concern for scholars and policy advocates [@RN4409].
-->

Historically, the mission of public research universities has been to provide opportunity and social mobility for state residents who cannot afford tuition at elite private colleges and universities. Yet today we see that these institutions increasingly enroll an affluent student body that is often unrepresentative of the socioeconomic and racial diversity of the states they serve.

Policy debates often attribute this access inequality to the academic achievement gap between low-income and affluent students.<sup>1</sup> However, as the tables below show, there is actually an abundance of students from lower socioeconomic quintiles who are well-qualified for admission into competitive universities. Yet, unfortunately, these high-achieving, low-income students are much more likely to attend community college than their affluent peers, which can negatively impact their chances of obtaining a bachelor’s degree in the future. Policymakers refer to this phenomenon as "under-matching"--the idea that high-achieving, low-income students do not apply to selective institutions because they lack the proper information and guidance from their family and high school.<sup>2</sup> But a recent experimental evaluation by the College Board found that interventions providing these students with more information about their college options and the application process showed no effect on their enrollment in selective institutions, suggesting that student behavior and inadequate transparency around options may not be the only reason for access inequality.<sup>3</sup>

An alternative explanation is that the enrollment priorities of public research universities may be biased against low-income students and/or students of color. If so, fixing student achievement and college application decisions will ultimately fail to overcome the access inequality. Unfortunately, most college access policies focus on changing student behavior because policymakers typically know little about university enrollment priorities and therefore treat universities as passive recipients of applications. In reality, universities are very purposeful about which students they enroll and spend substantial resources identifying and pursuing desired prospects, which is why we make the case that knowing which student populations are targeted by university recruiting efforts is a credible indicator of their enrollment priorities. 

This report analyzes university recruiting behavior in order to assess the extent to which university enrollment priorities contribute to access inequality. We begin by providing background information about the enrollment management industry and how universities go about recruiting desired prospects. Next, we present results from a study highlighting how most public research universities make far more out-of-state visits than in-state visits and these out-of-state visits focus on affluent, predominantly white high schools and the impact this has on enrollment patterns for high-achieving, low-income students. More pointedly: when public research universities systematically ignore high-achieving, low-income state residents, these students often resort to attending community colleges, which has a dramatic negative effect on their chances of obtaining a bachelor's degree.<sup>4</sup> These insights have critical implications for ensuring that state and federal higher education policies are designed to empower public universities to fulfill their missions and provide access to high-quality education for all students in their state.

###### Table 1: Number of high-achieving students by socioeconomic quintile

<iframe src="./assets/tables/hsls_tbl1.html" width="955" height="180" class="tableau offset"></iframe>

###### Table 2: Initial post-secondary destination of high-achieving students by socioeconomic quintile

<iframe src="./assets/tables/hsls_tbl2.html" width="955" height="240" class="tableau offset"></iframe>


## Background

#### Enrollment Management by Public Research Universities

While policy debates about access to higher education often focus on student behavior, universities are purposeful about which students they pursue and expend substantial resources on crafting their incoming class. Understanding the relationship between university enrollment behaviors and access inequality requires a basic understanding of the enrollment management industry. 

Specifically, enrollment management (EM) is a profession that integrates techniques from marketing and economics in order to "influence the characteristics and the size of enrolled student bodies."<sup>5</sup> EM is also a common university administrative structure, and many institutions have an Office of Enrollment Management that coordinates the activities of the offices responsible for admission, financial aid, marketing, and recruiting. 

<!--
STUFF NOT CURRENTLY IN POLICY IMPLICATIONS

The broader enrollment management industry consists of professionals working within universities (e.g., admissions counselors), the associations enrollment management professionals belong to (e.g., National Association for College Admission Counseling), and the marketing/enrollment management consultancies universities hire (e.g., Hobsons, Ruffalo Noel Levitz).
-->

The "iron triangle" of enrollment management states that universities care about the three broad enrollment goals: access, academic prestige, and tuition revenue. Because resources are scarce, the imagery of the iron triangle suggests that pursuing one goal involves trade-offs with the others. Growing preoccupation with rankings incentivizes universities to prioritize the academic prestige goal, while state disinvestment incentivizes universities to prioritize the tuition revenue goal and discourages universities from enrolling large numbers of low-income students. Consistent with this idea, average state funding at public research universities declined from \$232 million in 2007-08 to \$158 million in 2016-17. Over the same time period, average net tuition revenue increased from \$225 million to \$493 million.

Empirical research shows that public research universities responded to declining state appropriations by dramatically increasing nonresident enrollment.<sup>6</sup> Since these nonresident students tended to be more affluent and were less likely to be black or Latinx than resident students, growth in the share of nonresident students was associated with declines in the share of Pell Grant recipients and black/Latinx students at public research universities. At prestigious public research universities like the University of Michigan and the University of California-Berkeley, nonresident enrollment growth was found to have a negative causal effect on enrollment opportunities for resident students. While prestigious public research universities enjoy strong demand from high-achieving out-of-state students, the majority of public research universities, like the University of Arizona, have demand from out-of-state students who cannot gain admission to their own state flagship. As a result, research shows that many less prestigious public flagship universities have adopted institutional "merit aid" programs specifically designed to target out-of-state students with mediocre academic achievement.


#### The Enrollment Funnel

Figure 1 depicts the enrollment funnel, a conceptual tool used by the EM industry to describe stages in the student recruitment process that inform targeted recruiting interventions. The vast majority of research on enrollment management focuses on the final stages of the enrollment funnel, specifically which applicants are admitted<sup>7, 8, 9, 10</sup> and the use of financial aid "leveraging" to convert admits to enrollees.<sup>11, 12, 13</sup> By contrast, the enrollment management industry expends substantial resources on _earlier_ stages in the funnel. "Prospects" are "all the potential students you would want to attract to your institution".<sup>14</sup> "Inquiries" are prospects that contact the university, including those who respond to university solicitations like emails and brochures and those who reach out on their own by taking actions such as sending SAT/ACT scores to a university or completing a form on the admissions website.

###### Figure 1: Enrollment management funnel
<img src="./assets/images/funnel_alt.png" alt="enrollment_funnel" width="300"/>



Universities identify prospects primarily by purchasing student lists from the College Board and the ACT, which own large databases on prospective college students. Student lists contain contact details and background information (demographic, socioeconomic, and academic) about individual prospects. Universities control which prospects are included in the list by selecting on criteria such as zip code, race, and academic achievement. Ruffalo Noel Levitz found that the median public university purchases about 64,000 names<sup>15</sup>--and they don't come cheap. For example, from 2010 to 2018, the University of Alabama paid \$1.9 million to College Board and \$349,000 to ACT, Inc. for student data.<sup>16</sup>

Once identified, prospects are targeted with recruiting interventions aimed at soliciting inquiries and applications.<sup>17, 18</sup> Face-to-face interventions include off-campus visits by universities admissions representatives--for example, to a local high school--and on-campus visits by prospects. Non face-to-face interventions include texts, emails, and mail, such as postcards and brochures. Additionally, universities utilize paid advertising, including pay-per-click ads from Google and cookie-driven ads that target prospects who visit your website, as well as social media, such as Twitter, Instagram, and YouTube, as a means of generating inquiries and creating positive "buzz" amongst prospects. Given the rise in "stealth applicants" who do not inquire before applying<sup>19</sup>, social media enables universities to tell their story to prospects who do not contact the university and do not wish to be contacted.

The data science revolution in market research has given birth to a niche industry of higher education enrollment management and enrollment marketing consulting firms. These firms help universities identify prospects, such as which criteria to select when purchasing student lists, and pinpoint which prospects should receive which recruiting interventions--another practice that comes at a high price tag for institutions. Going back to the University of Alabama (UA), from 2010 to 2018 UA paid \$4.4 million to the EM consulting firm Hobsons (2018 CPI).<sup>16</sup> Like Hobsons, these consultancies integrate proprietary data, publicly-available data, and university-owned data like historical data on applicants and IP addresses that visit the university website. As an example of proprietary data, one enrollment management consultancy told us they know the household income, house value, and detailed expenditures of every household in the US, down to things like the annual expenditures on hockey equipment. Firms then make recommendations by applying these data sources to analytic tools that predict application and enrollment probabilities for each prospect and also predict the effect of recruiting interventions on these probabilities.




#### Off-Campus Recruiting

<!--
P1: DESCRIPTION OF OFF-CAMPUS RECRUITING
transition/ and what it is; e.g., can use phrase “travel season”
Ruffalo Noel Levitz expenditure on off-campus recruiting
Stevens: what The College did
E.g., visited same schools year after year, focused on rich public and private
P2: IMPACT OF OFF-CAMPUS RECRUITING
With respect to impact, off-campus recruiting is a means of identifying prospects and of deepening connections w/ prospects already targeted through other interventions
Market research by Ruffalo Noel Levitz
Holland: directly affects application and enrollment decisions 
Bigger effect of first-gen URM; affluent/non-first-gen less taken by overtures from universities and more concerned about prestige
Stevens: maintaining warm relations w/ guidance counselors at feeder schools
TRANSITION HOOK
Concerns about declining access to public flagship for low-income and URM; concerns about growth in nonres
We know recruiting has an effect on application/enrollment decisions.
What we don’t know is extent to which publics are focusing recruiting efforts on affluent nonres rather than low-income/URM
-->

It's important to also note that the growing sophistication of off-campus student recruiting does not stop behind the curtain of online and data-driven marketing research, but instead extends into the world of off-campus visits. In the admissions world, "travel season" refers to the mad dash between Labor Day and Thanksgiving when admissions officers host hotel receptions, college fairs, and visit high schools across the country.<sup>20</sup> Ruffalo Noel Levitz, a higher education consulting firm, found that public universities spent 18% of their marketing and recruiting budget on "travel to high schools and college fairs," compared to 15% for on-campus visits and 14% for student list purchases.<sup>18</sup> ^[Only "traditional advertising" (e.g., billboards, newspapers, magazines, TV, radio) accounted for a higher percentage (24%).] @RN3519, who analyzed off-campus recruiting efforts at a selective, private liberal arts college, found that the College visited the same schools year after year because successful recruiting depends on long-term relationships with high schools. Further, the College tended to visit affluent schools, and private schools in particular, because these schools enroll high-achieving students who can afford tuition and because these schools have the resources and motivation to host a successful visit.

Analyses of the effects of off-campus recruiting broadly conceive off-campus recruiting as a means of simultaneously identifying prospects and connecting with prospects already being targeted through mail/email [e.g., @RN4323; @RN4315; @RN3519]. @RN4402 found that off-campus visits were the second highest source of inquiries (after student list purchases), accounting for 19\% of inquiries for the median public university. Off-campus visits were also the third highest source of enrollees (after stealth applicants and on-campus visits), accounting for 16\% of enrollees [@RN4402]. @RN4324, who analyzed recruiting from the perspective of high school students, found that high school visits influenced where students applied and where they enrolled, particularly first-generation students. By contrast, affluent students with college-educated parents tended to be less taken by overtures from universities and more concerned about university prestige. Finally, echoing findings from market research [@RN4402], @RN3519 found that high school visits were instrumental for maintaining strong relationships with guidance counselors at "feeder schools." These relationships were essential because "the College's reputation and the quality of its applicant pool are dependent upon its connections with high schools nationwide" [@RN3519, p. 53].

While prior research finds that off-campus recruiting influences the application and enrollment decisions of underrepresented students and accounts for a larger share of university marketing/recruiting budgets, our research is the first to systematically investigate which high schools receive visits by which universities and why this matters to broader inequities across our higher education system.

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
-->

Our research suggests that policy debates about college access must be reframed from a focus on student deficiencies towards a focus on university enrollment priorities. Mainstream policy debates highlight the "achievement gap" and "under-matching" -- high-achieving students do not apply to selective colleges -- as primary causes of racial and socioeconomic inequality in college access. These explanations point to deficiencies of students and K-12 schools and, in turn, motivate policy interventions that attempt to fix students. However, if university enrollment priorities are biased, then fixing student achievement and student decision-making alone will fail to fix college access. 

Using recruiting behavior as an indicator of university enrollment priorities, our results indicate socioeconomic and racial bias in the enrollment priorities of many public research universities. The majority of public research universities in our analysis sample made far more out-of-state recruiting visits than in-state recruiting visits.  Out-of-state recruiting visits were concentrated in affluent, predominantly white public and private schools. This income and racial bias persisted even after controlling for school size and academic achievement.

<!--
Mainstream policy debates identify the "achievement gap," "under-matching" -- when high achieving students fail to apply to selective colleges -- and inability to pay as primary causes of racial and socioeconomic inequality in college access.  These explanations highlight the deficiences of students, households, and k-12 schools and -- using the language of economists -- can all be described as "demand side" factors. In turn, policy solutons focus on fixing students, emphasizing interventions that increase achievement and interventions that reduce under-match by giving students better information and guidance about college options.  If universities are biased against low-income students or communities of color, then fixing student achievement and student decision-making will not overcome access inequality. 

Our research suggests that policy debates about college access must be reframed to focus on university enrollment priorities. We use university recruiting behavior as an indicator of enrollment priorities. 
-->


Although policy debates discuss public funding primarily in terms of consequences for student behavior (e.g., funding cuts cause net price to rise and affordability to decline), public funding also dramatically affects university enrollment priorities. Cuts to public funding shift higher education from a public good to a private good, creating incentives to prioritize customers who pay the most. Nonresident tuition price is typically two to three times higher than resident price. Public research universities responded to state funding cuts following the 2008 recession by dramatically growing nonresident enrollment. Many public flagship universities adopted institutional financial aid policies that explicitly target out-of-state students with mediocre academic achievement. We found a strong relationship between state funding and recruiting behavior. Universities with weak state funding tended to make the most out-of-state recruiting visits. Universities with strong state funding tended to visit a larger share of in-state high schools and were more likely to visit in-state schools with large shares of low-income students and non-white students. 
<!--
Although policy debates about public funding and college access certainly consider prices and affordability, these issues are discussed in terms of their effects on student behavior rather than their effects on university behavior. 

Although policy debates about public funding and college access certainly consider prices and affordability, these issues are discussed in terms of their effects on student behavior rather than their effects on university behavior. We argue that higher education funding policies should be debated in terms of their effects on university enrollment behavior.  
-->




We highlight two broad approaches to public funding as a means of changing university enrollment priorities: first, increase block grant funding such that universities can pay for the cost of educating students without relying on tuition; and, second, increase need-based financial aid as a means of increasing the purchasing power of poor students.

State appropriations are the most important source of block grant funding to universities. When state appropriations decline, universities ask permission to increase resident tuition price. Granting this request reduces the number of state residents who can afford in-state public universities. Denying this request reduces the ability of public universities to survive by enrolling state residents and increases the incentive to enroll nonresident students.  By contrast, if state appropriations increased substantially, states could demand a reduction in resident tuition price and universities could survive by enrolling state residents.

Need-based grant aid programs can be thought of as voucher programs that follow students. These programs increase the purchasing power of poor students, making them more financially attractive to universities that rely on tuition revenue.  The most important programs are federal Pell Grant and state need-based grant aid. Though not a grant, income sharing agreements (ISAs) represent a private sector approach to increasing student purchasing power. Policy changes that substantially increase the maximum award (e.g., increasing the Pell maximum from \$6,195 to \$10,000) enable universities to enroll low-income students without offering substantial need-based institutional aid, thereby increasing the number of low-income students they are willing to enroll.

Following decades of pessimism about public funding for higher education, many states are adopting "free college" policies and presidential candidates have unveiled plans to dramatically increase federal investments. State "free college" policies -- often called "free tuition" policies are voucher programs that provide eligible students with grant aid to cover costs associated with attending in-state public institutions. These programs are designed to be combined with other sources of grant aid (e.g., Pell, state need- and merit-based aid).  Programs differ on several dimensions [@RN4467]: which costs can be covered (e.g., tuition, fees, living expenses); "first dollar" (i.e., receiving other grant aid does not reduce award amount) versus "last dollar" (i.e., award only covers eligible costs not covered by other grant aid); whether award can be used at public universities or only community colleges; etc.

Democrat presidential candidates Bernie Sanders and Elizabeth Warren have both proposed policies to (1) eliminate tuition and fees at public colleges and universities through federal matching funds to states and (2) to finance the non-tuition costs of low- and middle-income students by increasing federal grant aid to students. Other candidates have proposed making community college free but not public universities (e.g., Joe Biden) and dramatically increasing the size of Pell maximum.

While most analyses of state "free college" policies and presidential candidate plans focus on student effects, we comment briefly on the effects on university behavior. State "free college" policies are similar to state need-based aid programs in that they are vouchers that follow students to postsecondary institutions. These programs increase the purchasing power of poor students, making them more financially attractive to postsecondary institutions. We are critical of programs that only permit community college attendance because these programs push students to community colleges and do not incentivize public universities to expand low-income enrollment. If we care about BA attainment for low-income students, then "free college" programs must permit public university enrollment because empirical research unequivocally finds that starting at a community college as opposed to a public university has a dramatic negative causal effect on the probability of receiving a BA [@RN4469]. Many programs that allow university attendance are "last dollar" programs or do not cover living costs [@RN4467]. As a result, average award amount and total program expenditure tends to be quite modest. These programs may not make public universities sufficiently attractive to low-income students nor low-income students sufficiently attractive to public universities.

The Sanders and Warren plans would have more dramatic effects on university enrollment priorities because they far exceed the combined funding of state "free college" programs. In theory, the plan to replace undergraduate tuition and fee revenue with federal-state match block grant funding would eliminate university reliance on undergraduate tuition and remove disincentives against enrolling large numbers of students who cannot afford tuition without need-based institutional aid. In contrast to federal-state block grants, plans increase federal higher education funding by dramatically increasing the Pell grant maximum (e.g., from \$6,125 to \$12,000) maintain university reliance on tuition revenue but increase university willingness to expand low-income enrollment by increasing the purchasing power of poor students.





Policymakers can also affect university behavior through regulation. In our research, the only universities that made more in-state than out-of-state visits were located in states -- North Carolina and California -- with strong nonresident enrollment caps. However, we strongly caution policymakers that regulation is not an alternative to adequate funding. State funding for higher education in North Carolina and California remains above the national average. Without adequate public funding, restrictions on university revenue-generating behavior causes educational quality to decline (e.g., higher student-to-teacher ratios, students cannot enroll in classes necessary for graduation), gaming behavior to overcome regulations, or unintended consequences. For example, capping nonresident enrollment incentivizes universities to enroll in-state students that do not require need-based financial aid.

We recommend that financial regulations focus on limiting expenditures that do not have educational value. For example, students from affluent households have strong preferences for consumption amenities. In a paradoxical example of "he who pays the piper calls the tune," public flagship universities respond to state funding cuts by building luxury facilities (e.g., luxury dorms and recreational facilities, pools with a "lazy river") designed to attract nonresident students.Construction of these facilities is often financed by bonds. Paying annual interest on these bonds increases costs and, in turn, tuition price for decades, perpetuating university enrollment preferences towards students who pay the most. Restrictions on debt financing could reduce this vicious cycle, but the better approach would be to provide adequate public funding so that universities need not provide lavish amenities as a means of generating revenue.

Regulations may be necessary to overcome racial bias in university enrollment priorities. While state funding cuts provide a rationale for the income bias we observed in university recruiting behavior, it does not explain the finding that public research universities were less likely to visit out-of-state schools with high non-white enrollment, even after controlling for income, school enrollment size, and academic achievement. Jack finds that universities pursue racial diversity by recruiting students of color from predominantly white public and private schools. Our findings that universities recruit at affluent, predominantly white schools may be an example of universities simultaneously pursuing tuition revenue and racial diversity. Alternatively, these results may be due to institutional racism with respect to assumptions made about students of color from predominantly non-white schools. Regardless, it is unacceptable for universities to systematically ignore communities of color. One policy solution could be to publicize the extent to which universities only enroll students of color from affluent, predominantly white schools and communities.

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
