********************************************************************************
**                  AI2150 - ASSIGNMENT - ANDRE WISEN                         **
********************************************************************************

* In this assignment you will use SPSS or STATA.
* KTH library have an electronic version of these statistical packages.
* On page 3-5 in this paper you will find the questionnaire used
* in the Hornsberg Strand research project.

** INIT 
clear
set more off

** SET LOCAL PATH TO DATASET
local path "/Users/Lorem/Ipsum/"
local dataset "Factoranalysis_Hornsberg strand_assignment.dta"
local combine `path'`dataset' 

** STEP 1
* The file ÒFFactoranalysis_Hornsberg strand_assignment.dtaÓ
* contains data to use for an analysis using STATA.
* The scale used is an 7-point Likert scale.
* Higher mean values in a dimension is more positive than lower values.

use "`combine'", clear
sum

** STEP 2
* _1
* Perform an independent sample t-test and investigate
* whether there exist any significant differences
* between those respondents that became residents in
* Hornsbergs Strand and those who didn«t. 

local 	dimList 			///
		First_dimension		///
		Second_dimension 	///
		Thrid_dimension		///
		Fourth_dimension 	///
		Fith_dimension 		///
		Sixth_dimension		///

foreach dim in `dimList' { 
	
	ttest `dim', by(Renter_nonrenter) // Equal variances
	* ttest `dim' if `dim'!=., by(Renter_nonrenter) unequal // Unequal variances - Welch's t-test - 

	local	dimSd 			///
			`dimSd' 		///
			`r(sd)'			///
			char(10)		///
			
	local 	dimP_value 		///
			`dimP_value'	///
			`r(p)'			///
			char(10)
	
	/*
	r(p l)	lower one-sided p-value
	r(p u)	upper one-sided p-value
	r(p)	two-sided p-value
	*/
} 

** STEP 2
* _2 What are the means and standard deviation for each dimension.
* How do you interpret a high mean value?

sum

** STEP 2
* _3
* What are the t-values for each of the dimensions comparing
* those who became a resident of an apartment and those who didn´t?
* Are there significant differences between the different groups?

di `dimSd'
di `dimP_value'

** N.B.
/* 	I like to use the p-value (instead of the t-value).
	Here's a suggestion on how to implement a simple comparasion.
	local alpha = 0.05

	foreach p_value in `dimP_value'{
		if `alpha'>`p_value' {
			di "Reject"
		}
	}
*/

