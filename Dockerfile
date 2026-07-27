FROM python:3.13-slim
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

# Document the default port (optional, Azure overrides anyway)
EXPOSE 5000

# Use Gunicorn and bind to Azure's PORT env variable
CMD ["gunicorn", "--bind=0.0.0.0:${PORT}", "app:app"]
