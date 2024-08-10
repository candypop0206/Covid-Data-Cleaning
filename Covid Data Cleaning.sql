--SELECT *
--FROM PortfolioProject..CovidDeaths
--ORDER BY 3,4

--SELECT *
--FROM PortfolioProject..CovidVaccinations
--ORDER BY 3,4

---- Select Data that we will be using

--SELECT location, date, total_cases,new_cases,total_deaths, population
--FROM PortfolioProject..CovidDeaths
--ORDER BY 1,2

-- Looking at Total Cases vs Total Deaths

--SELECT total_cases, total_deaths, (total_deaths/total_cases)*100 AS PercentDeath
--FROM PortfolioProject..CovidDeaths
--ORDER BY 3 DESC

--SELECT total_cases, total_deaths, (total_deaths/total_cases)*100 AS PercentDeath
--FROM PortfolioProject..CovidDeaths
--WHERE location = 'India'
--ORDER BY 3 DESC


-- Looking at Population vs Total Cases

--SELECT location,date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS PercentDeath ,  (total_cases/population)*100 AS PercentContract
--FROM PortfolioProject..CovidDeaths
--ORDER BY 3 DESC

--SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS PercentDeath, (total_cases/population)*100 AS PercentContract
--FROM PortfolioProject..CovidDeaths
--WHERE location = 'India'
--ORDER BY 3 DESC

-- Countries with highest infection rates

--SELECT date, location, (total_cases/population)*100 AS PercentContract
--FROM PortfolioProject..CovidDeaths
--ORDER BY 3 DESC


--SELECT  location, MAX (total_cases) AS Highest, MAX((total_cases)/population)*100 AS PercentContract
--FROM PortfolioProject..CovidDeaths
--GROUP BY location, population
--ORDER BY 3 DESC

-- Countries with highest death count per population


--SELECT  location, MAX (total_deaths) AS Highest, MAX((total_deaths)/population)*100 AS PercentDeath
--FROM PortfolioProject..CovidDeaths
--WHERE continent IS NOT NULL                        -- TO REMOVE WORLD, ASIA , AUSTRALIA ETC
--GROUP BY location, population
--ORDER BY 3 DESC

-- Group by Continents

--SELECT 
--    continent, 
--    MAX(total_deaths) AS HIGHEST, 
--    MAX((total_deaths / population) * 100) AS PercentDeath
--FROM 
--    PortfolioProject..CovidDeaths
--WHERE 
--    continent IS NOT NULL
--GROUP BY 
--    continent
--ORDER BY 
--    PercentDeath DESC;

--SELECT 
--    location, 
--    MAX(total_deaths) AS HIGHEST, 
--    MAX((total_deaths / population) * 100) AS PercentDeath
--FROM 
--    PortfolioProject..CovidDeaths
--WHERE 
--    continent is null
--GROUP BY 
--    location
--ORDER BY 
   
--   PercentDeath DESC;

-- Global Analysis

--SELECT date, SUM(cast(new_cases as int)) as TotalCasesThatDay, SUM(cast(new_deaths as int)) as TotalDeathsThatDay
--FROM PortfolioProject.dbo.CovidDeaths
--GROUP BY date
--order by 1

--SELECT *
--FROM PortfolioProject..CovidVaccinations

--SELECT *
--FROM PortfolioProject..CovidDeaths as dea
--join PortfolioProject..CovidVaccinations as vac
--on dea.location = vac.location
----and dea.date = vac.date

--SELECT 
--    dea.continent,
--    dea.location, 
--    dea.date, 
--    dea.population,
--    vac.new_vaccinations, 
--    SUM(CAST(COALESCE(vac.new_vaccinations, 0) AS BIGINT)) 
--        OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS TotalVaccinations
--FROM 
--    PortfolioProject..CovidDeaths AS dea
--JOIN 
--    PortfolioProject..CovidVaccinations AS vac
--ON 
--    dea.location = vac.location
--    AND dea.date = vac.date
--WHERE 
--    dea.continent IS NOT NULL
--ORDER BY 
--    dea.location, dea.date;


--CREATE VIEW TotalPPLVaxxed AS
--SELECT 
--    dea.continent,
--    dea.location, 
--    dea.date, 
--    dea.population,
--    vac.new_vaccinations, 
--    SUM(CAST(COALESCE(vac.new_vaccinations, 0) AS BIGINT)) 
--        OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS TotalVaccinations
--FROM 
--    PortfolioProject..CovidDeaths AS dea
--JOIN 
--    PortfolioProject..CovidVaccinations AS vac
--ON 
--    dea.location = vac.location
--    AND dea.date = vac.date
--WHERE 
--    dea.continent IS NOT NULL;

Select *
from TotalPPLVaxxed
