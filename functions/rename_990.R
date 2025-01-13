# Takes a 990 df from get_990 and renames variables to human readable

rename_990 <- function(df) {
  df %>% 
    dplyr::rename(tax_year = TAXYEAR, 
           num_employees = TOTAEMPLCNTN, 
           company_name = FILERNAME1, 
           address = FILERUS1, 
           city = FILERUSCITY, 
           state = FILERUSSTATE, 
           zip = FILERUSZIP, 
           year_formed = FORMATIONORM, 
           gov_grants = GOVERNGRANTS, 
           mgmt_fees = INFOTECHTOTA,
           mgmt_expenses = MANAGENEEXPE,
           invest_income = ININTORECOOL,
           interest = INTERETOTALO, 
           legal_fees = LEGAFEESTOTA,
           num_voting_members = NBREVOTIMEMB, 
           occupancy = OCCUPATOTALO, 
           office_expenses = OFFIEXPETOTA, 
           status_501c3 = ORGANIZATION3, 
           employee_benefits = OTHEMPBENTOT, 
           salaries = OTHSALWAGTOT, 
           payroll_taxes = PAYRTAXETOTA, 
           pension_plans = PENPLACONTOT, 
           program_expenses = PROGSERVEXPE, 
           liabilities = TLNAEOY, 
           net_assets = TNAFBEOY, 
           revenue = TOTREVCURYEA)
}