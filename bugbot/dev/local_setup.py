import os
from pathlib import Path
from dotenv import load_dotenv

# Path to your .env.dev file

dotenv_path = Path(os.getcwd()) / ".env.dev"

# Load the .env.dev file
load_dotenv(dotenv_path=dotenv_path)