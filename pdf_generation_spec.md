# K-Urja PDF Report Generation Specification (v3 - Final)

This document provides a comprehensive specification for generating the K-Urja Carbon Report PDF from data stored in Supabase. It includes a detailed schema of all data, explanations for potentially ambiguous field names, the PDF structure, and the precise calculation logic required for an external service to replicate the PDF.

## 1. Supabase Data Schema & Glossary

The primary data required for the PDF is stored in a single table in Supabase, likely named `surveys`. This table contains all the raw information collected during the audit.

### 1.1. `surveys` Table Schema

| Column Name | Data Type | Description & Meaning |
| :--- | :--- | :--- |
| `owner_name` | `text` | The full name of the house owner. |
| `house_name` | `text` | The name or number of the house. |
| `mobile_number`| `text` | The contact mobile number for the owner. |
| `consumer_no` | `text` | The KSEB consumer number. |
| `section` | `text` | The KSEB section office name. |
| `post_office` | `text` | The local post office name. |
| `pin_code` | `text` | The 6-digit postal pin code. |
| `panchayath` | `text` | The name of the local Panchayath/Municipality. |
| `member_count` | `text` | The number of people residing in the house. |
| `days_uninhabited`| `text` | The number of days the house is uninhabited per year. |
| `tariff_category`| `text` | The electricity tariff category (e.g., 'LT-1A Domestic'). |
| `connected_load`| `text` | The total connected electrical load in Watts. |
| `house_building_type`| `text` | The type of house construction (e.g., 'Concrete', 'Tiled Roof'). |
| `total_building_area`| `text` | The total area of the building in square feet (sqft). |
| `no_of_floors` | `text` | The number of floors in the building. |
| `own_or_rental` | `text` | Specifies if the residence is owned or rented. |
| `type_of_earthing`| `text` | The type of electrical earthing used (e.g., 'Pipe Earthing'). |
| `no_of_mcbs` | `text` | The total number of MCBs (Miniature Circuit Breakers). |
| `type_of_energy_meter`| `text` | The type of energy meter installed (e.g., 'Digital', 'TOD'). |
| `control_systems`| `text` | The primary electrical control system (e.g., 'ELCB', 'RCCB'). |
| `water_source` | `text` | The primary source of water (e.g., 'Well', 'Municipal'). |
| `water_usage` | `text` | The daily water usage in Liters. |
| `water_bill` | `text` | The bi-monthly water bill amount in local currency (if applicable). |
| `tank_capacity` | `text` | The capacity of the water tank in Liters. |
| `pump_capacity` | `text` | The capacity of the water pump motor in Horsepower (HP). |
| `filling_time` | `text` | The time it takes for the pump to fill the tank, in Minutes. |
| `pump_count` | `text` | The number of times the pump is run per day. |
| `has_solar_plant`| `bool` | `true` if a solar plant is installed. |
| `solar_capacity` | `text` | The capacity of the solar plant in kilowatts (kW). |
| `solar_plant_type`| `text` | The type of solar plant ('On grid', 'Off grid', 'Hybrid'). |
| `bi_monthly_consumption`| `text` | **IMPORTANT:** Despite the name, this stores the **Average Daily Consumption** in kWh, calculated from the user's bill entries. |
| `bi_monthly_bill`| `text` | **IMPORTANT:** Despite the name, this stores the **Average Cost Per Unit** (e.g., ₹/kWh), not the total bill amount. |
| `firewood` | `text` | The amount of firewood used in **Kg per month**. |
| `lpg` | `text` | The number of LPG **cylinders used per month**. |
| `biogas` | `text` | The number of **hours per month** biogas is used. |
| `other_fuel` | `text` | A description of any other fuels used for cooking. |
| `appliances` | `jsonb` | A JSON object containing lists of standard appliances. See schema below. |
| `heavy_appliances`| `jsonb` | A JSON object containing lists of heavy appliances. See schema below. |
| `vehicles` | `jsonb` | A JSON array containing vehicle objects. See schema below. |

### 1.2. JSON Schemas

#### `appliances` Column Schema
Contains lists of standard appliances, categorized by type.
```json
{
  "lightSources": [
    {
      "name": "string",          // e.g., 'LED Bulb', 'Tube Light'
      "watts": "string" (number),// Power in Watts
      "hours": "string" (number),// Daily usage in hours
      "count": "string" (number),// Number of units
      "tips": "string",          // Energy saving suggestion
      "savingWatts": "string",   // Potential power saving in Watts by implementing the tip
      "investmentCost": "string" // Cost in local currency to implement the tip
    }
  ],
  "fanList": [ ... ],        // Same object structure as lightSources
  "otherAppliances": [ ... ] // Same object structure as lightSources
}
```

#### `heavy_appliances` Column Schema
Contains lists of heavy-load appliances like Refrigerators and ACs.
```json
{
  "fridgeList": [
    {
      "capacity": "string",      // Capacity, e.g., '250 L'
      "starRating": "string",    // e.g., '3', '5'
      "daysUsed": "string",      // Days used per year (typically '365')
      "hoursUsed": "string",     // Daily usage in hours. For fridge, this is ignored and assumed to be 24.
      "count": "string",         // Number of units
      "wattage": "string",       // Power in Watts
      "tips": "string",          // Energy saving suggestion
      "savingWatts": "string",   // Potential power saving in Watts
      "investmentCost": "string" // Cost to implement the tip
    }
  ],
  "acList": [ ... ] // Same object structure as fridgeList
}
```

#### `vehicles` Column Schema
An array of objects, where each object represents a vehicle.
```json
[
  {
    "vehicleType": "string", // e.g., 'Car', 'Motorcycle'
    "fuelType": "string",    // 'Petrol', 'Diesel'
    "isEV": "boolean",
    "kmUsage": "string",     // Not directly used in PDF calculations
    "fuelUsage": "string",   // Fuel consumed in **Liters per month**
    "fuelCost": "string",    // Not directly used in PDF calculations
    "mileage": "string"      // Not directly used in PDF calculations
  }
]
```

---

## 2. PDF Structure

The PDF is a multi-page document with the following sections in order:

1.  **Header:** Contains "K-Urja Carbon Report" and the generation date.
2.  **Consumer Information:** Displays the basic details of the consumer.
3.  **Building & Connection:** Displays details about the building and electrical setup.
4.  **Resources (Water & Solar):** Displays details about water and solar energy sources.
5.  **Electricity Consumption:** Displays the calculated daily average and its annual carbon footprint.
6.  **Energy Performance Index (EPI):** Displays the calculated EPI value.
7.  **Cooking Fuel Consumption:** A breakdown of each cooking fuel's usage and annual carbon footprint.
8.  **Appliances:** A detailed, category-by-category list of all appliances and their calculated carbon footprints.
9.  **Vehicles:** A list of vehicles and their calculated carbon footprints.
10. **Total Carbon Footprint:** A final summary box with the total calculated annual carbon footprint.

---

## 3. Required Calculations

All calculations should be performed using the data fetched from the `surveys` table.

### 3.1. Emission Factors (Constants)
- **Electricity:** `0.79` Kg CO2/kWh
- **Diesel:** `2.65` Kg CO2/litre
- **Petrol:** `2.3` Kg CO2/litre
- **LPG:** `44.5` Kg CO2 per 14.2kg cylinder
- **Firewood:** `2.8` Kg CO2/kg
- **Biogas:** `1.8` Kg CO2/hour

### 3.2. Calculation Logic

1.  **Annual Electricity Consumption:**
    - `daily_avg_kwh = bi_monthly_consumption (as double)`
    - `annual_kwh = daily_avg_kwh * 365`
    - `carbon_footprint = annual_kwh * 0.79`

2.  **Energy Performance Index (EPI):**
    - `building_area_sqft = total_building_area (as double)`
    - `building_area_sqm = building_area_sqft * 0.092903`
    - `epi = annual_kwh / building_area_sqm` (Result in kWh/m²/year)

3.  **Cooking Fuel Carbon Footprint (Annual):**
    - **Firewood:** `firewood (as double, in kg/month) * 12 * 2.8`
    - **LPG:** `lpg (as double, in cylinders/month) * 12 * 44.5`
    - **Biogas:** `biogas (as double, in hours/month) * 12 * 1.8`

4.  **Standard Appliance Carbon Footprint (Annual, per item):**
    - For each item in the `lightSources`, `fanList`, and `otherAppliances` arrays.
    - `annual_kwh = (watts * hours * count * 365) / 1000`
    - `carbon_footprint = annual_kwh * 0.79`

5.  **Heavy Appliance Carbon Footprint (Annual, per item):**
    - For each item in the `fridgeList` and `acList` arrays.
    - **For Refrigerators (`fridgeList`):** Set `hoursUsed` to `24`.
    - `annual_kwh = (wattage * hoursUsed * daysUsed * count) / 1000`
    - `carbon_footprint = annual_kwh * 0.79`

6.  **Vehicle Carbon Footprint (Annual, per vehicle):**
    - For each vehicle in the `vehicles` JSON array.
    - `annual_fuel_usage = fuelUsage (as double, in liters/month) * 12`
    - `carbon_footprint = annual_fuel_usage * [emission_factor_for_fuel_type]`

7.  **Water Pump Carbon Footprint (Annual):**
    - `pump_watts = pump_capacity (as double, in HP) * 746`
    - `filling_time_hours = filling_time (as double, in minutes) / 60`
    - `daily_kwh = (pump_watts * filling_time_hours * pump_count (as double)) / 1000`
    - `annual_kwh = daily_kwh * 365`
    - `carbon_footprint = annual_kwh * 0.79`

8.  **Appliance Payback Period (in Years):**
    - Applies to any appliance with `savingWatts` and `investmentCost`.
    - `average_unit_cost` is fetched from the `bi_monthly_bill` column.
    - `annual_kwh_savings = (savingWatts (as double) * hours (as double) * 365) / 1000`
    - `annual_money_savings = annual_kwh_savings * average_unit_cost`
    - `payback_period_years = investmentCost (as double) / annual_money_savings`

9.  **Total Annual Carbon Footprint:**
    - The final value displayed in the PDF is the sum of the annual carbon footprints from all sources:
        - Electricity (from bills)
        - Firewood
        - LPG
        - Biogas
        - All Standard Appliances
        - All Heavy Appliances
        - All Vehicles
        - Water Pump
