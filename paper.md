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

Neurofeedback is a process in which brain activity is recorded and presented back to participants in real-time. Neurofeedback is generally used to learn to self-regulate brain activity, and often to improve a behaviour or mental state associated with that brain activity [@Thibault2015]. While neurofeedback appears to improve behaviour and mental states, there is a debate as to what extent the benefits stem from self-regulating brain activity versus from psychosocial factors such as placebo effects [@Ros2020]. A lack of standards for experimental design and reporting leaves room for various interpretation of extant data. With this in mind, neurofeedback research collaborated and produced The Consensus on the reporting and experimental design of clinical and cognitive-behavioural neurofeedback studies (CRED-nf) checklist [@Ros2020].

Here we present an R Shiny app based on the CRED-nf checklist. This app provides a web browser-based platform to facilitate the completion of the checklist. It uses dropdown menus to prompts users to answer each question from the checklist and provides textboxes to include details. Unanswered questions become highlighted and auto-filled if not addressed. The app then generates a PDF report of the completed checklist which can be submitted alongside a scientific manuscript to facilitate peer review and provide transparency. The generated PDFs will also provide a standardized output that can simplify systematic reviews.

The CRED-nf article [@Ros2020] points to this app. The code can easily be adapted to develop other checklists and could be used with the aim of improving the quality and reporting of research in other domains.

The CRED-nf app is stored in a repository at: https://github.com/hugaped/CRED-nf/
It is hosted online at: https://crednf.shinyapps.io/CREDnf/


# Acknowledgements

We thank other developers of the CRED-nf checklist [@Ros2020] for testing the tool and proving feedback for the working of the questions.


# References
