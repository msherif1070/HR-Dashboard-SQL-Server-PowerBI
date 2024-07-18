import pandas as pd

# Load the dataset
employees = pd.read_csv(r'C:\Users\MOHAMED_DAYAN\Downloads\HumanResources.csv', encoding='latin1')

# Display the first few rows to understand the structure
print(employees.head())

# Create Race Table
race = employees[['race']].drop_duplicates().reset_index(drop=True)
race['raceID'] = race.index + 1

# Create Location Table
location = employees[['location']].drop_duplicates().reset_index(drop=True)
location['locationID'] = location.index + 1

# Create Address Table
address = employees[['location_city', 'location_state']].drop_duplicates().reset_index(drop=True)
address['addressID'] = address.index + 1

# Create Departments Table
departments = employees[['department']].drop_duplicates().reset_index(drop=True)
departments['departmentID'] = departments.index + 1

# Create JobTitle Table
jobTitle = employees[['jobtitle']].drop_duplicates().reset_index(drop=True)
jobTitle['jobID'] = jobTitle.index + 1

# Map IDs to Employees Table
employees = employees.merge(race[['race', 'raceID']], on='race', how='left')
employees = employees.merge(location[['location', 'locationID']], on='location', how='left')
employees = employees.merge(address[['location_city', 'location_state', 'addressID']], on=['location_city', 'location_state'], how='left')
employees = employees.merge(departments[['department', 'departmentID']], on='department', how='left')
employees = employees.merge(jobTitle[['jobtitle', 'jobID']], on='jobtitle', how='left')

# Drop old columns from fact table
employees.drop(columns=['race', 'department', 'jobtitle', 'location', 'location_city', 'location_state'], inplace=True)

# Save the tables to CSV files
employees.to_csv(r'E:\Human Resources Project\HumanSources Data after Split\employees.csv', index=False)
race.to_csv(r'E:\Human Resources Project\HumanSources Data after Split\race.csv', index=False)
location.to_csv(r'E:\Human Resources Project\HumanSources Data after Split\location.csv', index=False)
address.to_csv(r'E:\Human Resources Project\HumanSources Data after Split\address.csv', index=False)
departments.to_csv(r'E:\Human Resources Project\HumanSources Data after Split\departments.csv', index=False)
jobTitle.to_csv(r'E:\Human Resources Project\HumanSources Data after Split\jobtitle.csv', index=False)

# Display the first few rows of each table to verify the creation
print(employees.head())
print(race.head())
print(location.head())
print(address.head())
print(departments.head())
print(jobTitle.head())
