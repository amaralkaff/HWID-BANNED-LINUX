    #!/bin/bash
     
    # Function to generate random IDs
    generate_random_id() {
        local length=$1
        tr -dc A-Za-z0-9 </dev/urandom | head -c $length
    }
     
    # Function to create udev rule for a device
    create_udev_rule() {
        local device_type=$1
        local device_id=$2
        local new_serial=$3
        local udev_rule_file="/etc/udev/rules.d/99-custom-hwid.rules"
     
        echo "Creating udev rule for $device_type with new serial $new_serial..."
     
        sudo bash -c "echo 'SUBSYSTEM==\"usb\", ATTR{idVendor}==\"${device_id%:*}\", ATTR{idProduct}==\"${device_id#*:}\", ATTR{serial}=\"$new_serial\"' >> $udev_rule_file"
    }
     
    # Function to change the UUID of a partition
    change_uuid() {
        local partition=$1
        local new_uuid=$2
     
        echo "Changing UUID of $partition to $new_uuid"
        sudo tune2fs -U $new_uuid $partition
    }
     
    # Function to change MAC address
    change_mac_address() {
        local interface=$1
        local new_mac=$2
     
        echo "Changing MAC address of $interface to $new_mac"
        sudo ip link set dev $interface address $new_mac
    }
     
    # Function to change hostname
    change_hostname() {
        local new_hostname=$1
     
        echo "Changing hostname to $new_hostname"
        sudo hostnamectl set-hostname $new_hostname
        echo "127.0.0.1   $new_hostname" | sudo tee -a /etc/hosts
    }
     
    # Example devices (replace these with actual devices you want to modify)
    # Format: idVendor:idProduct
    devices=(
        "045e:07fd"  # Example: Microsoft Xbox Controller
        "046d:c31c"  # Example: Logitech Keyboard
        "046d:c52b"  # Example: Logitech Mouse
    )
     
    # Network interface to change MAC address (replace with your interface)
    network_interface="eth0"
     
    # Partition to change UUID (replace with your partition)
    partition="/dev/sda1"
     
    # New hostname
    new_hostname="NewHostname"
     
    echo "STEP 5: Changing the HWIDs of everything"
     
    # Generate and apply new serial numbers for USB devices
    for device in "${devices[@]}"; do
        new_serial=$(generate_random_id 8)
        create_udev_rule "USB Device" "$device" "$new_serial"
    done
     
    # Change partition UUID
    new_uuid=$(generate_random_id 8)
    change_uuid $partition $new_uuid
     
    # Change MAC address
    new_mac="00:$(generate_random_id 2):$(generate_random_id 2):$(generate_random_id 2):$(generate_random_id 2):$(generate_random_id 2)"
    change_mac_address $network_interface $new_mac
     
    # Change hostname
    change_hostname $new_hostname
     
    echo "Reloading udev rules..."
    sudo udevadm control --reload-rules
    sudo udevadm trigger
     
    echo "STEP 5: Changing the HWIDs of everything is complete."