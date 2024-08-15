    #!/bin/bash
     
    # Function to remove a directory if it exists
    remove_directory() {
        if [ -d "$1" ]; then
            echo "Removing directory: $1"
            rm -rf "$1"
        else
            echo "Directory not found: $1"
        fi
    }
     
    # Function to remove files found by a search pattern
    remove_files_by_pattern() {
        echo "Searching and removing files matching pattern: $1"
        find ~ -iname "$1" -exec rm -rf {} \;
    }
     
    echo "STEP 1: Uninstalling and Clearing Traces of Apex Legends"
     
    # Prompt the user to manually uninstall Apex Legends via Steam or Origin if not done yet
    echo "Please ensure Apex Legends is uninstalled from Steam or Origin before running this script."
    read -p "Press Enter to continue after uninstalling Apex Legends..."
     
    # Remove game files and directories
    echo "Removing game files and directories..."
    remove_directory "$HOME/.steam/steam/steamapps/common/Apex Legends"
    remove_directory "$HOME/.wine/drive_c/Program Files (x86)/Origin Games/Apex Legends"
     
    # Remove configuration files
    echo "Removing configuration files..."
    remove_directory "$HOME/.steam/steam/userdata/*/570"  # Adjust the app ID if different
    remove_directory "$HOME/.wine/drive_c/users/$USER/Documents/Respawn/Apex Legends"
     
    # Remove Easy Anti-Cheat files
    echo "Removing Easy Anti-Cheat files..."
    remove_directory "$HOME/.steam/steam/steamapps/common/EasyAntiCheat"
    remove_directory "$HOME/.wine/drive_c/Program Files (x86)/EasyAntiCheat"
     
    # Remove residual files in common directories
    echo "Removing residual files in common directories..."
    remove_directory "$HOME/.cache/ApexLegends"
    remove_directory "$HOME/.cache/EasyAntiCheat"
    remove_directory "$HOME/.config/ApexLegends"
    remove_directory "$HOME/.config/EasyAntiCheat"
    remove_directory "$HOME/.local/share/ApexLegends"
    remove_directory "$HOME/.local/share/EasyAntiCheat"
     
    # Clean up system logs and temp files
    echo "Cleaning up system logs and temporary files..."
    sudo rm -rf /var/log/*apex* /var/log/*eac* /var/tmp/*apex* /var/tmp/*eac*
     
    # Use find to locate and remove residual files
    echo "Locating and removing residual files..."
    remove_files_by_pattern "*apex*"
    remove_files_by_pattern "*easyanticheat*"
     
    echo "STEP 1: Uninstalling and Clearing Traces of Apex Legends is complete."