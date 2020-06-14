---
title: 'CRED-nf online checklist: An R Shiny tool to facilitate completion of the Consensus on the reporting and experimental design of clinical and cognitive-behavioural neurofeedback studies (CRED-nf) checklist'
tags:
  - R
  - Shiny
  - checklist
  - neurofeedback
  - guidelines
authors:
  - name: Hugo Pedder
    orcid: 0000-0002-7813-3749
    affiliation: 1
  - name: Robert T Thibault
    orcid: 0000-0002-6561-3962    
    affiliation: "2, 3"
affiliations:
 - name: Population Health Sciences, University of Bristol
   index: 1
 - name: School of Psychological Science, University of Bristol
   index: 2
 - name: MRC Integrative Epidemiology Unit at the University of Bristol
   index: 3
date: 29 April 2020
bibliography: crednf.bib
---

# Summary

Neurofeedback is a technique in which brain activity is measured and reported back to participants in real-time with a view to improving a range of cognitive outcomes. However, there are concerns regarding whether the mechanisms through which it works arise from biomedical activity relating to the neurofeedback process, or whether it can be explained solely by placebo effects [refs]. This problem is compounded by the diversity of experimental standards and the lack of agreed criteria for reporting neurofeedback studies [ref]. A recent consensus study has proposed a set of guidelines for the design and reporting of neurofeedback studies, called the Consensus on the reporting and experimental design of clinical and cognitive-behavioural neurofeedback studies (CRED-nf) checklist [@Ros2020]. ADD STATEMENT OF NEED

This CRED-nf online tool is an R Shiny app that accompanies the development of the CRED-nf checklist. It makes it easy for users to complete the checklist via a web browser, providing prompting questions for each of the items and highlighting those where users have left responses blank. It can also be used to generate a PDF report of responses which can be included alongside a manuscript submission to journals so that reviewers can have access to the completed checklist.

It has been designed to be used by any researchers conducting a neurofeedback study and can be accessed via a URL posted on journal websites. The code for the app can easily be adapted for developers of other checklists in the future, which can hopefully then be used to improve the quality and reporting of studies in other fields of research.

The CRED-nf checklist is stored in a repository at: https://github.com/hugaped/CRED-nf/
It is hosted online at: https://crednf.shinyapps.io/CREDnf/


# Acknowledgements

We thank other developers of the CRED-nf checklist [@Ros2020] for testing the tool and proving feedback for the working of the questions.


# References
