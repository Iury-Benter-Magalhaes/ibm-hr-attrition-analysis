
-- Criação do banco de dados do projeto
CREATE DATABASE ibm_hr_attrition;
GO

USE ibm_hr_attrition;
GO

-- Criação da tabela de staging (dados brutos, sem tratamento)
CREATE TABLE staging_hr_employee_attrition (
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(100),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(100),
    EmployeeCount INT,
    EmployeeNumber INT,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(100),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(5),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

-- Carga dos dados brutos a partir do CSV
BULK INSERT staging_hr_employee_attrition
FROM 'C:\IBM_projeto\Projeto_pessoal_IBM\WA_Fn-UseC_-HR-Employee-Attrition.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- Verificar se a EmployeeNumber possui duplicatas.
-- Não possui duplicatas. Ok.
SELECT 
EmployeeNumber
FROM dbo.staging_hr_employee_attrition
GROUP BY EmployeeNumber
HAVING  COUNT (*) >1;

--Checar se esses essas colunas possuem valores nulos ou não.
-- Não possui valores nulos. Ok.
SELECT 
SUM (CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) null_attrition,
SUM (CASE WHEN Department IS NULL THEN 1 ELSE 0 END) null_department, 
SUM (CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) null_MonthlyIncome,
SUM (CASE WHEN JobSatisfaction IS NULL THEN 1 ELSE 0 END) null_JobSatisfaction,
SUM (CASE WHEN OverTime IS NULL THEN 1 ELSE 0 END) null_OverTime,
SUM (CASE WHEN Age IS NULL THEN 1 ELSE 0 END) null_age
FROM dbo.staging_hr_employee_attrition;

-- Verificar se essas colunsa possuem espaço.
-- sem espaços. ok
SELECT 
SUM (CASE WHEN Attrition != TRIM (Attrition) THEN 1 ELSE 0 END) trim_attrition,
SUM ( CASE WHEN BusinessTravel != TRIM (BusinessTravel) THEN 1 ELSE 0 END) trim_BusinessTravel,
SUM ( CASE WHEN Department != TRIM (Department) THEN 1 ELSE 0 END)trim_departament,
SUM ( CASE WHEN EducationField != TRIM (EducationField) THEN 1 ELSE 0 END) trim_EducationField,
SUM ( CASE WHEN Gender != TRIM (Gender) THEN 1 ELSE 0 END)trim_gender , 
SUM ( CASE WHEN JobRole != TRIM (JobRole) THEN 1 ELSE 0 END)trim_jobrole, 
SUM ( CASE WHEN MaritalStatus != TRIM (MaritalStatus) THEN 1 ELSE 0 END) trim_maritalstatus,
SUM ( CASE WHEN Over18 != TRIM (Over18) THEN 1 ELSE 0 END) trim_over18,
SUM ( CASE WHEN OverTime != TRIM (OverTime) THEN 1 ELSE 0 END) trim_overtime 
FROM dbo.staging_hr_employee_attrition;


-- Verificar se as colunas possuem possui inconsistência dos valores.
-- Sem valores inconsistentes. OK
SELECT DISTINCT
Attrition,
Department,
OverTime
FROM dbo.staging_hr_employee_attrition;


-- Verificar as colunas age e montlyincome para ver se tem algo fora do normal.
-- Sem valores anormais. Ok.
SELECT
MAX (age) idade_maxima,
MIN (age) idade_minima,
MAX (MonthlyIncome) renda_mensal_maxima,
MIN (MonthlyIncome) renda_mensal_minima
FROM dbo.staging_hr_employee_attrition;


-- Verificar se a coluna YearsAtCompany é menor do que as demais colunas, pois não faria sentido.
-- Está tudo correto.OK
SELECT
YearsAtCompany AS anos_na_empresa, 
CASE WHEN YearsInCurrentRole > YearsAtCompany THEN 'Inconsistente' ELSE 'OK' END anos_no_cargo_atual,
CASE WHEN YearsWithCurrManager > YearsAtCompany THEN 'Inconsistente' ELSE 'OK' END anos_como_gerente,
CASE WHEN YearsSinceLastPromotion > YearsAtCompany THEN 'Inconsistente' ELSE 'OK' END anos_desde_a_ultima_promocao
FROM dbo.staging_hr_employee_attrition
WHERE YearsInCurrentRole > YearsAtCompany
OR YearsWithCurrManager > YearsAtCompany
OR YearsSinceLastPromotion > YearsAtCompany;


-- Verificar se a pessoa tem mais anos de carreira do que de idade minima para trabalhar.
-- Sem inconsistencias. Ok
SELECT 
CASE WHEN (age - TotalWorkingYears)  < 16 THEN 'Inconsistente' ELSE 'Ok' END 
FROM dbo.staging_hr_employee_attrition
WHERE (age - TotalWorkingYears )< 16;

-- Verificar se as colunas constantes realmente são constantes
SELECT DISTINCT
EmployeeCount,
Over18,
StandardHours
FROM dbo.staging_hr_employee_attrition;

/*Verificar se a ordem da consulta está correta. Sem problemas. Ok
1 'Low'
2 'Medium'
3 'High'
4 'Very High'*/
SELECT 
MAX(Education) max_education,
MIN (Education) min_education,

MAX(EnvironmentSatisfaction) max_enviro,
MIN (EnvironmentSatisfaction) min_enviro,

MAX(JobInvolvement) max_jobinvolve,
MIN(JobInvolvement) min_jobinvolve,

MAX(JobSatisfaction) max_jobsatis,
MIN (JobSatisfaction) min_jobsatis,

MAX(PerformanceRating) max_performance,
MIN(PerformanceRating) min_performance,

MAX(RelationshipSatisfaction) max_relation,
MIN (RelationshipSatisfaction) min_relation,

MAX(WorkLifeBalance)max_work,
MIN (WorkLifeBalance) min_work
FROM dbo.staging_hr_employee_attrition;
