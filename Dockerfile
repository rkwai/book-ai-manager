FROM pandoc/latex:latest

# Install required dependencies
RUN apk add --no-cache \
    bash \
    python3 \
    font-dejavu \
    ttf-dejavu

# Set working directory
WORKDIR /book

# Add helpful labels
LABEL maintainer="Rick Wong"
LABEL description="Build environment for Agents — From Management to AI Agent Management"
LABEL version="2025-agent-edition"
