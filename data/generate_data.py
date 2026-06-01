import pandas as pd
import numpy as np
from faker import Faker
import random

fake = Faker()

regions = ["North", "South", "East", "West"]

specialty_medicine_map = {
    "Cardiology": ["HeartSafe"],
    "Neurology": ["NeuroPlus"],
    "Orthopedics": ["PainOff"],
    "Dermatology": ["SkinGlow"]
}

sales_reps = [fake.name() for _ in range(15)]

doctors = []

for i in range(60):
    specialty = random.choice(list(specialty_medicine_map.keys()))

    doctors.append({
        "doctor_id": 2000 + i,
        "doctor_name": fake.name(),
        "specialty": specialty
    })

data = []

for i in range(2000):

    doctor = random.choice(doctors)

    specialty = doctor["specialty"]

    medicine = random.choice(
        specialty_medicine_map[specialty]
    )

    target = random.randint(50000, 200000)

    units_sold = random.randint(20, 500)

    revenue = units_sold * random.randint(200, 1500)

    marketing_spend = random.randint(5000, 40000)

    prescriptions = random.randint(5, 100)

    achieved_pct = round((revenue / target) * 100, 2)

    row = {
        "sales_rep_id": random.randint(1000, 1015),
        "sales_rep_name": random.choice(sales_reps),
        "doctor_id": doctor["doctor_id"],
        "doctor_name": doctor["doctor_name"],
        "specialty": specialty,
        "region": random.choice(regions),
        "medicine_name": medicine,
        "units_sold": units_sold,
        "revenue": revenue,
        "visit_date": fake.date_between(start_date='-1y', end_date='today'),
        "target": target,
        "achieved_pct": achieved_pct,
        "marketing_spend": marketing_spend,
        "prescriptions": prescriptions
    }

    data.append(row)

df = pd.DataFrame(data)

df["roi"] = round(
    df["revenue"] / df["marketing_spend"], 2
)

df.to_csv(
    "data/pharma_sales_data.csv",
    index=False
)

print("Dataset generated successfully!")