import os
import asqlite
import sqlite3

# Step 1: Connect to SQLite database (creates file if it doesn't exist)
conn = sqlite3.connect('./bugbot/tokens.db')  # Use ':memory:' for in-memory DB

# Step 2: Create a cursor object
cur = conn.cursor()

# Step 6: Query the data
cur.execute("SELECT * FROM tokens",)
rows = cur.fetchall()

# Step 7: Print results
for row in rows:
    print(row)

"""
('1383999934', 'sn0ueujx6gfo79xfg59avdh9si2sv3', 'xg79wrpir1fgpo73002q3xtp44h3s0sqq3vv6jop5f76v3vmdu')
('1390389978', 'eflbkizdeei0uzothbi4fidt8rubyx', '2929qnx039kt6vln0jp30ea8guob0nhwu9zfr09src0s8llv7m')
"""