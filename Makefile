# Build Docker image
docker-build:
	@echo "Building Docker image..."
	docker build -t stm32f4-bootloader-env .

# Start Docker container with mounted project
docker-run:
	@echo "Running Docker container..."
	docker run --rm -it -v ${PWD}:/project stm32f4-bootloader-env

# Clean Docker images (optional)
docker-clean:
	@echo "Removing Docker image..."
	docker rmi stm32f4-bootloader-env

# Build project inside Docker
build:
	@echo "Building project inside Docker..."
	docker run --rm -it -v ${PWD}:/project stm32f4-bootloader-env /bin/bash -c "cd bootloader && make"
	docker run --rm -it -v ${PWD}:/project stm32f4-bootloader-env /bin/bash -c "cd application && make"

# Clean project build files (inside host)
clean:
	@echo "Cleaning build files..."
	@cd bootloader && make clean
	@cd application && make clean

# Full rebuild
rebuild: clean build


