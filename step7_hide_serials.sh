    #!/bin/bash
     
    # Function to generate random serial numbers
    generate_random_serial() {
        local length=$1
        tr -dc A-Za-z0-9 </dev/urandom | head -c $length
    }
     
    # Function to create udev rule for a device
    create_udev_rule() {
        local device_id=$1
        local new_serial=$2
        local udev_rule_file="/etc/udev/rules.d/99-hide-serial.rules"
     
        echo "Creating udev rule for device $device_id with new serial $new_serial..."
     
        sudo bash -c "echo 'SUBSYSTEM==\"usb\", ATTR{idVendor}==\"${device_id%:*}\", ATTR{idProduct}==\"${device_id#*:}\", ATTR{serial}=\"$new_serial\"' >> $udev_rule_file"
    }
     
    echo "STEP 9: Hide Mouse, Keyboard, and Controller Serial Numbers"
     
    # List of devices to modify (idVendor:idProduct)
    devices=(
        "045e:07fd"  # Example: Microsoft Xbox Controller
        "046d:c31c"  # Example: Logitech Keyboard
        "046d:c52b"  # Example: Logitech Mouse
    )
     
    # Generate and apply new serial numbers for devices
    for device in "${devices[@]}"; do
        new_serial=$(generate_random_serial 12)
        create_udev_rule "$device" "$new_serial"
    done
     
    echo "Reloading udev rules..."
    sudo udevadm control --reload-rules
    sudo udevadm trigger
     
    echo "STEP 9: Hide Mouse, Keyboard, and Controller Serial Numbers is complete."