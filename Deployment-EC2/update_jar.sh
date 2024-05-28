#!/bin/bash

# Set the S3 bucket name and JAR file name
S3_BUCKET="portfolio-madhura"
JAR_FILE="portfolio-0.0.1-SNAPSHOT.jar"

# Define the directory to save the JAR file (e.g., in the home directory)
LOCAL_DIR="/root/jar"

# Ensure the local directory exists
mkdir -p "$LOCAL_DIR"

# Variable to store the previous version of the JAR file
PREVIOUS_VERSION=""

while true; do
    echo "Previous version of the JAR file: $PREVIOUS_VERSION"
    echo "Downloading the latest version info of the JAR file from S3..."
    # Download the latest version info of the JAR file from S3
    aws s3api head-object --bucket "$S3_BUCKET" --key "$JAR_FILE" > /tmp/s3_version.json
    echo "Downloaded the latest version info of the JAR file from S3."

    echo "Getting the version ID of the latest JAR file in S3..."
    # Get the version ID of the latest JAR file in S3
    S3_VERSION=$(jq -r '.VersionId' /tmp/s3_version.json)
    if [ "$S3_VERSION" != "$PREVIOUS_VERSION" ]; then
        echo "Version ID of the latest JAR file in S3: $S3_VERSION"
        echo "New version found!"
        echo "+--------------------------------------------+"
        echo "|                                            |"
        echo "|          New version of JAR found          |"
        echo "|                                            |"
        echo "+--------------------------------------------+"

        PREVIOUS_VERSION="$S3_VERSION"

    if sudo lsof -i :8080 -t >/dev/null; then
        echo "Process using port 8080 found, killing..."
        sudo lsof -i :8080 -t | xargs sudo kill -9
        echo "Process killed."
    else
        echo "No process using port 8080 found."
    fi

        # Step 3: Download and update the JAR file
        echo "Downloading the latest version of the JAR file from S3..."
        aws s3 cp "s3://$S3_BUCKET/$JAR_FILE" "$LOCAL_DIR/$JAR_FILE"
        echo "JAR file updated successfully."

        # Step 4: Run the Java application
        echo "Starting new run..."
        java -jar "$LOCAL_DIR/$JAR_FILE"
    else
        echo "No updates found."
    fi

    echo "Sleeping for 30 seconds before checking again..."
    sleep 30
done
