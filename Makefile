.PHONY: all clean build pre-gh-pages post-gh-pages gh-pages

BUILD_DIR = public
DEST_BRANCH = master

all: clean build

clean:
	rm -rfv $(BUILD_DIR)

build:
	gutenberg build

# This target supports the gh-pages target and should not be used directly.
pre-gh-pages:
	# Save a reference to the current branch.
	$(eval SOURCE_BRANCH := $(shell git rev-parse --abbrev-ref HEAD))
	# Checkout the destination branch.
	git checkout $(DEST_BRANCH)
	# Checkout all files known to the source branch into the destination branch.
	git checkout $(SOURCE_BRANCH) -- .
	# Remove files not known to the destination branch from the git index.
	git reset $(DEST_BRANCH)

# This target supports the gh-pages target and should not be used directly.
post-gh-pages:
	# Move all files from the build directory into the current directory.
	cp -rfv $(BUILD_DIR)/* $(BUILD_DIR)/.[^.]* .
	# Remove the now empty build directory.
	rm -rfv $(BUILD_DIR)
	# Clean up all files known to the source branch.
	git ls-tree -r --name-only $(SOURCE_BRANCH) | xargs rm -rfv
	# Add the newly generated content to the index.
	git add -A
	# Generate a commit message with the hash from the source branch.
	git commit -m "Build from `git rev-parse --short $(SOURCE_BRANCH)`"
	# Pop back to our original source branch like nothing ever happened.
	git checkout $(SOURCE_BRANCH)

# The order of these targets matters. This way gh-pages uses the build target.
gh-pages: pre-gh-pages build post-gh-pages
