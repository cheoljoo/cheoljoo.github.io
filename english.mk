# English Content Update Makefile
# This makefile automates the process of updating contents2.html with latest English learning content

# Variables
REPO_URL = https://github.com/cheoljoo/english.git
REPO_DIR = english
OUTPUT_FILE = output/articles.html
TARGET_FILE = contents2.html
BACKUP_DIR = backup
TIMESTAMP = $(shell date +%Y%m%d_%H%M%S)

# Default target
.PHONY: all
all: update

# Main update process
.PHONY: update
update: backup clone-or-pull generate-content copy-content cleanup git-commit git-push
	@echo "✅ English content update completed successfully!"
	@echo "📄 Updated file: $(TARGET_FILE)"
	@echo "💾 Backup saved: $(BACKUP_DIR)/$(TARGET_FILE).$(TIMESTAMP)"

# Create backup of current contents2.html
.PHONY: backup
backup:
	@echo "🔄 Creating backup of current $(TARGET_FILE)..."
	@mkdir -p $(BACKUP_DIR)
	@if [ -f $(TARGET_FILE) ]; then \
		cp $(TARGET_FILE) $(BACKUP_DIR)/$(TARGET_FILE).$(TIMESTAMP); \
		echo "✅ Backup created: $(BACKUP_DIR)/$(TARGET_FILE).$(TIMESTAMP)"; \
	else \
		echo "⚠️  No existing $(TARGET_FILE) found to backup"; \
	fi

# Clone repository or pull latest changes
.PHONY: clone-or-pull
clone-or-pull:
	@echo "🔄 Updating English repository..."
	@if [ -d $(REPO_DIR) ]; then \
		echo "📁 Repository exists, pulling latest changes..."; \
		cd $(REPO_DIR) && git pull origin main; \
	else \
		echo "📥 Cloning repository..."; \
		git clone $(REPO_URL); \
	fi
	@echo "✅ Repository updated successfully"

# Generate content using make prompt and make
.PHONY: generate-content
generate-content:
	@echo "🔄 Generating English content..."
	@if [ ! -d $(REPO_DIR) ]; then \
		echo "❌ Repository directory $(REPO_DIR) not found"; \
		exit 1; \
	fi
	@echo "📝 Running 'make prompt' in $(REPO_DIR)..."
	@cd $(REPO_DIR) && make prompt || (echo "❌ 'make prompt' failed" && exit 1)
	@echo "✅ 'make prompt' completed successfully"
	@echo "🔨 Running 'make' in $(REPO_DIR)..."
	@cd $(REPO_DIR) && make recent || (echo "❌ 'make' failed" && exit 1)
	@echo "✅ 'make' completed successfully"
	@echo "📝 Committing changes in $(REPO_DIR)..."
	@cd $(REPO_DIR) && /bin/bash -c "source ~/.bashrc && git add -A && git commit -m '[$(shell date +%Y-%m-%d_%H:%M:%S)] English content generation'"
	@echo "🚀 Pushing changes in $(REPO_DIR)..."
	@cd $(REPO_DIR) && /bin/bash -i -c "source ~/.bashrc && cheoljoopushgithub"
	@echo "✅ English repository updated successfully"

# Copy generated content to target file
.PHONY: copy-content
copy-content:
	@echo "🔄 Copying generated content..."
	@if [ -f $(REPO_DIR)/$(OUTPUT_FILE) ]; then \
		cp $(REPO_DIR)/$(OUTPUT_FILE) $(TARGET_FILE); \
		echo "✅ Content copied successfully: $(REPO_DIR)/$(OUTPUT_FILE) → $(TARGET_FILE)"; \
	else \
		echo "❌ Generated file not found: $(REPO_DIR)/$(OUTPUT_FILE)"; \
		exit 1; \
	fi

# Clean up temporary files (optional)
.PHONY: cleanup
cleanup:
	@echo "🧹 Cleaning up..."
	@# Uncomment the next line if you want to remove the cloned repository after update
	@# rm -rf $(REPO_DIR)
	@echo "✅ Cleanup completed"

# Git commit with today's date
.PHONY: git-commit
git-commit:
	@echo "📝 Committing changes with today's date..."
	@/bin/bash -c "source ~/.bashrc && git commit -a -m '[$(shell date +%Y-%m-%d_%H:%M:%S)] English content update'"
	@echo "✅ Git commit completed"

# Git push using cheoljoopushgithub alias
.PHONY: git-push
git-push:
	@echo "🚀 Pushing changes to GitHub..."
	@/bin/bash -i -c "source ~/.bashrc && cheoljoopushgithub"
	@echo "✅ Git push completed"

# Force clean - removes repository directory
.PHONY: clean
clean:
	@echo "🧹 Force cleaning repository directory..."
	@if [ -d $(REPO_DIR) ]; then \
		rm -rf $(REPO_DIR); \
		echo "✅ Repository directory removed"; \
	else \
		echo "ℹ️  No repository directory to clean"; \
	fi

# Show status
.PHONY: status
status:
	@echo "📊 Status Information:"
	@echo "Repository URL: $(REPO_URL)"
	@echo "Repository Directory: $(REPO_DIR)"
	@echo "Target File: $(TARGET_FILE)"
	@echo "Backup Directory: $(BACKUP_DIR)"
	@echo ""
	@if [ -d $(REPO_DIR) ]; then \
		echo "📁 Repository Status: EXISTS"; \
		echo "📅 Last Modified: $$(stat -c %y $(REPO_DIR) 2>/dev/null || stat -f %Sm $(REPO_DIR) 2>/dev/null || echo 'Unknown')"; \
	else \
		echo "📁 Repository Status: NOT FOUND"; \
	fi
	@echo ""
	@if [ -f $(TARGET_FILE) ]; then \
		echo "📄 Target File Status: EXISTS"; \
		echo "📅 Last Modified: $$(stat -c %y $(TARGET_FILE) 2>/dev/null || stat -f %Sm $(TARGET_FILE) 2>/dev/null || echo 'Unknown')"; \
		echo "📊 File Size: $$(wc -c < $(TARGET_FILE)) bytes"; \
	else \
		echo "📄 Target File Status: NOT FOUND"; \
	fi
	@echo ""
	@if [ -d $(BACKUP_DIR) ]; then \
		echo "💾 Available Backups:"; \
		ls -la $(BACKUP_DIR)/$(TARGET_FILE).* 2>/dev/null || echo "   No backups found"; \
	else \
		echo "💾 Backup Directory: NOT FOUND"; \
	fi

# Restore from backup
.PHONY: restore
restore:
	@echo "🔄 Available backups:"
	@if [ -d $(BACKUP_DIR) ]; then \
		ls -la $(BACKUP_DIR)/$(TARGET_FILE).* 2>/dev/null || (echo "❌ No backups found" && exit 1); \
		echo ""; \
		echo "To restore a specific backup, use:"; \
		echo "  make restore-backup BACKUP=YYYYMMDD_HHMMSS"; \
	else \
		echo "❌ No backup directory found"; \
	fi

# Restore specific backup
.PHONY: restore-backup
restore-backup:
	@if [ -z "$(BACKUP)" ]; then \
		echo "❌ Please specify BACKUP timestamp (e.g., make restore-backup BACKUP=20250804_143000)"; \
		exit 1; \
	fi
	@if [ -f $(BACKUP_DIR)/$(TARGET_FILE).$(BACKUP) ]; then \
		cp $(BACKUP_DIR)/$(TARGET_FILE).$(BACKUP) $(TARGET_FILE); \
		echo "✅ Restored backup: $(BACKUP_DIR)/$(TARGET_FILE).$(BACKUP) → $(TARGET_FILE)"; \
	else \
		echo "❌ Backup file not found: $(BACKUP_DIR)/$(TARGET_FILE).$(BACKUP)"; \
	fi

# Help
.PHONY: help
help:
	@echo "English Content Update Makefile"
	@echo "================================"
	@echo ""
	@echo "Available targets:"
	@echo "  all, update    - Complete update process (default)"
	@echo "  backup         - Create backup of current contents2.html"
	@echo "  clone-or-pull  - Clone or update English repository"
	@echo "  generate-content - Run make prompt and make in English repo"
	@echo "  copy-content   - Copy generated articles.html to contents2.html"
	@echo "  cleanup        - Clean up temporary files"
	@echo "  git-commit     - Commit changes with today's date"
	@echo "  git-push       - Push changes using cheoljoopushgithub alias"
	@echo "  clean          - Force remove repository directory"
	@echo "  status         - Show current status"
	@echo "  restore        - List available backups"
	@echo "  restore-backup - Restore specific backup (use BACKUP=timestamp)"
	@echo "  help           - Show this help message"
	@echo ""
	@echo "Examples:"
	@echo "  make update                                    # Full update"
	@echo "  make status                                    # Check status"
	@echo "  make restore-backup BACKUP=20250804_143000    # Restore backup"
	@echo "  make clean                                     # Clean repository"
	@echo ""
	@echo "Files:"
	@echo "  Source: $(REPO_URL)"
	@echo "  Target: $(TARGET_FILE)"
	@echo "  Backup: $(BACKUP_DIR)/$(TARGET_FILE).TIMESTAMP"

# Error handling for missing dependencies
.PHONY: check-deps
check-deps:
	@echo "🔍 Checking dependencies..."
	@command -v git >/dev/null 2>&1 || (echo "❌ git is required but not installed" && exit 1)
	@command -v make >/dev/null 2>&1 || (echo "❌ make is required but not installed" && exit 1)
	@echo "✅ All dependencies are available"
