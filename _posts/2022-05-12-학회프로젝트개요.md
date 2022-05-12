---
layout : post
title : "Parrot 6th ML Project"
---

## 0. About Project
---
- It's small scale competition held in Parrot(bigdata academic society of Sogang University)
- Participants predict 'income' with dataset about Korean Income and Welfare
- Only high accuracy, not efficiency of analysis, is condition that determines winner.

## 1. About Dataset
---
- The name of dataset is 'Korea Income and Welfare' and it consists of following 14 elements.
- Training data has about 80000 data.

### id
represent each person. There exist data that has same id, but it has different condition(age, job etc)
so even if id is same, treat it as different person.
### year
the year when study conducted
### wave
from wave 1st in 2005 to wave 14th in 2018
### region
1\) Seoul 2) Kyeong-gi 3) Kyoung-nam 4) Kyoung-buk 5) Chung-nam 6) Gang-won & Chung-buk 7) Jeolla & Jeju
### family_member
number of family members
### gender
1\) male 2) female
### year_born
### education_level
1\) no education(under 7 yrs-old) 2) no education(7 & over 7 yrs-old) 3) elementary 4) middle school 5) high school 6) college 7) university degree 8) MA 9) doctoral degree
### marriage
1\) not applicable (under 18) 2) married 3) separated by death 4) separated 5) not married yet 6) others
### religion(종교)
1\) have religion 2) do not have
### occupation
this will be provided in separated code book
### company_size
### reasonnoneworker
1\) no capable 2) in military service 3) studying in school 4) prepare for school 5) preprare to apply job 6) house worker 7) caring kids at home 8) nursing 9) giving-up economic activities 10) no intention to work 11) others
### income
yearly income in Million Korean Won. (1100 KRW = 1 USD)
  - It's only in training set.      
                 
