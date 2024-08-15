    #!/bin/bash
     
    # Directory to store EDID files
    edid_dir="$HOME/monitor_edid"
    mkdir -p "$edid_dir"
    cd "$edid_dir"
     
    # Extract the current EDID
    xrandr --verbose | grep -m 1 -A 256 'EDID' | grep -v 'EDID' | xxd -r -p > edid.bin
     
    # Decode the EDID
    edid-decode edid.bin > edid.txt
     
    echo "Current EDID has been extracted and decoded to $edid_dir/edid.txt"
    echo "Please edit this file to modify the monitor's HWID."
    read -p "Press Enter after editing the EDID file..."
     
    # Encode the modified EDID
    xxd -p -r edid.txt > modified_edid.bin
     
    # Apply the modified EDID
    output=$(xrandr --verbose | grep " connected" | cut -d ' ' -f1)
    xrandr --newmode "custom_mode" <mode parameters>
    xrandr --addmode "$output" custom_mode
    xrandr --output "$output" --mode custom_mode --set "EDID" "modified_edid.bin"
     
    echo "Modified EDID has been applied to the monitor."