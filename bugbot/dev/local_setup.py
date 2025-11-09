import os
from pathlib import Path
from dotenv import load_dotenv

# Path to your .env.scripts file

dotenv_path = Path(os.getcwd()) / ".env.scripts"

# Load the .env.scripts file
load_dotenv(dotenv_path=dotenv_path)