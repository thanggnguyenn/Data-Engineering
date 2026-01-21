# Docker file v2

# Use the official lightweight Python image. - base image
FROM python:3.13.11-slim 

# Copy uv binary from official uv image (multi-stage build pattern)
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/

# Set the working directory in the container.
WORKDIR /code

# Add virtual environment to PATH so we can use installed packages
ENV PATH="/code/.venv/bin:$PATH"

# Copy dependency files first (better layer caching)
COPY "pyproject.toml" "uv.lock" ".python-version" ./

# Install dependencies from lock file (ensures reproducible builds). to make sure all dependencies are installed in virtual env exactly as specified in the lock file.
RUN uv sync --locked


# copy the script.py file into the container. 1st name is source file, 2nd is destination
COPY ingest_data.py .

# If you used uv to install packages, you can skip this step.
# Install necessary Python packages. execute commands during build
# RUN pip install pandas pyarrow

# specify the entrypoint - default command to run the application
ENTRYPOINT ["python", "ingest_data.py"]
