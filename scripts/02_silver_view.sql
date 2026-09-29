-- Criação da view e alteração das informações de 'Y' para 'Yes' do over18
GO
CREATE VIEW vw_clean_hr_employee_attrition AS
SELECT
    EmployeeNumber,
    Age,
    Attrition,
    BusinessTravel,
    DailyRate,
    Department,
    DistanceFromHome,
    Education,
    EducationField,
    EnvironmentSatisfaction,
    Gender,
    HourlyRate,
    JobInvolvement,
    JobLevel,
    JobRole,
    JobSatisfaction,
    MaritalStatus,
    MonthlyIncome,
    MonthlyRate,
    NumCompaniesWorked,
    CASE WHEN Over18 = 'Y' THEN 'Yes' END AS Over18,
    OverTime,
    PercentSalaryHike,
    PerformanceRating,
    RelationshipSatisfaction,
    StockOptionLevel,
    TotalWorkingYears,
    TrainingTimesLastYear,
    WorkLifeBalance,
    YearsAtCompany,
    YearsInCurrentRole,
    YearsSinceLastPromotion,
    YearsWithCurrManager
FROM dbo.staging_hr_employee_attrition;

SELECT TOP 10 * FROM vw_clean_hr_employee_attrition;
