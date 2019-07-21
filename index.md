---
title: "Follow the money"
subtitle: The Recruiting Behavior and Enrollment Priorities of Public Research Universities
author: author names
date: 
urlcolor: blue
output: 
  html_document:
    toc: true
    toc_depth: 2
    #toc_float: # toc_float option to float the table of contents to the left of the main document content. floating table of contents will always be visible even when the document is scrolled
      #collapsed: false # collapsed (defaults to TRUE) controls whether the TOC appears with only the top-level (e.g., H2) headers. If collapsed initially, the TOC is automatically expanded inline when necessary
      #smooth_scroll: true # smooth_scroll (defaults to TRUE) controls whether page scrolls are animated when TOC items are navigated to via mouse clicks
    number_sections: true
    fig_caption: yes # ? this option doesn't seem to be working for figure inserted below outside of r code chunk    
    highlight: tango # Supported styles include "default", "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock" (specify null to prevent syntax    
    theme: default # theme specifies the Bootstrap theme to use for the page. Valid themes include default, cerulean, journal, flatly, readable, spacelab, united, cosmo, lumen, paper, sandstone, simplex, and yeti.
    df_print: tibble #options: default, tibble, paged
    keep_md: true # may be helpful for storing on github
bibliography: third-way-bib.bib
csl: apa.csl    
---



# Introduction

Socioeconomic and racial inequality in access to public research universities is a growing concern for scholars and policy advocates [@RN4409]. 

text text text

# Background

## Enrollment Management

While policy debates about access to higher education often focus on student behavior, universities are purposeful about which students they pursue and expend substantial resources crafting their class. Understanding the relationship between university enrollment behaviors and access inequality requires a basic understanding of the "enrollment management" industry. 

Enrollment management (EM) is a profession that integrates techniques from marketing and economics in order to "influence the characteristics and the size of enrolled student bodies" [@RN2771, p. xiv].  EM is also a university administrative structure (e.g., "The Office of Enrollment Management") that coordinates the activities of offices responsible for admissions, financial aid, marketing, and recruiting. 

The broader enrollment management industry consists of professionals working within universities (e.g., admissions counselors), the associations enrollment management professionals belong to (e.g., National Association for College Admission Counseling), and the marketing/enrollment management consultancies universities hire (e.g., Hobsons, Ruffalo Noel Levitz).

Figure 2 depicts the "enrollment funnel," a conceptual tool the EM industry uses to describe stages in student recruitment in order to inform targeted recruiting interventions. The vast majority of research on enrollment management focuses on the final stages of the enrollment funnel, specifically which applicants are admitted [e.g., @RN3536; @RN3544; @RN3523; @RN4131] and the use of financial aid "leveraging" to convert admits to enrollees [e.g., @RN2241; @RN3564; @RN1948]. By contrast, the enrollment management industry expends substantial resources on earlier stages in the funnel.  "Prospects" are "all the potential students you would want to attract to your institution" [@RN4322]. "Inquiries" are prospects that contact the university, including those who respond to university solicitations (e.g., email, brochure) and those who reach out on their own (e.g., sending SAT/ACT scores to a university, completing a form on the admissions website).  

![Enrollment Funnel FIX CAPTION](assets/images/funnel_alt.png)



Universities identify prospects primarily by purchasing ``student lists'' from College Board and ACT. For example, from 2010 to 2018, the University of Alabama paid \$1.9 million to College Board and \$349k to ACT, Inc [@RN4035]. Student lists contain contact details and background information (demographic, socioeconomic, and academic) about individual prospects. Universities control which prospects are included in the list by selecting on criteria such as zip code, race, and academic achievement. @RN4314 found that the median public university purchases about 64,000 names. 

Once identified, prospects are targeted with recruiting interventions aimed at soliciting inquiries and applications [@RN4323; @RN4402]. Face-to-face interventions include off-campus visits by universities admissions representatives (e.g., to a local high school) and on-campus visits by prospects. Non face-to-face interventions include email, mail (e.g., postcards, brochures), and texts.  Additionally, universities utilize paid advertising (e.g., pay-per-click ads from Google, cookie-driven ads that target prospects who visit your website) and social media (e.g., Twitter, Instagram, YouTube) as a means of generating inquiries and creating positive "buzz" amongst prospects. Given the the rise in "stealth applicants" who do not inquire before applying [@RN4411], social media enables universities to tell their story to prospects who do not contact the university and do not wish to be contacted.

The "data science" revolution in market research has given birth to a niche industry of higher education enrollment management/marketing consulting firms. These firms help universities identify prospects (e.g., which criteria to select when purchasing student lists) and decide which prospects should receive which recruiting interventions.  For example, from 2010 to 2018 the University of Alabama paid \$4.4 million to the EM consulting firm Hobsons [@RN4035] (2018 CPI). The consultancies integrate university-owned data (e.g., historical data on applicants, IP addresses that visit the university website), publicly available data, and proprietary data. As an example of proprietary data, one enrollment management consultantancy told us they know the houshold income, house value, and detailed expenditures (e.g., annual expenditure on hockey equipment) of every household in the US. Firms make recommendations by applying these data sources to analytic tools that predict application and enrollment probabilities for each prospect and also predict the effect of recruiting interventions on these probabilities.




## Off-Campus Recruiting

DESCRIPTION OF OFF-CAMPUS RECRUITING
transition/ and what it is; e.g., can use phrase “travel season”
Ruffalo Noel Levitz expenditure on off-campus recruiting
Stevens: what The College did
E.g., visited same schools year after year, focused on rich public and private
IMPACT OF OFF-CAMPUS RECRUITING
With respect to impact, off-campus recruiting is a means of identifying prospects and of deepening connections w/ prospects already targeted through other interventions
Market research by Ruffalo Noel Levitz
Holland: directly affects application and enrollment decisions 
Bigger effect of first-gen URM; affluent/non-first-gen less taken by overtures from universities and more concerned about prestige
Stevens: maintaining warm relations w/ guidance counselors at feeder schools
TRANSITION HOOK
Concerns about declining access to public flagship for low-income and URM; concerns about growth in nonres
We know recruiting has an effect on application/enrollment decisions.
What we don’t know is extent to which publics are focusing recruiting efforts on affluent nonres rather than low-income/URM


Given the focus of this report, what is the role of off-campus visits in student recruitment? In the admissions world, ``travel season'' refers to the mad dash between Labor Day and Thanksgiving when admissions officers host hotel receptions, college fairs, and visit high schools across the country \citep{RN3519}. Research by both EM consulting firms and by scholars describe off-campus recruiting as a means of simultaneously identifying prospects and connecting with prospects already being targeted through mail/email [e.g., @RN4323; @RN4315; @RN3519].

ADD STUFF ABOUT EXPENDITURE ON OFF-CAMPUS RECRUITING VISITS HERE?

With respect to efficacy, @RN4402 found that off-campus visits were the second highest source of inquiries (after student list purchases), accounting for 19.0\% of inquiries for the median public university. Off-campus visits were also the third highest source of enrollees (after stealth applicants and on-campus visits), accounting for 16\% of enrollees \citep{RN4402}.


Additionally, research finds that high school visits are instrumental for maintaining warm relationships with guidance counselors at "feeder schools." @RN4402 found that face-to-face meetings were the most effective means of engaging high school guidance counselors.  @RN3519 worked as a regional admissions recruiter for a selective liberal arts college as part of his broader ethnography on college admissions.  Relationships with counselors were essential because "The College's reputation and the quality of its applicant pool are dependent upon its connections with high schools nationwide" [@RN3519, p. 53]. The College visited the same schools year after year because successful recruiting depends on long-term relationships with high schools. Further, the College tended to visit affluent schools, and private schools in particular, because these schools enroll high-achieving students who can afford tuition and because these schools have the resources and motivation to host a successful visit.

@RN4324 analyzed high school visits from the student perspective. High school visits influenced where students applied and where they enrolled. The strength of this finding was modest for affluent students with college-educated parents. These students tended to be more concerned about college prestige and less influenced by overtures from colleges. However, high school visits strongly influenced decisions by  first-generation students and under-represented students of color.  These students often felt that "school counselors had low expectations for them and were too quick to suggest that they attend community college" and were drawn to colleges that "made them feel wanted" by taking the time to visit.  



# Research and Findings

## Data and Methods

## Results

### Overall Patterns

### Income

### Race

# Policy Implications

# Conclusion

# References