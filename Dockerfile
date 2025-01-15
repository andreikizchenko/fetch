# Base ruby image
FROM ruby:2.7.6

# Copy project (see .dockerignore for list of excluded files and subdirectories)
COPY . /app

# Add bin path to PATH
ENV PATH="/app/bin:$PATH"

# Set working directory
WORKDIR /app

# Install the gems
RUN bundle config list
RUN bundle install
